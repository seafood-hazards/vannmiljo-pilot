# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
As this project is still in active development, it does not yet strictly adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.25] - 2026-09-07
### Added
- Home page links to the [multised-summary](https://seafood-hazards.github.io/multised-summary/) site, the plain-English layer over the refined results. `_generations.qmd` gains a paragraph after the generations table saying what it is and what it is not: not a sixth generation, no database of its own, and it computes nothing, since every number on it is read from a file the pipeline wrote

### Changed
- Browser database cache key is now the first 12 hex characters of the database file's md5, computed at render time, rather than the release tag. The database is re-uploaded onto the existing latest release, so a tag-derived key never moved when the file did, and returning visitors kept serving the previous database out of browser cache

### Removed
- Distance to Coast, Location Names and Interactive Map pages, and the Geospatial Analysis navbar menu they formed. The pilot stage no longer derives location: clean step 4 recomputes and overwrites all five columns, so the pilot values never reached a later generation. The columns stay in the pilot schema, marked as filled at the clean stage

### Fixed
- Navbar YAML that the distance-menu removal broke, which failed `quarto render` on every page with an indentation error

## [0.1.24] - 2026-08-07
### Changed
- **Geospatial columns recomputed with [seastamp](https://github.com/AIQC-Hub/seastamp)**, the tool the whole pipeline now uses, replacing the earlier `sf` / `rnaturalearth` / `giscoR` implementation. Across the 21,300 distinct site positions: `dist_to_coast` moves by a median of 0.02 km, `municipality` is reassigned for 2,629, `sea_name` for 21,287, and `country` for 16
- `sea_name` now resolves to IHO sea areas (Barentsz Sea, Greenland Sea, North Sea, Norwegian Sea, Skagerrak) instead of ocean basins only
- `country_code` is now ISO 3166-1 alpha-3 (`NOR`) rather than alpha-2 (`NO`)
- Distance Calculation and Estimation of Location Names pages rewritten for the seastamp method and data sources
- Site table schema describes the source and units of each geospatial column

### Fixed
- Six sites whose source coordinates place them near the equator were reported as 3,965 km from the coast, measured against the Norwegian coastline crop. They now report the distance to the coast they are actually nearest, and the Distance Calculation page explains that the coordinates themselves are wrong

## [0.1.23] - 2026-08-07
### Added
- Pipeline Generations section on the home page (`_generations.qmd`), with links to the other four pilot sites and to the slim, clean, merged and refined generation sites

### Changed
- Database file renamed from `pilot_vannmiljo.sqlite` to `vannmiljo_pilot.sqlite`, matching the engine's `<source>_pilot.sqlite` convention
- Database is downloaded from the latest GitHub release instead of a pinned release tag, so no version string has to be edited when a new database is published
- Database Downloads page lists the single pilot database and links to the latest release
- Sediment Fractions moved to the DB Design menu, and the Data Export menu renamed to EFSA Submission
- CLAUDE.md reduced to the site's invariants, with the detail moved to `docs/database.md` and `docs/site.md`

### Removed
- Export to Tabular File page: the pilot generation no longer exports dataset files
- DB Schema (Slim) page and the slim database download, which belong to the slim generation's own site

## [0.1.22] - 2026-07-24
### Added
- Database Downloads page with links to the full and slim SQLite database releases

## [0.1.21] - 2026-07-17
### Changed
- rounded site coordinates to three decimal places in DB Schema (Slim) page

## [0.1.20] - 2026-07-13
### Fixed
- GitHub Pages deployment failure caused by dplyr missing from renv.lock

## [0.1.19] - 2026-07-13
### Fixed
- typos in EFSA format/submission v1 pages

## [0.1.18] - 2026-07-13
### Added
- EFSA format and submission pages (v1 and v2)
- DB Schema (Slim) page for the common multi-source schema
- CLAUDE.md and Gitflow documentation in README

## [0.1.17] - 2026-05-07
### Fixed
- average calculation for the interactive map

## [0.1.16] - 2026-04-26
### Added
- coordinate transformation section

### Changed
- dry weight unit t.v. to dw

## [0.1.15] - 2026-04-26
### Removed
- image files of distances to coast

### Changed
- all renv entries

### Fixed
- table column format

## [0.1.14] - 2026-04-22
### Changed
- section numbers in grain fraction page

## [0.1.13] - 2026-04-21
### Added
- detailed explanation of grain-size issues

## [0.1.12] - 2026-04-18
### Changed
- latitude and longitude order
- data sources from data file to db

### Added
- link to GitHub on menu

## [0.1.11] - 2026-04-16
### Added
- Interactive sediment map

### Changed
- data source for interactive site map

## [0.1.10] - 2026-04-11
### Changed
- sql interface from sqljs to stratum toolset

## [0.1.9] - 2026-04-11
### Changed
- sql interface from sqljs to stratum toolset

## [0.1.8] - 2026-04-08
### Added
- sqljs interface

## [0.1.7] - 2026-04-01
### Fixed
- Renv snapshot

## [0.1.6] - 2026-04-01
### Added
- Particle fraction content

## [0.1.5] - 2026-03-22
### Fixed
- Activity summary table removed 

## [0.1.4] - 2026-03-22
### Added
- DT count table in the landing page

## [0.1.3] - 2026-03-22
### Fixed
- renv lock file

## [0.1.2] - 2026-03-22
### Added
- All basic Quarto pages

## [0.1.1] - 2026-03-21
### Fixed
- Repo and project name

## [0.1.0] - 2026-03-21
### Added
- Initial Quarto pages for home and db schema

