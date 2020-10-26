# Taxi rides analysis based on 2009-2018 TLC and 2014 Uber data

Code for downloading & merging data of NYC taxi trips for the years of 2009-2018 and creating a representative 2% ~500MB sample for the subsequent analysis.

### Data sources

-   [NYC Taxi & Limousine Commission (TLC) data (2009-present)](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page): current repository uses a subset of available data for 2009-2018 years, but it can be easily extended for other years by modifying `setup/urls/raw_data_tlc_urls.txt`
-   [Uber data (2014-2015)](https://github.com/fivethirtyeight/uber-tlc-foil-response/)

### Data preparation

All scripts must be run from `setup/scripts` directory.

1. Download TLC 2009-2018 data by running `setup/scripts/download_raw_tlc_data.sh`.
2. Download Uber 2014 data by running `setup/scripts/download_raw_uber_data.sh`.
3. Clean dirty rows from TLC data by running `remove_bad_rows.sh`

Many steps were taken from https://github.com/toddwschneider/nyc-taxi-data.

### Data processing & sampling

In `analysis/Merge and sample data.ipynb` the `csv`s are loaded and merged using the [Dask](https://docs.dask.org/en/latest/) library. For TLC data from 2009 until June 2016 and for Uber data from 2014 we have lat/long coordinates for pickups or dropoffs, so those are merged with geozones of NYC taxi zones (see the bottom of TLC webpage) using `geopandas` library. They could also be merged with NYC tracts if you uncomment some blocks of code (or with any other shapes). The shapefiles for taxi zones and tracts are located in `data/shapefiles`.s

After merging the datasets and joining locations with zones/tracts, 2% sampling is performed and only `pickup_datetime, dropoff_datetime, pickup_taxizone, dropoff_taxizone, trip_type` (where `trip type E {fhv, green, yellow, uber`) columns are kept. This in the end results in ~500MB dataset when stored in `.parquet` format or in **45,396,200 trips**.

Some steps were taken from https://github.com/r-shekhar/NYC-transport.

### Data analysis

In `analysis/Analyze data.ipynb` the 2% sample is loaded from `.parquet` file into a Dask dataframe and some exemplar analysis is performed. You can check the yearly distribution of rides and changes in monthly trends for different ride types.
