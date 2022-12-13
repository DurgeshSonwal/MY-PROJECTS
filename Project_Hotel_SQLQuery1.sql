-- Combine all the tables of year 2018, 2019 & 2020 and name them as 'hotels'

with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

-- revenue by year without discount

select arrival_date_year,
sum((stays_in_week_nights+stays_in_weekend_nights)*adr) as revenue
from hotels
group by arrival_date_year


-- revenue by hotel_name & year without discount

select arrival_date_year, hotel,
sum((stays_in_week_nights+stays_in_weekend_nights)*adr) as revenue
from hotels
group by arrival_date_year, hotel


--join hotels table with meal_cost and market_segment

select * from hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on hotels.meal = meal_cost$.meal

-- connect with Power_BI
-- performed analysis with Power_BI