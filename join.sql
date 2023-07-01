-- penggunaan database
use db_praktikum;

desc ms_pelanggan_dqlab;
desc tr_penjualan_dqlab;

-- mengambil kolom kode pelanggan, nama pelanggan, nama produk, qty berdasarkan kode pelanggan
select tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
from tr_penjualan_dqlab as tp 
join ms_pelanggan_dqlab as mp
on tp.kode_pelanggan = ap.kode_pelanggan;

-- cross join
-- ambil kolom nama_pelanggan , nama_produk, qty tanpa relationship keys
select ap.nama_pelanggan, tp.nama_produk, tp.qty
from tr_penjualan_dqlab as tp
join ms_pelanggan_dqlab as mp
on true;

-- left outer join
-- ambil nama_pelanggan, nama_produk, dan qty dengan left outer join
select tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
from tr_penjualan_dqlab as tp
left outer join ms_pelanggan_dqlab as mp
on tp.kode_pelanggan = mp.kode_pelanggan;

-- right outer join
-- ambil nama_pelanggan, nama_produk, qty dengan right outer join
select tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
from tr_penjualan_dqlab as tp
right outer join ms_pelanggan_dqlab as mp
on tp.kode_pelanggan = mp.kode_pelanggan;

