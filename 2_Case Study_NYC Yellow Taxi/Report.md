# NYC Yellow Taxi 🚖

```sql
/*get the range of dropoff latitude & longitude*/
select
min(dropoff_longitude)min_long,
max(dropoff_longitude)max_long,
min(dropoff_latitude)min_long,
max(dropoff_latitude)max_long,
from
`bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2016` 
```
