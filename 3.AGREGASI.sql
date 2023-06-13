use dqlab;
 -- latihan 1
 select kode_produk, nama_produk from ms_produk_dqlab;
 select * from tr_penjualan_dqlab; 
 
 -- prefix menggunakan nama tabel
 select ms_produk_dqlab.nama_produk
 from ms_produk_dqlab;
 
 select ms_produk_dqlab.kode_produk
 from ms_produk_dqlab;
 
 select ms_produk_dqlab.kategori_produk
 from ms_produk_dqlab;
 
 select ms_produk_dqlab.harga
 from ms_produk_dqlab;
 
 select ms_produk_dqlab.nama_produk,ms_produk_dqlab.harga
 from ms_produk_dqlab;
 
 -- prefix menggunakan nama database
 select dqlab.ms_produk_dqlab.nama_produk
 from ms_produk_dqlab;
 
 -- alias menggunakan nama kolom 
 select nama_produk as np
 from ms_produk_dqlab;
 
 -- menggunakan alias dan prefix
 -- menggunakan prefix nama table
 select ms_produk_dqlab.nama_produk, ms_produk_dqlab.harga
 from ms_produk_dqlab;
 
 -- ORDER BY,GROUP BY,ASC/DESC,HAVING
 -- menggunakan ORDER BY untuk mengurutkan data
 
 -- mengambil kolom nama_produk,qty tabel penjualan diurutkan urutkan berdasarkan kolom qty
 select nama_produk, qty
 from tr_penjualan_dqlab
 order by qty;
 
 -- mengambil kolom nama_produk,qty pada tabel dan urutkan berdasarkan qty dan nama_produk
 select nama_produk,qty
 from tr_penjualan_dqlab
 order by qty, nama_produk;
 
 -- latihan 1
 -- menampilkan semua kolom pada penjualan dengan menggunakan berdasarkan qty dan tanggal transaksi
 select kode_urut_transaksi,kode_transaksi,tgl_transaksi,no_urut,qty,kode_produk
 from tr_penjualan_dqlab
 order by qty,tgl_transaksi;
 
 -- menampilkan kolom table ms_pelanggan dengan mengurutkan berdasarkan nama pelanggan
 select kode_pelanggan, no_urut,nama_pelanggan, alamat
 from ms_pelanggan_dqlab
 order by alamat;
 
-- menampilkan kolom tabel ms_pelanggan dengan mengurutkan berdasarkan nama pelanggan
select kode_pelanggan, no_urut, nama_pelanggan,alamat
from ms_pelanggan_dqlab
order by nama_pelanggan;

-- ORDER BY dengan ASC dan desc
-- mengambil nama_produk,qty dari table penjualan urutkan dengan DESC qty
select nama_produk, qty 
from tr_penjualan_dqlab
order by qty DESC;

-- ambil nama_produk dari tabel penjualan urutkan qty DESC dan nama_produk ASC
select tgl_transaksi, qty 
from tr_penjualan_dqlab
order by qty DESC,nama_produk ASC;

-- latihan 2
-- menampilkan semua kolom pada table penjualan dengan mengurutkan tgl_transaksi secara DESC dan qty ASC 
select tgl_transaksi, qty 
from tr_penjualan_dqlab 
order by tgl_transaksi desc,qty asc;

-- menampilkan semua kolom table pelanggan dengan mengurutkan nama_pelanggan secara desc
select kode_pelanggan, no_urut, nama_pelanggan, alamat
from ms_pelanggan_dqlab 
order by nama_pelanggan DESC;

-- menampilkan semua kolom table pelanggan dengan mengurutkan alamat secara DESC 
select nama_produk, no_urut, nama_pelanggan, alamat
from ms_pelanggan_dqlab
order by alamat desc;

-- ORDER BY dengan perhitungan
select nama_produk,qty,harga,qty*harga as total_beli
from tr_penjualan_dqlab
order by total_beli desc;

-- latihan 3
-- pengurutan dengan ekspresi total harga menggunakan rumusan jumlah barang dikali harga barang dikurangi diskon
select total_harga, qty*harga-diskon_persen as total_harga
from tr_penjualan_dqlab
order by total_harga asc;

-- ORDER BY dengan WHERE ambil nama produk, qty dari penjualan dengan nama_produk berawalan "f" urutkan berdasarkan qty terbanyak
select nama_produk, qty from tr_penjualan_dqlab where nama_produk like 'F%' 
order by qty desc;

-- fungsi Agregasi
-- ambil semua hasil perhitungan dari nilai qty dari seluruh row pada tabel transaksi
select sum(qty) from tr_penjualan_dqlab;

-- menghitung jumlah seluruh row pada tabel transaksi
select count(*) from tr_penjualan_dqlab;
select count(*) from ms_pelanggan_dqlab;
select count(*) from ms_produk_dqlab;

-- menghitung penjumlah qty dan menghitung seluruh row
select sum(qty), count(*)
from tr_penjualan_dqlab;

-- menghitung rata rata qty, nilai tertinggi dari qty dan nilai terendah qty
select avg(qty), min(qty), max(qty)
from tr_penjualan_dqlab;

-- menghitung nilai unik dari nama_produk di table tr_penjualan_dqlab
select count(distinct nama_produk), count(nama_produk)
from tr_penjualan_dqlab;

-- menarik field nama_produk dan fungsi agregasi untuk nilai qty pd tabel tr_penjualan
select nama_produk, max(qty)
from tr_penjualan_dqlab;

-- GROUP BY 
-- mengambil grouping nilai dari kolom nama_produk
select nama_produk from tr_penjualan_dqlab
group by nama_produk;

-- ambil grouping nilai dari kolom nama_produk dan qty
select nama_produk, qty
from tr_penjualan_dqlab
group by nama_produk, qty;

-- ambil jumlah qty dari grouping nama_produk terhadap seluruh row pd table transaksi
select nama_produk, sum(qty)
from tr_penjualan_dqlab
group by nama_produk;

-- ambil jumlah qty dari hasil grouping nama_produk terhadap seluruh row table_penjualan urutkan qty terbesar
select nama_produk, sum(qty)
from tr_penjualan_dqlab
group by nama_produk
order by  sum(qty) desc;

-- HAVING 
-- ambil jumlah qty >2 dari hasil grouping nama_produk terhadap seluruh row pd table transaksi
select nama_produk, sum(qty)
from tr_penjualan_dqlab
group by nama_produk
having sum(qty) > 2
order by sum(qty) desc;

-- LATIHAN
select nama_produk, sum(qty)
from tr_penjualan_dqlab
group by nama_produk
having sum(qty) > 4
order by sum(qty) desc;

select nama_produk, sum(qty)
from tr_penjualan_dqlab
group by nama_produk
having sum(qty) =9
order by sum(qty) desc;

select nama_produk, sum(qty)
from tr_penjualan_dqlab
order by harga*sum(qty);

