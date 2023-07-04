Use db_pratikum;

-- NAMA : IRWAN FERNANDO
-- NIM : 21241043


-- soal 1
select kode_pelanggan, nama_produk, qty, harga, qty*harga from tr_penjualan_dqlab where qty*harga >= 200000 order by qty*harga;

-- soal 2
select tp.kode_transaksi, mp.kode_pelanggan, tp.kode_produk, mp.nama_pelanggan, nama_produk, tp.harga, tp.qty, tp.qty*harga as total
from tr_penjualan_dqlab as tp join ms_pelanggan_dqlab as mp 
on tp.kode_pelanggan = mp.kode_pelanggan
where qty >= 3 order by qty;

-- soal 3
select nama_produk, tgl_transaksi, bulan, tahun,
