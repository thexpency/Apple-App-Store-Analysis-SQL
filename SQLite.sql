--We create a table that combines the four tables into one, due to the large data size that not be imported to the SQL.

CREATE TABLE applestore_description_combined AS

SELECT * FROM appleStore_description1

UNION ALL 

SELECT * FROM appleStore_description2

UNION ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4

-- We identity our Stakeholder who is an app developer looking for data drivenn insight to decide what app to build.
-- I CHECK FOR UNIQUE NUMBER OF APPS IN BOTH TABLES (applestore & applestore_description)

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM applestore_description_combined

-- CHECK FOR ANY MISSING VALUES IN KEY FIELDS

SELECT COUNT(*) AS MissingValues
from AppleStore
WHERE track_name is NULL or user_rating is NULL OR prime_genre IS NULL

SELECT COUNT(*) AS MissingValues
from applestore_description_combined
WHERE app_desc is NULL

-- FIND THE NUMBER OF APPS PER GENRE AppleStore

SELECT prime_genre, COUNT(*) AS NumberApps
FROM AppleStore
GROUP BY prime_genre 
order BY NumberApps desc

-- GET AN OVERVIEW OF THE APP RATINGS 

SELECT min(user_rating) AS MinRatings, 
	   max(user_rating) AS MaxRatings,
       avg(user_rating) AS AvgRatings 
from appleStore;
      
**DATA ANALYSIS**
--DETERMINE WHETHER PAID APPS HAVE HIGHER RATINGS THAN FREE APPS.

SELECT CASE
			WHEN price > 0 THEN 'Paid'
            ELSE 'Free'
	   END as App_Type,
       avg(user_rating) as AvgRatings
FROM AppleStore
GROUP by App_Type;

--CHECK IF APPS WITH MORE SUPPORTED LANGUAGES HAVE HIGHER RATINGS:

SELECT CASE
			WHEN lang_num < 10 THEN '<10 Languages'
            when lang_num BETWEEN 10 and 30 then '10-30 Languages'
            ELSE '>30 Languages'
	   end as Language_Bucket, 
       avg(user_rating) as Avg_Rating
FROM AppleStore
GROUP by Language_Bucket
order by Avg_Rating DESC;

-- CHECK GENRES WITH LOW RATINGS TO FIGURE OUT SATISFACTION OF USERS.

SELECT prime_genre,
	   avg(user_rating) as Avg_Rating
FROM AppleStore
GROUP BY prime_genre
ORDER BY Avg_Rating ASC
LIMIT 10;

-- CHECK IF THERE IS CORRELATION BETWEEN THE LENTH OF THE APP DESCRIPTION AND USER RATINGS 

SELECT CASE
		    when length(b.app_desc) <500 then 'Short'
            when length(b.app_desc) BETWEEN 500 and 1000 then 'Medium'
            ELSE 'Long'
       end as Description_length_Bucket,
       avg(a.user_rating) as Avg_Rating

FROM 
	AppleStore AS a

JOIN 
	applestore_description_combined as b 
on 
	a.id = b.id 
    
GROUP BY Description_length_Bucket
ORDER BY Avg_Rating DESC;

-- CHECK THE TOP RATED APPS FOR EACH GENRE

SELECT 
	  prime_genre,
      track_name,
      user_rating
      
from (
	  select 
  	  prime_genre,
      track_name,
      user_rating,
	  RANK() OVER(PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS RANK
	  FROM 
	  AppleStore
	  ) AS a
      
WHERE
	a.RANK = 1
  
  		





