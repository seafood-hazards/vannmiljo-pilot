# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Quarto website (source for https://seafood-hazards.github.io/vannmiljo-pilot/) documenting a pilot database design built from the Vannmiljø sediment dataset. Content lives in `.qmd` files at the repo root; there is no application code, test suite, or linter.

## Commands

```r
renv::restore()   # install R packages pinned in renv.lock (run once after clone)
```

```bash
quarto render              # build the full site into _site/
quarto render index.qmd    # build a single page
quarto preview              # live-reload local preview
```

`download_resources.R` runs automatically as a Quarto pre-render step: it fetches `pilot_vannmiljo.sqlite` and the sql.js/stratum-sqlite JS libs into `libs/sqljs/` if not already present. Both are gitignored — don't commit them.

## Architecture

- `_quarto.yml` — site config: nav structure, render order, R execution options (`echo: false`). Add new pages to both the filesystem and this nav.
- Each `.qmd` is a standalone page combining Markdown, R chunks, and Observable JS (`{ojs}`) chunks.
- In-browser SQL: pages query `pilot_vannmiljo.sqlite` client-side via sql.js + stratum-sqlite (loaded from `libs/sqljs/`) and post-process results with the `arquero` JS library — no server/backend. `header.html` (injected site-wide via `include-in-header`) resolves the site root and sets `window._sqljsBase`/`window._dbPath`; `_db-setup.qmd` opens the DB connection from those globals and is included by pages that need it (e.g. `index.qmd`, `pilot-db-viewer.qmd`, `sediment-map.qmd`).
- `db-schema.qmd` documents the DB's ER design (diagram in `image/`); `data-preparation.qmd` documents how source Vannmiljø exports were transformed into the sqlite DB.
- Deployment: `.github/workflows/publish.yml` renders the site with Quarto and deploys `_site/` to GitHub Pages on every push to `main`.

## Workflow

- Gitflow branching (`main`, `develop`, `feature/*`, `release/*`). Merge feature branches directly into `develop` and delete them — no PR needed.
- Releases follow Keep a Changelog in `CHANGELOG.md`, tagged `vX.Y.Z` (see git tags).
