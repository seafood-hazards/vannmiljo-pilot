# Database

`vannmiljo_pilot.sqlite` is the **only** file this site depends on. It is built
by the `multised-engine` package (`create_db("pilot", "vannmiljo")`), not in this
repository, and is published as an asset on this repository's latest GitHub
release.

The name changed from `pilot_vannmiljo.sqlite` at site v0.1.23, matching the
engine's `<source>_pilot.sqlite` convention.

## Schema

Ten tables. All access is client-side, through stratum-sqlite.

| Table | PK | Rows | Notes |
|---|---|--:|---|
| `site` | `site_code` | 24,330 | lat, lon, dist_to_coast, country, country_code, municipality, sea_name |
| `sample` | `sample_id` | 45,852 | upper_depth, lower_depth, sample_time, filtered; FKs to activity, site, client, contractor, sample_method |
| `sediment` | `sample_id, param_id, sediment_no` | 238,254 | value, operator, sample_no, n_values |
| `lld` | `sample_id, param_id, sediment_no, type` | 54,952 | Lower Level of Detection, keyed alongside `sediment` |
| `parameter` | `param_id` | 50 | param_name, cas_no |
| `analysis_method` | `analysis_id` | 31 | analysis, unit |
| `activity` | `activity_id` | 31 | activity_name; the monitoring programme a sample belongs to |
| `client` | `client_id` | 1,289 | client, archive |
| `contractor` | `contractor_id` | 307 | |
| `sample_method` | `method_id` | 9 | |

Site coordinates are rounded to 3 decimal places. The raw export gives positions
in UTM zone 33; the engine reprojects them to longitude and latitude with `sf`.

`db-schema.qmd` renders the ER diagram and the full column definitions;
`data-preparation.qmd` documents how the raw Vannmiljø exports were transformed
before import; `sediment-fractions.qmd` documents how the overlapping raw
grain-size parameters are resolved into standardised fractions.

## Querying it from a page

Every page that reads the database includes `_db-setup.qmd`:

```qmd
{{< include _db-setup.qmd >}}
```

`header.html` sets `window._stratumSQLite`, `window._dbPath` and
`window._sqljsBase` at page load; `_db-setup.qmd` opens the file and exposes it
as `db`, which is then available to every OJS block on that page. Results are
post-processed with the arquero JS library.

**One database per page.** Opening a second one on the same page fails.

## The cache key

stratum-sqlite caches the database in the browser, keyed by the `cacheKey` in
`_db-setup.qmd` (`vannmiljo-pilot@vX.Y.Z`). Whenever the database **content**
changes, bump that key, or returning browsers keep serving the stale cached copy
and queries fail with "no such column".

This is the one version string that still has to be edited by hand; the download
URLs resolve to the latest release on their own.

## Scope

This site documents the **pilot** generation only. The slim, clean, merged and
refined generations have their own sites, and nothing here should link to their
schemas or ship their database files.
