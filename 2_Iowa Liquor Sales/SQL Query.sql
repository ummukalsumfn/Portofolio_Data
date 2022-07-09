SELECT
date,
invoice_and_item_number,
city,
replace(zip_code,".0","")zip_code,
case when bottle_volume_ml between 0 and 500 then 'a.Small Size(0-500ml)'
     when bottle_volume_ml between 501 and 1000 then 'b.Medium Size(501-1000ml)'
     else 'c.Large Size (>1000ml)'
end as category_size_bottle,
bottles_sold,
sale_dollars,
volume_sold_liters,
store_number,
county_number,
replace (category,".0","")category,
vendor_number,
item_number,
store_location,
ST_GEOGFROMTEXT(store_location)point_location,
ST_X(ST_GEOGFROMTEXT(store_location)) as longitude,
ST_X(ST_GEOGFROMTEXT(store_location)) as latitude,
ANY_VALUE(upper(store_name))store_name,
ANY_VALUE(upper(county))county,
ANY_VALUE(upper(category_name))category_name,
ANY_VALUE(upper(vendor_name))vendor_name,
ANY_VALUE(upper(item_description))item_description,
FROM `bigquery-public-data.iowa_liquor_sales.sales` 
where county_number is not null
and store_number is not null
and category is not null
and vendor_number is not null
and item_number is not null
and date between '2021-01-01' and '2021-12-31'
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14
