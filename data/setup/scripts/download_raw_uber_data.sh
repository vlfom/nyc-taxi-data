#!/bin/bash

cat ../urls/raw_uber_data_urls.txt | xargs -n 1 -P 6 wget -c -P uber_data/

cd uber_data
unzip uber-raw-data-janjune-15.csv.zip
rm -rf __MACOSX/
cd ..