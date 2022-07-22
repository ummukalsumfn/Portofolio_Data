# Data Analysis for B2B Retail: Customer Analytics Report  
**Mentor: Trisna Yulia Junita (Data Scientist PT. BUMA)**

## 1.Intro
xyz.com adalah perusahan rintisan B2B yang menjual berbagai produk tidak langsung kepada end user tetapi ke bisnis/perusahaan lainnya. Sebagai data-driven company, maka setiap pengambilan keputusan di xyz.com selalu berdasarkan data. Setiap quarter xyz.com akan mengadakan townhall dimana seluruh atau perwakilan divisi akan berkumpul untuk me-review performance perusahaan selama quarter terakhir.

Tabel yang diberikan

![image](https://user-images.githubusercontent.com/108319934/177560962-e8a9726b-828e-44b0-a743-2d1a35495e39.png)

Keterangan:

- Tabel orders_1 : Berisi data transaksi penjualan periode quarter 1 (Jan — Mar 2004)
- Tabel Orders_2 : Berisi data transaksi penjualan periode quarter 2 (Apr — Jun 2004)
- Tabel Customer : Berisi data profil customer yang mendaftar menjadi customer

**Questions**

Adapun hal yang akan direview adalah :
1. Bagaimana pertumbuhan penjualan saat ini?
2. Apakah jumlah customers xyz.com semakin bertambah ?
3. Dan seberapa banyak customers tersebut yang sudah melakukan transaksi?
4. Category produk apa saja yang paling banyak dibeli oleh customers?
5. Seberapa banyak customers yang tetap aktif bertransaksi?

## 2.Pengenalan Tabel
Sebelum memulai menyusun query SQL dan membuat Analisa dari hasil query, hal pertama yang perlu dilakukan adalah menjadi familiar dengan tabel yang akan digunakan. 
Hal ini akan sangat berguna dalam menentukan kolom mana sekiranya berkaitan dengan problem yang akan dianalisa, dan proses manipulasi data apa yang sekiranya perlu dilakukan untuk kolom – kolom tersebut, karena tidak semua kolom pada tabel perlu untuk digunakan.
```sql
select * from orders_1 limit 5;
select * from orders_2 limit 5;
select * from customer limit 5;
```
Output
```
+-------------+------------+--------------+-------------+---------+------------+-------------+----------+-----------+
| orderNumber | orderDate  | requiredDate | shippedDate | status  | customerID | productCode | quantity | priceeach |
+-------------+------------+--------------+-------------+---------+------------+-------------+----------+-----------+
|       10234 | 2004-03-30 | 2004-04-05   | 2004-04-02  | Shipped |        412 | S72_1253    |       40 |     45690 |
|       10234 | 2004-03-30 | 2004-04-05   | 2004-04-02  | Shipped |        412 | S700_2047   |       29 |     83280 |
|       10234 | 2004-03-30 | 2004-04-05   | 2004-04-02  | Shipped |        412 | S24_3816    |       31 |     78830 |
|       10234 | 2004-03-30 | 2004-04-05   | 2004-04-02  | Shipped |        412 | S24_3420    |       25 |     65090 |
|       10234 | 2004-03-30 | 2004-04-05   | 2004-04-02  | Shipped |        412 | S24_2841    |       44 |     67140 |
+-------------+------------+--------------+-------------+---------+------------+-------------+----------+-----------+
+-------------+------------+--------------+-------------+---------+------------+-------------+----------+-----------+
| orderNumber | orderDate  | requiredDate | shippedDate | status  | customerID | productCode | quantity | priceeach |
+-------------+------------+--------------+-------------+---------+------------+-------------+----------+-----------+
|       10235 | 2004-04-02 | 2004-04-12   | 2004-04-06  | Shipped |        260 | S18_2581    |       24 |     81950 |
|       10235 | 2004-04-02 | 2004-04-12   | 2004-04-06  | Shipped |        260 | S24_1785    |       23 |     89720 |
|       10235 | 2004-04-02 | 2004-04-12   | 2004-04-06  | Shipped |        260 | S24_3949    |       33 |     55270 |
|       10235 | 2004-04-02 | 2004-04-12   | 2004-04-06  | Shipped |        260 | S24_4278    |       40 |     63030 |
|       10235 | 2004-04-02 | 2004-04-12   | 2004-04-06  | Shipped |        260 | S32_1374    |       41 |     90900 |
+-------------+------------+--------------+-------------+---------+------------+-------------+----------+-----------+
+------------+----------------------------+-----------------+------------------+-----------+-----------+------------+
| customerID | customerName               | contactLastName | contactFirstName | city      | country   | createDate |
+------------+----------------------------+-----------------+------------------+-----------+-----------+------------+
|        103 | Atelier graphique          | Schmitt         | Carine           | Nantes    | France    | 2004-02-05 |
|        112 | Signal Gift Stores         | King            | Jean             | Las Vegas | USA       | 2004-02-05 |
|        114 | Australian Collectors, Co. | Ferguson        | Peter            | Melbourne | Australia | 2004-02-20 |
|        119 | La Rochelle Gifts          | Labrune         | Janine           | Nantes    | France    | 2004-02-05 |
|        121 | Baane Mini Imports         | Bergulfsen      | Jonas            | Stavern   | Norway    | 2004-02-05 |
+------------+----------------------------+-----------------+------------------+-----------+-----------+------------+ 

```
## 3.Bagaimana Pertumbuhan Penjualan Saat Ini
- **Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) dan Quarter-2 (Apr,Mei,Jun)**
```sql
select
sum(quantity) as total_penjualan,
sum(quantity*priceeach) as revenue
from orders_1
where status='shipped';

select
sum(quantity) as total_penjualan,
sum(quantity*priceeach) as revenue
from orders_2
where status='shipped';
```
Output
```
+-----------------+-----------+
| total_penjualan | revenue   |
+-----------------+-----------+
|            8694 | 799579310 |
+-----------------+-----------+
+-----------------+-----------+
| total_penjualan | revenue   |
+-----------------+-----------+
|            6717 | 607548320 |
+-----------------+-----------+
```
## 3.Menghitung Persentasi Semua Penjualan
```sql
select
quarter,
sum(quantity) as total_penjualan,
sum(quantity*priceeach) as revenue
from
(
select
orderNumber,
status,
quantity,
priceeach,
'1' as quarter
from orders_1
union
select
orderNumber,status,quantity,priceeach,
'2' as quarter
from orders_2
) as tabel_a
where status='Shipped'
group by 1;
```
Output
```
+---------+-----------------+-----------+
| quarter | total_penjualan | revenue   |
+---------+-----------------+-----------+
| 1       |            8694 | 799579310 |
| 2       |            6717 | 607548320 |
+---------+-----------------+-----------+
```

