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

Kolom-kolom yang tidak diperlukan akan di hapus yakni no dan Row_Num

## 2. Data Visualization

**2.1 Customer acquisition by year**

![image](https://user-images.githubusercontent.com/108319934/185622425-f685f496-a2ed-4b15-8ba3-3847a07c0439.png)

**2.2 Transaction by year**

Visualisasi trend jumlah transaksi per tahunnya menggunakan bar chart

![image](https://user-images.githubusercontent.com/108319934/185622565-7d136c31-016c-4d85-ac2b-c236ef0b676a.png)

**2.3 Average transaction amount by year**

Dengan menggunakan seaborn pointplot, visualisasi tren dari tahun ke tahun rata-rata jumlah transaksi untuk tiap-tiap produknya.

![image](https://user-images.githubusercontent.com/108319934/185622689-6d0a3d99-d729-44f5-b78d-7ec0ee59cf95.png)

**2.4 Proporsi churned customer untuk setiap produk**

Dari sisi churned customer, khususnya untuk melihat seberapa besar proporsi churned customer untuk tiap-tiap produk dapat diketahui insight-nya melalui pie chart.

![image](https://user-images.githubusercontent.com/108319934/187060051-467f5a08-1582-45a3-a2e9-463eb46357ef.png)

**2.5 Distribusi kategorisasi count transaction**

Selanjutnya akan melakukan visualisasi dari distribusi kategorisasi count transaction. Kategorisasi ini dilakukan dengan mengelompokkan jumlah transaksi seperti yang diperlihatkan oleh tabel berikut:

![image](https://user-images.githubusercontent.com/108319934/187060074-db7b57fc-ca54-43a5-b36f-3ba74f90fa74.png)

Setelah menambahkan kolom baru untuk kategori ini dengan nama Count_Transaction_Group, kemudian divisualisasikan dengan bar chart.

![image](https://user-images.githubusercontent.com/108319934/187060084-3af1020f-d501-436b-b982-a5b0881c01fb.png)

**2.6 Distribusi kategorisasi average transaction amount**

Selanjutnya, akan melakukan visualisasi dari distribusi kategorisasi average transaction amount. Kategorisasi ini dilakukan dengan mengelompokkan rata-rata besar transaksi seperti yang diperlihatkan oleh tabel berikut:

![image](https://user-images.githubusercontent.com/108319934/187060140-761e33b1-6c0b-4ef5-8cf5-6a168d66468c.png)

Setelah ditambahkan kolom baru untuk kategori ini dengan nama Average_Transaction_Amount_Group, kemudian divisualisasikan dengan bar chart.

![image](https://user-images.githubusercontent.com/108319934/187060148-2b3ada19-ead1-4f30-96f3-cc893a731154.png)



