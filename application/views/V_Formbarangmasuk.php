<?php $this->load->view('v_header'); ?>
<?php $this->load->view('Sidebar'); ?>

<div id="layoutSidenav_content">
  <main>
    <div class="content-wrapper">
      <!-- Content Header (Page header) --> 
      <section class="content-header">
        <h3>
          Input Data Barang Masuk
        </h3>
        <!-- Main content --> 
        <div class="row">
          <!-- left column --> 
          <div class="col-md-12">
            <div class="container">
              <!-- general form elements -->
              <div class="box box-primary" style="width:94%;">
                <?php echo $this->session->flashdata('berhasilmasuk'); ?>
                <div class="box-header with-border">
                  <h5 class="box-title"><i class="fa fa-archive" aria-hidden="true"></i> Tambah Data Barang Masuk</h5>
                </div>
                <!-- nomor transaksi otomatis -->
                <?php
                $conn = mysqli_connect('localhost', 'root', '', 'dbinventory');
                // Menginisialisasi variabel $data dengan nilai string kosong.
                $data = "";
                // Query SQL ini memilih nilai maksimum dari kolom idtransaksi dari tabel barangkeluar dan mengembalikan hasilnya dengan alias max_code.
                // Hasil query disimpan dalam variabel $result.
                $result = mysqli_query($conn, "SELECT MAX(idtransaksi) AS max_code FROM barangmasuk");
                 // Data yang diambil disimpan dalam variabel $data.
                $data = mysqli_fetch_array($result);
                 // Mengambil nilai dari elemen max_code dalam array $data dan menyimpannya dalam variabel $code.
                $code = $data['max_code'];
                // Menggunakan fungsi substr untuk mengambil bagian dari string $code mulai dari indeks ke-3 sepanjang 5 karakter
                $urutan = (int)substr($code, 2, 5);
                $urutan++;
                // Menginisialisasi variabel $angka dengan nilai integer "17".
                $angka = "17";
                // Menggunakan fungsi sprintf untuk memformat nilai $urutan sebagai integer dengan lebar 5 karakter, dengan menambahkan nol di depan jika diperlukan.
                $kd_kat = $angka . sprintf("%05s", $urutan);
                ?>
                <!-- /.box-header -->
                <div class="container">
                  <!-- form ini akan menuju ke beranda/submitbarangmasuk-->
                  <form action="<?= site_url('beranda/submitbarangmasuk') ?>" role="form" method="post">
                    <div class="box-body">
                      <div class="form-group">
                        <?php
                        // Kode ini memulai loop melalui setiap item di $list_data. Setiap item dianggap sebagai objek $d  
                        foreach ($list_data as $d) { ?>
                          <label for="idtransaksi" style="margin-left:220px;display:inline;">ID Transaksi</label>
                          <input type="text" name="idtransaksi" style="margin-left:37px;width:20%;display:inline;" class="form-control" readonly="readonly" value="<?= $kd_kat ?>">
                      </div>
                    </div>
                    <div class="form-group" style="margin-bottom:40px;">
                      <label for="nama_barang" style="margin-left:220px;display:inline;">Lokasi</label>
                      <select class="form-control" name="lokasi" style="margin-left:75px;width:20%;display:inline;">
                        <small><span class="text-danger"><?php echo form_error('lokasi'); ?></span></small>
                        <option value="">-- Pilih --</option>
                        <option value="Gudang">Gudang</option>]
                      </select>
                    </div>
                    <div class="form-group" style="margin-left:13px;display;">
                      <label for="namasupplier" style="width:90%;margin-left: 12px;">Nama Supplier</label>
                      <input type="text" name="namasupplier" readonly="readonly" style="width:50%;margin-right: 100px;" class="form-control" id="namasupplier" placeholder="Nama Supplier" data-target="#modal-item" value="">
                      <button type="button" data-toggle="modal" class="btn btn-info btn-flat" data-target="#modalsearch" id="buttonpilih" style="height:4%">
                        Pilih Supplier
                        <i class="fa fa-solid fa-search" aria-hidden="true"></i>
                      </button>
                    </div>
                    <div class="form-group" style="margin-left:13px;display;">
                      <label for="alamat" style="width:90%;">Alamat</label>
                      <input type="text" name="alamat" readonly="readonly" style="width:50%;margin-right: 50px;" class="form-control" id="alamat" placeholder="Alamat" value="">

                    </div>
                    <div class="form-group" style="margin-left:13px;display;">
                      <label for="telepon" style="width:90%;">Telepon</label>
                      <input type="text" name="telepon" readonly="readonly" style="width:50%;margin-right: 50px;" class="form-control" id="telepon" placeholder="Telepon" value="">

                    </div>
                    <div class="form-group" style="margin-left:13px;display;">
                      <label for="kode_barang" style="width:90%;margin-left: 12px;">Kode Barang / Barcode</label>
                      <input type="text" name="kodebarang" readonly="readonly" style="width:50%;margin-right: 50px;" class="form-control" id="kode_barang" placeholder="Kode Barang" data-target="#modal-item" value="<?= $d->kodebarang ?>">
                      <small><span class="text-danger"><?php echo form_error('kodebarang'); ?></span></small>
                    </div>
                    <div class="form-group" style="margin-left:13px;display;">
                      <label for="nama_Barang" style="width:90%;">Nama Barang</label>
                      <input type="text" name="namabarang" readonly="readonly" style="width:50%;margin-right: 50px;" class="form-control" id="nama_Barang" placeholder="Nama Barang" value="<?= $d->namabarang ?>">
                      <small><span class="text-danger"><?php echo form_error('namabarang'); ?></span></small>
                    </div>
                    <div class="form-group" style="margin-left:13px;display;">
                      <label for="nama_Barang" style="width:90%;">Satuan</label>
                      <input type="text" name="satuan" readonly="readonly" style="width:50%;margin-right: 50px;" class="form-control" id="satuan" placeholder="Satuan" value="<?= $d->satuan ?>">
                      <small><span class="text-danger"><?php echo form_error('satuan'); ?></span></small>
                    </div>
                    <div class="form-group" style="margin-left:13px;display;">
                      <label for="nama_Barang" style="width:90%;">Jumlah</label>
                      <input type="text" name="jumlah" style="width:50%;margin-right: 50px;" class="form-control" id="jumlah" placeholder="Jumlah">
                      <small><span class="text-danger"><?php echo form_error('jumlah'); ?></span>Stok Tersedia: <?= $d->jumlah ?></small>
                    </div>
                  <?php } ?>
                  <!-- /.box-body -->
                  <div class="box-footer" style="width:93%;">
                    <a type="button" class="btn btn-default" style="width:10%;margin-right:26%" onclick="history.back(-1)" name="btn_kembali"><i class="fa fa-arrow-left" aria-hidden="true"></i> Kembali</a>
                    <button type="reset" class="btn btn-info" style="width:14%;margin-right:29%" name="btn_reset"> Reset</button>
                    <button type="submit" style="width:20%" class="btn btn-success"><i class="fa fa-check" aria-hidden="true"></i> Submit</button>
                  </div>
                  </form>
                </div>
              </div>
            </div>
      </section>
      <!-- Modal update -->
      <div class="modal fade" id="modalsearch" tabindex="-1" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Pilih Supplier</h5>
            </div>
            <div class="modal-body table-responsive">
              <table id="example1" class="table table-bordered table-striped table-responsive">
                <thead>
                  <tr>
                    <th>Kode id</th>
                    <th>Nama Supplier</th>
                    <th>Alamat</th>
                    <th>No. Telepon</th>
                    <th>Aksi</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <!-- jika listdata1 adalah array maka if akan dieksekusi -->
                    <?php if (is_array($list_data1)) { ?>
                       <!-- Setiap elemen dalam $list_data1 akan disimpan sementara dalam variabel $dd selama satu iterasi loop. -->
                      <?php foreach ($list_data1 as $dd) : ?>
                        <!-- mencetak nilai id dari objek $dd. -->
                        <td><?= $dd->id; ?></td>
                        <!-- mencetak nilai namasupplier dari objek $dd. -->
                        <td><?= $dd->namasupplier; ?></td>
                        <td><?= $dd->alamat; ?></td>
                        <td><?= $dd->telepon; ?></td>
                         <!-- atribut data HTML yang menyimpan informasi namasupplier, alamat, dan telepon dari objek $dd.  -->
                        <td><a type="button" class="btn btn-info" data-namasupplier="<?php echo $dd->namasupplier; ?>" data-alamat="<?php echo $dd->alamat; ?>" data-telepon="<?php echo $dd->telepon; ?>" id="buttonpilih" style="margin:auto;height:20%"><i class="" aria-hidden="true"></i>Pilih</a></td>
                  </tr>
                  <!-- menutup loop -->
                <?php endforeach; ?>
                <!-- else bagian ini akan dieksekusi jika $list_data1 bukan array atau tidak ada data di dalamnya. -->
              <?php } else { ?>
                <td colspan="7" align="center"><strong>Data Kosong</strong></td>
              <?php } ?>
                </tbody>
                <!-- Membuka elemen tfoot, yang merupakan bagian dari tabel HTML yang berisi baris kaki tabel (footer). -->
                <tfoot>
                  <tr>
                    <th>Kode id</th>
                    <th>Nama Supplier</th>
                    <th>Alamat</th>
                    <th>No. Telepon</th>
                    <th>Aksi</th>
                  </tr>
                </tfoot>
              </table>
              <!-- /.box-body -->
            </div>
          </div>
        </div>
        </form>
      </div>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
      <script src="js/scripts.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
      <script src="assets/demo/chart-area-demo.js"></script>
      <script src="assets/demo/chart-bar-demo.js"></script>
      <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
      <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
      <script src="assets/demo/datatables-demo.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
      <script>
        $(document).on("click", "#buttonpilih", function() {

          var namasupplier1 = $(this).data('namasupplier');
          var alamat1 = $(this).data('alamat');
          var telepon1 = $(this).data('telepon');

          $("#namasupplier").val(namasupplier1);
          $("#alamat").val(alamat1);
          $("#telepon").val(telepon1);
          $('#modalsearch').modal('hide');

        });
        jQuery(document).ready(function($) {
          $('.btn-delete').on('click', function() {
            var getLink = $(this).attr('href');
            swal({
              title: 'Hapus Data',
              text: 'Yakin Ingin Menghapus Data ?',
              html: true,
              confirmButtonColor: '#d9534f',
              showCancelButton: true,
            }, function() {
              window.location.href = getLink
            });
            return false;
          });
        });
        $(function() {
          $('#example1').DataTable();
          $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false
          })
        });
      </script>
      <script>
        flatpickr("input[type=time]", {});
      </script>
      </script>
      </body>

      </html>
      <?php $this->load->view('v_footer'); ?>