- **Perhitungan Growth Penjualan dan Revenue**

Untuk project ini, perhitungan pertumbuhan penjualan akan dilakukan secara manual menggunakan formula yang disediakan di bawah. 

```%Growth Penjualan = (6717 – 8694)/8694 = -22%```

```%Growth Revenue = (607548320 – 799579310)/ 799579310 = -24% ```

 ## 4.Customer Analytics
 - Apakah jumlah customers xyz.com semakin bertambah?
 ```sql
 select quarter,count(distinct customerID) as total_customers
from
(select
customerID,
createDate,
quarter(createDate) as quarter
from customer
where createDate between '2004-01-01' and '2004-06-30') tabel_b
group by quarter;
 ```
 Output
 ```
 +---------+-----------------+
| quarter | total_customers |
+---------+-----------------+
|       1 |              43 |
|       2 |              35 |
+---------+-----------------+
 ```
- Seberapa banyak customers tersebut yang sudah melakukan transaksi?
```sql
select quarter,count(customerID) as total_customers
from
(select customerID,createDate,quarter(createDate) as quarter from customer
    where createDate between '2004-01-01' and '2004-06-30')tabel_b
    where customerID in (select distinct(customerID) as total_customers
    from orders_1
    union
    select distinct (customerID) as total_customers from orders_2)
group by quarter;
```
Output
```
+---------+-----------------+
| quarter | total_customers |
+---------+-----------------+
|       1 |              25 |
|       2 |              19 |
+---------+-----------------+
```
- Category produk apa saja yang paling banyak di-order oleh customers di Quarter-2?
```sql
select * from (select categoryID, count( distinct orderNumber) as total_order,sum(quantity) as total_penjualan 
from
	(select productCode,orderNumber,quantity,status,left(productCode,3) 	as categoryID
	from orders_2
	where status='Shipped')tabel_c
group by categoryID)sub
order by total_order desc;
```
Output
```
+------------+-------------+-----------------+
| categoryID | total_order | total_penjualan |
+------------+-------------+-----------------+
| S18        |          25 |            2264 |
| S24        |          21 |            1826 |
| S32        |          11 |             616 |
| S12        |          10 |             491 |
| S50        |           8 |             292 |
| S10        |           8 |             492 |
| S70        |           7 |             675 |
| S72        |           2 |              61 |
+------------+-------------+-----------------+
```
- Seberapa banyak customers yang tetap aktif bertransaksi setelah transaksi pertamanya?
```sql
#Menghitung total unik customers yang transaksi di quarter_1
SELECT COUNT(DISTINCT customerID) as total_customers FROM orders_1;
#output = 25
select '1' as quarter,count(distinct customerID)/25*100 as q2
from orders_1
where customerID in (select distinct customerID from orders_2);
```
Output
```
+-----------------+
| total_customers |
+-----------------+
|              25 |
+-----------------+
+---------+---------+
| quarter | q2      |
+---------+---------+
| 1       | 24.0000 |
+---------+---------+
```
## 5. Kesimpulan

Berdasarkan data yang telah kita peroleh melalui query SQL, Kita dapat menarik kesimpulan bahwa :

1. Performance xyz.com menurun signifikan di quarter ke-2, terlihat dari nilai penjualan dan revenue yang drop hingga 20% dan 24%,
2. Perolehan customer baru juga tidak terlalu baik, dan sedikit menurun dibandingkan quarter sebelumnya.
3. Ketertarikan customer baru untuk berbelanja di xyz.com masih kurang, hanya sekitar 56% saja yang sudah bertransaksi. Disarankan tim Produk untuk perlu mempelajari behaviour customer dan melakukan product improvement, sehingga conversion rate (register to transaction) dapat meningkat.
4. Produk kategori S18 dan S24 berkontribusi sekitar 50% dari total order dan 60% dari total penjualan, sehingga xyz.com sebaiknya fokus untuk pengembangan category S18 dan S24.
5. Retention rate customer xyz.com juga sangat rendah yaitu hanya 24%, artinya banyak customer yang sudah bertransaksi di quarter-1 tidak kembali melakukan order di quarter ke-2 (no repeat order).
6. xyz.com mengalami pertumbuhan negatif di quarter ke-2 dan perlu melakukan banyak improvement baik itu di sisi produk dan bisnis marketing, jika ingin mencapai target dan positif growth di quarter ke-3. Rendahnya retention rate dan conversion rate bisa menjadi diagnosa awal bahwa customer tidak tertarik/kurang puas/kecewa berbelanja di xyz.com.
