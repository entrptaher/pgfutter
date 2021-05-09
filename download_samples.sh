#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

CWD=$(pwd)
SAMPLES_DIR="$CWD/samples"

function download_json_samples() {
    mkdir -p "$SAMPLES_DIR"
    cd "$SAMPLES_DIR"
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/json_sample_2015-01-01-15.json
    cd "$CWD"
}

function download_csv_samples() {
    mkdir -p "$SAMPLES_DIR"
    cd "$SAMPLES_DIR"
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_distribution_of_wealth_switzerland.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_employee_salaries.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_local_severe_wheather_warning_systems.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_montgomery_crime.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_qip12_tabdaten.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_residential_permits.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_sacramentocrime_jan_2006.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_sacramento_realestate_transactions.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_sales_jan_2009.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_steuertarife.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_techcrunch_continental_usa.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_vermoegensklassen.csv
    wget -nc https://github.com/raginjason/pgfutter/releases/download/v1.3-alpha/csv_sample_metadatenbank.csv
    cd "$CWD"
}

function verify_checksums() {
    cd "$SAMPLES_DIR"
    shasum -c checksums.sha1
    cd "$CWD"
}

download_json_samples
download_csv_samples
verify_checksums
