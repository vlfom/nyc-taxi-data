#!/bin/bash

mkdir -p ../../data/raw_data/tlc_data/unaltered

mv ../../data/raw_data/tlc_data/yellow_tripdata_2010-02.csv ../../data/raw_data/tlc_data/yellow_tripdata_2010-03.csv tlc_data/unaltered/

sed -E '/(.*,){18,}/d' ../../data/raw_data/tlc_data/unaltered/yellow_tripdata_2010-02.csv > ../../data/raw_data/tlc_data/yellow_tripdata_2010-02.csv
sed -E '/(.*,){18,}/d' ../../data/raw_data/tlc_data/unaltered/yellow_tripdata_2010-03.csv > ../../data/raw_data/tlc_data/yellow_tripdata_2010-03.csv