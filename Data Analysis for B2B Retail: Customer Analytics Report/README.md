# Data Analysis for B2B Retail: Customer Analytics Report 

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

**Langkah yang akan dilakukan :**

- Menggunakan klausa “Select … From …” untuk mengambil data di database
- Menggunakan klausa Where dan Operator untuk menfilter data
- Menggunakan “group by”dan fungsi aggregat untuk aggregasi penjualan dan revenue
- Menggunakan “order by” untuk mengurutkan data
- Menggunakan “union” untuk menggabungkan tabel data penjualan
- Menggunakan “date and time function” dan fungsi text untuk data manipulation
- Menggunakan subquery untuk menyimpan hasil sementara untuk digunakan kembali dalam query.

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
**- Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) dan Quarter-2 (Apr,Mei,Jun)**
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
```
+---------+-----------------+-----------+
| quarter | total_penjualan | revenue   |
+---------+-----------------+-----------+
| 1       |            8694 | 799579310 |
| 2       |            6717 | 607548320 |
+---------+-----------------+-----------+
```

**- Perhitungan Growth Penjualan dan Revenue**
Untuk project ini, perhitungan pertumbuhan penjualan akan dilakukan secara manual menggunakan formula yang disediakan di bawah. 
Adapun perhitungan pertumbuhan penjualan dengan SQL dapat dilakukan menggunakan “window function” yang akan dibahas di materi DQLab berikutnya.
- %Growth Penjualan = (6717 – 8694)/8694 = -22%
- %Growth Revenue = (607548320 – 799579310)/ 799579310 = -24% 

 
