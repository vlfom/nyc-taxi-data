#!/bin/bash

mkdir ../../data/raw_data
cat ../urls/raw_data_tlc_urls.txt | xargs -n 1 -P 6 wget -c -P ../../data/raw_data/tlc_data/