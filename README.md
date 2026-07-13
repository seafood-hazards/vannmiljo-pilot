# Vannmiljø Pilot Database

[![DOI](https://zenodo.org/badge/1186225347.svg)](https://doi.org/10.5281/zenodo.19152214)

This repository contains the source Quarto Markdown documents for the [Vannmiljø Pilot Database](https://seafood-hazards.github.io/vannmiljo-pilot/) website.

## License
This project is licensed under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.

## Data source
The original data used in this project is available on the [Vannmiljø](https://vannmiljo.miljodirektoratet.no) website.

## Reproducibility

This project is designed to be fully reproducible. All required R package versions are recorded using [renv](https://rstudio.github.io/renv/), ensuring a consistent computational environment.

To reproduce the analysis and website locally:

 1. Clone the repository
 2. Open the project in R
 3. Restore the package environment:

```R
renv::restore()
```

 4. Render the website:

Use the ``Render Website`` option in RStudio. 

> [!Note]
> The website deployed on GitHub Pages is automatically built using the same workflow and environment configuration.

## Branching

This repository follows [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/): `main` holds released versions, `develop` is the integration branch, and work happens on `feature/*` branches merged into `develop` (no pull request required). Releases are cut via `release/*` branches merged into both `main` and `develop`, tagged `vX.Y.Z`, and logged in [CHANGELOG.md](CHANGELOG.md).
