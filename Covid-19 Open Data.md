# Covid19 Open Data 

## Dataset
Public Dataset in BigQuery :
```query-public-data.covid19_open_data.covid19_open_data```

## SQL Query ⬇️
Get covid19 comulative confirmed and new confirmed cases per day per subregion

```sql
---1. Trend Pertumbuhan kasus covid harian di Indonesia
---2. 5 Provinsi dengan jumlah kasus terbanyak
---3. Ratio kasus perp populasi
SELECT  
date,
country_name,
subregion1_name,
subregion2_name,
population,
cumulative_confirmed,
new_confirmed
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
where country_name='Indonesia' and subregion2_name is not null
order by 1,2,3

```
## Visualization with Google Data Studio 

