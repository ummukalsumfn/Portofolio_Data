# Covid19 Open Data 

## Dataset
Public Dataset in BigQuery :
```query-public-data.covid19_open_data.covid19_open_data```

## Questions

######
1. Trend of daily Covid19 case growth in Indonesia
2. Top 5 Provinces with the highest number of cases
3. Ratio of cases per population

## SQL Query ⬇️
Get covid19 comulative confirmed and new confirmed cases per day per subregion

```sql
---1. Trend of daily Covid case growth in Indonesia
---2. Top 5 Provinces with the highest number of cases
---3. Ratio of cases per population
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
![Q1](https://user-images.githubusercontent.com/108319934/176993305-8d05a6fb-6527-45f3-8ebd-097391d174fd.JPG)
![Q2](https://user-images.githubusercontent.com/108319934/176993306-eaad6fd4-2989-4fae-89de-407304c28c97.JPG)

## Insights
###### 
1. Trend of daily Covid19 case growth in Indonesia
   There was a significant increase in cases starting from 1 January 2020 with the highest confirmed cases on 8 March 2021 with 19,058 cases. Although there was a
   decrease (new confirmed) on March 6, 2021 with new confirmed (4,327)
2. Top 5 Provinces with the highest number of cases
   Top 5 provinces with the highest cases are Jakarta, West Java, South Sulawesi, East Java and Riau
3. Ratio of cases per population
   Jakarta (3.44%),
   South Sulawesi (2.26%),
   Riau (2.12%)
   West Java (0.82%), and
   East Java (0.72%) 
   
   
   
