# Taxi rides analysis based on 2009-2018 TLC and 2014 Uber data

## Data preparation steps

Most steps are taken from https://github.com/toddwschneider/nyc-taxi-data.

All scripts must be run directly from `data/setup/scripts` dir.

1. Download TLC 2009-2018 data by running `download_raw_data.sh`.
2. Download Uber 2014 data by running `download_raw_uber_data.sh`.
3. Clean dirty rows from TLC data by running `remove_bad_rows.sh`
4. Move data to appropriate folders by running `arrange_data.sh`.
