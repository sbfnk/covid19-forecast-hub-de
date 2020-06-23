#!/usr/bin/env bash

# update truth
cd ./code/auto_download

# update and process ECDC truth
python3 ./ecdc_download.py
sleep 5
python3 ./ecdc_preprocessing.py
echo "ECDC done"

# update and process jhu truth
python3 ./jhu_download.py
sleep 5
python3 ./jhu_preprocessing.py
echo "JHU done"

cd ../../

# validate file names
echo "TESTING FILENAMES..."
Rscript code/validation/validate_filenames.R

# test covid forecast submission formatting
echo "TESTING SUBMISSIONS..."
python3 code/validation/test-formatting.py
