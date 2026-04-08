options(timeout = 600)

# ── TSV data ────────────────────────────────────────────────────────
data_file_url <- "https://github.com/seafood-hazards/vannmiljo-pilot/releases/download/v0.1.5/pilot_vannmiljo_all.tsv.gz"
local_data_file_name <- "pilot_vannmiljo_all.tsv.gz"
if (!file.exists(local_data_file_name)) {
  options(timeout = 600)
  download.file(data_file_url, destfile = local_data_file_name, mode = "wb")
  message("Database downloaded.")
} else {
  message("Using existing local database.")
}

# ── SQLite database ────────────────────────────────────────────────────────
db_url <- "https://github.com/seafood-hazards/vannmiljo-pilot/releases/download/v0.1.5/pilot_vannmiljo.sqlite"
local_db_file_name <- "pilot_vannmiljo.sqlite"
if (!file.exists("pilot_vannmiljo.sqlite")) {
  download.file(db_url, local_db_file_name, mode = "wb")
  message("Database downloaded.")
} else {
  message("Using existing database.")
}

# ── sql.js (JS glue + WASM binary) ────────────────────────────────────────
# Downloaded once to the project so the rendered site has zero CDN dependencies.
sqljs_dir <- "libs/sqljs"
dir.create(sqljs_dir, recursive = TRUE, showWarnings = FALSE)
base_url <- "https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.10.3/"
for (f in c("sql-wasm.js", "sql-wasm.wasm")) {
  dest <- file.path(sqljs_dir, f)
  if (!file.exists(dest)) {
    download.file(paste0(base_url, f), dest, mode = "wb")
    message(f, " downloaded.")
  }
}
