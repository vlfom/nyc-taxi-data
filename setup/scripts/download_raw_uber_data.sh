#!/bin/bash

cat ../urls/raw_uber_data_urls.txt | xargs -n 1 -P 6 wget -c -P ../../data/raw_data/uber_data/

unzip ../../data/raw_data/uber_data/uber-raw-data-janjune-15.csv.zip
rm -rf ../../data/raw_data/uber_data/__MACOSX