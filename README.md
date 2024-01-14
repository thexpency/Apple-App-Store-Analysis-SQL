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
This includes some interesting codes to help with further exploration of the dataset to provide answers to our stakeholders with questions such as:
- Determine if paid apps have higher ratings than free apps
- Determine if apps with more supported languages have higher ratings.
- What genre have higher ratings.
- What is the correlation between the length of descrption and the user ratings.
- What are the top rated apps for each genre.

**Note**- All codes can be found on the "SQLite.sql" file

### Results
- Paid apps have higher ratings than free apps
- Apps with about 10-30 supportd languages have higher ratings.
- The catalog and finance genre has less ratings.
- The longer the description of an app, the better the ratings
- The top rated apps for each genre are business, catalogs, education, entertainment, and finance.

### Final Recommendations
- Paid apps generally archieve slightly higher ratings than their free counterparts, as users would pay for apps with higher engagement to perceive more value, which may lead to higher ratings. An app developer should consider charging for their app if the app is considered good.
- The app developer should focus on the right set of languages between 10 to 30, as that is the best range of supported languages for app with better ratings.
- The finance and catalogs apps have low ratings because the user needs are not met, this is a niche the app developer should consider to explore.
- A well-crafted app description can set clear expectations and eventually increase the satisfaction of users, so apps with longer descriptions have better ratings.
- Every app developer should aim above the average rating of 3.5 in order to stand out.
- The games and entertainment categories are very saturated, leading to high competition within the sector. However, the genres have high demand.

