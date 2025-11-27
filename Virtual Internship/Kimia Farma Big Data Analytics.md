# Performance Analytics
Analisis kinerja bisnis Kimia Farma Tahun 2020-2023 📈

## Project Portfolio
Proyek ini bertujuan menganalisis kinerja Kimia Farma periode 2020-2023 sebagai Big Data Analytics Intern. Inti proyek adalah membuat Dashboard Analisis Kinerja bisnis menggunakan Looker Studio, yang akan divisualisasikan dari tabel data yang telah diolah sebelumnya di BigQuery. Hasil akhir proyek ini adalah perumusan insight dan rekomendasi strategis untuk mempertahankan dan meningkatkan penjualan perusahaan.

## 1. Import to BigQuery
Tahap awal mengimport 4 tabel berbentuk CSV ke BigQuery dengan dengan nama dataset kimia_farma

## 2. Tabel Analisa
Membuat tabel analisa pada BigQuery dengan kolom-kolom mandatory sebagai berikut:
* **`transaction_id`**: Kode ID unik untuk setiap transaksi yang tercatat.
* **`date`**: Tanggal dilakukannya transaksi.
* **`branch_id`**: Kode ID cabang Kimia Farma.
* **`branch_name`**: Nama cabang Kimia Farma.
* **`kota`**: Kota lokasi cabang Kimia Farma.
* **`provinsi`**: Provinsi lokasi cabang Kimia Farma.
* **`rating_cabang`**: Penilaian konsumen terhadap performa dan layanan cabang Kimia Farma.
* **`customer_name`**: Nama customer yang melakukan transaksi.
* **`product_id`**: Kode ID unik untuk produk obat.
* **`product_name`**: Nama produk (obat) yang dibeli.
* **`actual_price`**: Harga asli produk (obat) sebelum dikenakan diskon.
* **`discount_percentage`**: Persentase diskon yang diberikan pada produk (dalam desimal atau persentase).
* **`persentase_gross_laba`**: Persentase laba kotor yang ditetapkan untuk produk, berdasarkan `actual_price`:
    * Harga $\le$ Rp 50.000 $\rightarrow$ Laba $10\%$
    * Harga $>$ Rp 50.000 dan $\le$ Rp 100.000 $\rightarrow$ Laba $15\%$
    * Harga $>$ Rp 100.000 dan $\le$ Rp 300.000 $\rightarrow$ Laba $20\%$
    * Harga $>$ Rp 300.000 dan $\le$ Rp 500.000 $\rightarrow$ Laba $25\%$
    * Harga $>$ Rp 500.000 $\rightarrow$ Laba $30\%$
* **`nett_sales`**: Harga jual bersih produk, dihitung setelah dikurangi `discount_percentage`.
* **`nett_profit`**: Keuntungan bersih yang diperoleh Kimia Farma dari transaksi.
* **`rating_transaksi`**: Penilaian konsumen terhadap pengalaman transaksi secara keseluruhan (misalnya, pelayanan kasir, kecepatan, dll.).
## 3. BiqQuery Syntax

```sql
CREATE OR REPLACE TABLE `soy-storm-354407.kimia_farma.tabel_analisa` AS
SELECT
    ft.transaction_id,
    ft.date,
    ft.branch_id,
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating AS rating_cabang,
    ft.customer_name,
    ft.product_id,
    p.product_name,
   
    -- Harga actual dari tabel transaksi
    ft.price AS actual_price,
   
    -- Diskon
    ft.discount_percentage,
   
    -- Persentase Gross Laba (sesuai rule)
    CASE
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
        WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
        WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
        WHEN ft.price > 500000 THEN 0.30
    END AS persentase_gross_laba,
   
    -- Nett Sales (harga setelah diskon)
    (ft.price - (ft.price * ft.discount_percentage)) AS nett_sales,
   
    -- Nett Profit
    (ft.price - (ft.price * ft.discount_percentage)) *
    CASE
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
        WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
        WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
        WHEN ft.price > 500000 THEN 0.30
    END AS nett_profit,
   
    -- Rating transaksi dari tabel transaksi
    ft.rating AS rating_transaksi

FROM `soy-storm-354407.kimia_farma.kf_final_transaction` AS ft
LEFT JOIN `soy-storm-354407.kimia_farma.kf_kantor_cabang` AS kc
    ON ft.branch_id = kc.branch_id
LEFT JOIN `soy-storm-354407.kimia_farma.kf_product` AS p
    ON ft.product_id = p.product_id;
```
## 4. Dashboard Performance Analytics
Tabel analisa yang telah dibuat selanjutkan akan divisualisasiskan menggunakan Looker Studio.

- Dashboard Link: https://lookerstudio.google.com/reporting/3635dec3-f220-4435-9acc-73787f5a6e98


