#  Data Analyst Project: Business Decision Research
- Data preparation test: Tes ini dimaksudkan untuk menguji kemampuan member dalam melakukan ETL data.
- Data visualization test: Tes ini dimaksudkan untuk menguji kemampuan member dalam hal visualisasi data.
- Basic Stats Method test: Tes ini dimaksudkan untuk menguji kemampuan member dalam melakukan modeling data menggunakan statistika dasar.

## Intro 
1. Data preparation test.
- Importing data: Melakukan import data_retail.csv ke python environment.
- Cleansing data: Melakukan pembersihan dan modifikasi data sehingga siap digunakan untuk analisis lebih lanjut.
2. Data visualization test: Mendapatkan insight dari hasil visualisasi yang telah dibuat.
3. Basic stats method test: Mendapatkan insight dari model dan evaluasi model yang sudah dibuat dan diuji.
 

## 1. Data Preparation
DQLab sport center adalah toko yang menjual berbagai kebutuhan olahraga seperti Jaket, Baju, Tas, dan Sepatu. Toko ini mulai berjualan sejak tahun 2013, sehingga sudah memiliki pelanggan tetap sejak lama, dan tetap berusaha untuk mendapatkan pelanggan baru sampai saat ini.

Manajer toko pun memberikan data transaksi dari tahun 2013 sampai dengan 2019 dalam bentuk csv (comma separated value) dengan data_retail.csv dengan jumlah baris 100.000 baris data.

Berikut tampilan datanya:

![image](https://user-images.githubusercontent.com/108319934/179982797-6d16b51a-40ca-4f22-a843-f47854aa7cd8.png)

Field yang ada pada data tersebut antara lain:

1. No
2. Row_Num
3. Customer_ID
4. Product
5. First_Transaction
6. Last_Transaction
7. Average_Transaction_Amount
8. Count_Transaction
 
**1.1 Data Cleansing**

Mengubah tipe data untuk kolom First_Transaction dan Last_Transaction dari int ke datetime

**1.2 Churn Customers**

Untuk menentukan churn customers sesuai definisi yang telah diberikan
- transaksi paling terakhir kapan dilakukan
- klasifikasikanlah mana customer yang berstatus churn dan mana yang tidak
  
**1.3 Menghapus Kolom**

