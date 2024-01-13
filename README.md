# Apple App Store Analysis

### Project Overview
This project provides a comprehensive dataset sourced from the Apple App Store, encompassing key metrics for app developers to make informed decisions. The dataset includes information on app type, user ratings, genre, app descriptions, and the number of languages supported. The analysis aims to provide insight on the sales, categories, performance and user ratings, that would help and app developer make data driven decision on which app to build. 

### Data  Source
- Apple Store Data: The primary dataset for the analysis is "AppleStore.csv" file, which contains information on apps on the aple storesuch as: app names, sizing bytes, ratings, supporting device, and supporting languages.
- Apple Store Description: The secondary dataset "appleStore_description.csv" also gives us an overview of each app description, and the perceverence in the store.

### Tools
- Excel- Data Cleaning 
- SQLite Server- An [online SQLserver](https://sqliteonline.com/) for data analysis.

### Connecting to the Dataset
- With [SQLite online](https://sqliteonline.com/) we connect our "AppleStore.csv" dataset directly by importing, without having to download or install any software.
- The online SQL server has a limit of 4 megabytes, so we split our "appleStore_description.csv" dataset into four little sizes before importing to the server.
- We also use the powerful "UNION ALL" feature to combine our seperated tables back to a single one.
