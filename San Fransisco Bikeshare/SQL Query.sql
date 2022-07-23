select
trip_id,
duration_sec,
date(start_date)star_date,
start_station_name,
concat(start_station_name," - ",end_station_name)route,
bike_number,
subscriber_type,
member_birth_year,
(2022-member_birth_year)age,
case when(2022-member_birth_year) < 40 then 'Young (<40 Y.O)'
     when(2022-member_birth_year) between 40 and 60 then 'Adult (40-60 Y.O)'
     else 'Senior Adult (>60 Y.O)'
end as age_class,
member_gender,
c.name region_name
from `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` a
left join `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` b 
on a.start_station_name = b.name
left join `bigquery-public-data.san_francisco_bikeshare.bikeshare_regions` c 
on b.region_id= c.region_id
where start_date between '2017-07-01' and '2017-12-31'
and b.name is not null
and member_birth_year is not null
and member_gender is not null
and member_gender !='Other'
