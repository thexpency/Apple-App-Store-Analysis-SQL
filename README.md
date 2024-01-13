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

  
```sql
CREATE TABLE applestore_description_combined AS 
 SELECT * FROM appleStore_description1
UNION ALL
SELECT * FROM appleStore_description2
UNION ALL
SELECT * FROM appleStore_description3
UNION ALL
SELECT * FROM appleStore_description4;
```


### Identifying ou Stakeholder 
For this analysis, the person of interest is an aspiring app developer looking for data driven insight on what app to build on the Apple app store. The programmer is seeking answers to questions like: the most popular categories, condusve price of app and how to maximise user ratings on the app store.

### Exploratory Data Analysis (EDA)
This helps us understand the structure and characteristics of the dataset, and often reveals issues in the dataset that needs to be addressed before further analysis. Exploring the datasets involves answering key questions such as:
1. What is the number of unique apps in both tables.
```sql
SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM applestore_description_combined;
```
  
2. Are there missing values in key fields.
```sql
SELECT COUNT(*) AS MissingValues
FROM AppleStore
WHERE track_name is NULL or user_rating is NULL OR prime_genre IS NULL;

SELECT COUNT(*) AS MissingValues
FROM applestore_description_combined
WHERE app_desc is NULL;
```

3. What is the number of apps per genre.
```sql
SELECT prime_genre, COUNT(*) AS NumberApps
FROM AppleStore
GROUP BY prime_genre 
order BY NumberApps desc;
```

4. What is the overview of app ratings.
```sql
SELECT min(user_rating) AS MinRatings, 
	   max(user_rating) AS MaxRatings,
       avg(user_rating) AS AvgRatings 
from appleStore;
```

### Data Analysis
This includes some interesting codes to help with further exploration of the dataset to provide answers to questions from our stakeholders.

