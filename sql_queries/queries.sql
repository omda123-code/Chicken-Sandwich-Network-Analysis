use chick
select top 2 * from chickfilaData

------- q01 - How many restaurant locations are there in each state?
select state,
count(*) as Num_locations
from chickfilaData
group by state 
order by Num_locations desc;

-------- q02 - What is the average cost of a chicken sandwich per state?
select state,
avg(cost_of_chicken_sandwich) as avg_price
from chickfilaData
group by state
order by avg_price desc;

--------- q03 - How many locations offer each service (Mobile Orders, Catering, Pickup, Delivery, WiFi, Playground, Breakfast, Drive-thru)?
select sum(case when Mobile_Orders='True' then 1 else 0 end) as mobile_orders,
sum(case when Catering='True' then 1 else 0 end) as Catering,
sum(case when Pickup = 'True' then 1 else 0 end) as Pickup,
sum(case when Delivery = 'True' then 1 else 0 end) as Delivery,
sum(case when WiFi= 'True' then 1 else 0 end) as WiFi,
sum(case when Playground = 'True' then 1 else 0 end) as Playground,
sum(case when Breakfast_served = 'True' then 1 else 0 end) as Breakfast_served,
sum(case when Drive_thru = 'True' then 1 else 0 end) as Drive_thru
from chickfilaData;

-------- q04 - Which locations offer all service?
select *
from chickfilaData
where Mobile_Orders='True' and Catering='True' and Pickup='True' and Delivery='True' and WiFi='True' 
and Playground = 'True' and Breakfast_Served='True' and Drive_thru='True';

-------- q05 - How many locations offer both delivery and drive-thru?
select *
from chickfilaData
where Delivery='True' and Drive_thru='True';

--------- q06 - Which 5 locations have the most expensive chicken sandwiches?
select top 5 location,
state,
cost_of_chicken_sandwich
from chickfilaData
order by cost_of_chicken_sandwich desc;

---------- q07 - Does serving breakfast affect the average cost of chicken sandwiches?
select Breakfast_Served,
avg(cost_of_chicken_sandwich) as avg_price
from chickfilaData
group by Breakfast_Served;

------------ q08 - How does sandwich price differ between locations with WiFi and without WiFi?
select WiFi,
avg(cost_of_chicken_sandwich) as avg_price
from chickfilaData
group by WiFi;

------------ q09 - Do locations with playgrounds charge more on average?
select Playground,
avg(cost_of_chicken_sandwich) as avg_price
from chickfilaData
group by Playground;

-------- q10 - How many services does each location offer?
select id,
location,
(case when Mobile_Orders='True' then 1 else 0 end+case when Catering='True' then 1 else 0 end 
+case when Pickup='True' then 1 else 0  end +case when Delivery='True' then 1 else 0 end+ case when WiFi='True' then 1 else 0 end 
+ case when Playground='True' then 1 else 0 end  + case when Breakfast_served='True' then 1 else 0 end
+case when Drive_thru='True' then 1 else 0 end ) as Num_services
from chickfilaData;

------- q11 - Is there a correlation between number of services and sandwich price?
select id,
location,
cost_of_chicken_sandwich ,
(case when Mobile_Orders='True' then 1 else 0 end+case when Catering='True' then 1 else 0 end 
+case when Pickup='True' then 1 else 0  end +case when Delivery='True' then 1 else 0 end+ case when WiFi='True' then 1 else 0 end 
+ case when Playground='True' then 1 else 0 end  + case when Breakfast_served='True' then 1 else 0 end
+case when Drive_thru='True' then 1 else 0 end ) as Num_services
from chickfilaData;

------- q12 - How many locations serve breakfast but do not have drive-thru ?
select *
from chickfilaData
where Breakfast_Served = 'True' and Drive_thru = 'False';

--------- q13 - Which service is most and least common across all locations?
SELECT 'Mobile_Orders' AS service, SUM(CASE WHEN Mobile_Orders='TRUE' THEN 1 ELSE 0 END) AS count FROM chickfilaData 
UNION ALL SELECT 'Catering', SUM(CASE WHEN Catering='TRUE' THEN 1 ELSE 0 END) FROM chickfilaData
UNION ALL SELECT 'Pickup', SUM(CASE WHEN Pickup='TRUE' THEN 1 ELSE 0 END) FROM chickfilaData 
UNION ALL SELECT 'Delivery', SUM(CASE WHEN Delivery='TRUE' THEN 1 ELSE 0 END) FROM chickfilaData
UNION ALL SELECT 'WiFi', SUM(CASE WHEN WiFi='TRUE' THEN 1 ELSE 0 END) FROM  chickfilaData
UNION ALL SELECT 'Playground' , SUM(CASE WHEN Playground='TRUE' THEN 1 ELSE 0 END) FROM chickfilaData
UNION ALL SELECT 'Breakfast_served' , SUM(CASE WHEN Breakfast_served='TRUE' THEN 1 ELSE 0 END) FROM chickfilaData
UNION ALL SELECT 'Drive_thru' , SUM(CASE WHEN Drive_thru='TRUE' THEN 1 ELSE 0 END) FROM chickfilaData