<!DOCTYPE html>
<html>

<head>
    <title></title>
</head>
<?php
header("content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=$title.xls");
header("Pragma: no-cache");
header("expires: 0");
?>
    <h3>
        <center>Laporan Data Barang Keluar</center>
    </h3>
    <br />
    <table class="table-data">
        <thead>
            <tr>
                <th>ID Transaksi</th>
                <th>Lokasi</th>
                <th>Customer</th>
                <th>Alamat</th>
                <th>Telepon</th>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Satuan</th>
                <th>Jumlah</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $no = 1;
            foreach ($barangkeluar as $dd) {
                ?>
                    <tr>
                    <td><?=$dd['idtransaksi'];?></td>
                        <td><?=$dd['lokasi'];?></td>
                        <td><?=$dd['namacustomer'];?></td>
                        <td><?=$dd['alamat'];?></td>
                        <td><?=$dd['telepon'];?></td>
                        <td><?=$dd['kodebarang'];?></td>
                        <td><?=$dd['namabarang'];?></td>
                        <td><?=$dd['satuan'];?></td>
                        <td><?=$dd['jumlah'];?></td>
                    </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
    <script type="text/javascript">
        window.print();
    </script>
</body>

</html>