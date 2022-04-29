

   --                                            ``` Project-1 ```


 -- Business model Customer to Customer (C2C) allows customers to do business with each other.
 -- This model is growing fast with e-commerce platforms where sellers may be required to pay some amount and buyer can buy it without 
 -- paying anything. E-Commerce website brings the seller and buyer to the same platform. 

-- Analyzing the user's database will lead to understanding the business perspective. Behavior of the users can be traced 
-- in terms of business with exploration of the user’s database. 

-- Dataset: One .csv file with name users_data with 98913 rows and 27 columns

-- Tasks to be performed

-- 1. Create new schema as ecommerce.

create database ecommerce;

-- 2. Import .csv file users_data into MySQL.
-- Step1 -> Create a Database
-- Step2 -> import csv file into the database.
-- step3 -> Go the Schema and click right there select 'Table data import wizard' again Browse the selective file after next option to import the csv file data 
-- step4 -> Importing was Success and now use the database.
     use ecommerce;
-- 3. Run SQL command to see the structure of table.

use ecommerce;
desc users_data;

-- 4. Run SQL command to select first 100 rows of the database.
 
 select * from users_data limit 100;
 
-- 5. How many distinct values exist in table for field country and language.

select * from users_data;
select count(distinct country), count(distinct language) from users_data;

-- 6. Check whether male users are having maximum followers or female users.

select gender,max(socialNbFollowers) from users_data group by gender;

-- 7. Calculate the total users those,
-- >     a. Uses Profile Picture in their Profile.
-- >	 b. Uses Application for Ecommerce platform.
-- >	 c. Uses Android app.
-- >	 d. Uses ios app.
     select * from users_data;
  select count(hasProfilePicture) from users_data where hasProfilePicture = 'True';
  select count(hasAnyApp) from users_data where hasAnyApp = 'True';
  select count(hasAndroidApp) from users_data where hasAndroidApp = 'True';
  select count(hasIosApp) from users_data where hasIosApp = 'True';
     
-- 8. Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.

desc users_data;
select count(productsBought),country from users_data where productsBought group by country order by count(productsBought) desc;
 
-- 9. Calculate the average number of sellers for each country and sort the result in ascending order of total number of sellers.

select avg(productsSold),country from users_data where productsSold group by country order by count(productsSold) asc;

-- 10. Display name of top 10 countries having maximum products pass rate.
desc users_data;
select * from users_data;
select distinct(country) country ,max(productspassrate) from users_data group by country order by  max(productspassrate) desc limit 10;

-- 11. Calculate the number of users on an ecommerce platform for different language choices.

select count(hasanyapp) users, language from users_data where hasanyapp= 'True' group by language;

-- 12. Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.

select * from users_data;

select sum(productswished),sum(socialproductsliked) from users_data where gender = "F" and hasanyapp='True';

-- 13. Check the choice of male users about being seller or buyer.

SELECT 
    COUNT(productssold) productssold
FROM
    users_data
WHERE
    gender = 'M' AND productsSold  
UNION SELECT 
    COUNT(productsBought) productsbought
FROM
    users_data
WHERE
    gender = 'M' AND productsBought;


-- 14. Which country is having maximum number of buyers?

select * from users_data;
select productsbought,country from users_data where productsbought=(select max(productsbought) from users_data) group by country;

-- 15. List the name of 10 countries having zero number of sellers.

select distinct(country),productsSold from users_data where productsSold = 0 limit 10;

-- 16. Display record of top 110 users who have used ecommerce platform recently.

select * from users_data  where hasanyapp='true'order by seniority desc limit 110; 

-- 17. Calculate the number of female users those who have not logged in since last 100 days.

select count(type) gender from users_data where gender='F'and dayssincelastlogin >=100;

-- 18. Display the number of female users of each country at ecommerce platform.

select count(type) female_users ,country from users_data where hasanyapp= 'true' and gender='F' group by country;

-- 19. Display the number of male users of each country at ecommerce platform.

select count(type) male_users ,country from users_data where hasanyapp='true'and gender='M' group by country;

-- 20. Calculate the average number of products sold and bought on ecommerce platform by male users for each country.

select country,avg(productsSold) sold ,avg(productsBought) bought  from users_data where gender="M" and hasanyapp = 'True' group by country;

