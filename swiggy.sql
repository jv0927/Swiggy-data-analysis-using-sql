SELECT * FROM swiggy.swiggy;

#1)how many resturants have rating >4.5
select count(distinct restaurant_name)
from swiggy
where rating>4.5;

#2)top 1 city with highest number of resturants
SELECT CITY,COUNT(distinct restaurant_name) AS restaurant
FROM swiggy
GROUP BY CITY
ORDER BY restaurant desc
limit 1;

#3)how many resturants have word pizza in their name
SELECT COUNT(distinct restaurant_name) AS PIZZA_NAME
FROM swiggy
WHERE restaurant_name LIKE "%PIZZA%";

#4 WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATA SET

SELECT CUISINE,COUNT(CUISINE) AS CUSINE 
FROM swiggy
GROUP BY CUISINE
ORDER BY CUSINE DESC
LIMIT 1;

#5 WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY

SELECT CITY, AVG(RATING) AS RATE
FROM swiggy
GROUP BY CITY
ORDER BY RATE DESC;

#6 WHAT IS THE HIGHEST PRIZE OF THE ITEM UNDER THE RECOMMENDED
# MENU CATEGORY FOR EACH RESTAURANT

SELECT RESTAURANT_NAME,MENU_CATEGORY,ITEM,MAX(PRICE)AS PR
FROM
(SELECT * 
FROM SWIGGY 
WHERE MENU_CATEGORY="RECOMMENDED") T
GROUP BY RESTAURANT_NAME
ORDER BY PR DESC;

#7)FIND TOP 5 MOST EXPENSIVE RESTURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUSINE
SELECT DISTINCT restaurant_name,COST_PER_PERSON
FROM swiggy
WHERE cuisine NOT LIKE "%INDIAN%"
ORDER BY COST_PER_PERSON DESC
LIMIT 5;

#8)FIND THE RESTAURANTS THAT HAVE AN AVERAGE 
#COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS
WITH AB AS(
 SELECT AVG(COST_PER_PERSON) AS AVG1
 FROM swiggy)

SELECT DISTINCT restaurant_name,COST_PER_PERSON
FROM swiggy
JOIN AB
ON SWIGGY.COST_PER_PERSON > AB.AVG1;

#9)retrieve the names of restuarant that have same same but are located in 
#different cities

select restaurant_name,count(distinct city) as dcity
from swiggy
group by restaurant_name
having count(distinct city)>1;

#10)which restaurant offer most number of items in the main course category 
with ad as (
SELECT *
FROM swiggy
where menu_category = "Main Course")

select restaurant_name,count(distinct item) as count_of_distinct_item
from ad
group by restaurant_name
ORDER BY count_of_distinct_item desc
limit 1;

#11)list the name of restaurant which is 100% vegetarian
 #and arange it by albhabetically of the restaurant name
 
select distinct restaurant_name,
 (count(case when veg_or_nonveg ='Veg' THEN 1 end)/count(*)*100)as veg_per
 from swiggy
 group by restaurant_name
 having veg_per=100.00
 order by restaurant_name;
 
#12)which restuarant provide lowest averge prize for item 
select restaurant_name,avg(price) as aprize
from swiggy
group by restaurant_name
order by aprize
limit 1;

#13)top 5 restaurant that provide highest number of category

select distinct restaurant_name,count(distinct menu_category) as dcategory
from swiggy
group by restaurant_name 
order by dcategory desc
limit 5;

#14 )which restaurant provide highest number of nonvegetarian food

select restaurant_name,
(count(case when veg_or_nonveg='Non-veg' Then 1 else 0 end)/count(*)*100) as non
from swiggy
group by restaurant_name
order by non desc
limit 1;


 
  
 

 


