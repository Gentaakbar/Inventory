?><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Inventory</title>
        <link href="<?= base_url("assets/css/style.css")?>" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" href="<?php echo base_url()?>assets/sweetalert/dist/sweetalert.css">
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- jika diklik akan menuju beranda -->
            <a class="navbar-brand" href="<?php echo site_url('Beranda')?>">Inventory Web</a>
             <!-- Navbar-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            </form>
            <ul class="navbar-nav ml-auto ml-md-0">
                <!-- menampilkan nama sesuai name(admin/user) -->
                <a href="">Halo, <?=$this->session->userdata('name')?></a>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <div class="dropdown-divider"></div>
                        <!-- kemenu Profile -->
                        <form class="user" action="<?= site_url('views/profile'); ?>" method="post">
                        <a class="dropdown-item" href="<?php echo site_url('beranda/profile')?>">Profile</a>
                        <div class="dropdown-divider"></div>
                        <!-- menu logout -->
                        <form class="user" action="<?= site_url('Login/logout'); ?>" method="post">
                        <a class="dropdown-item" href="<?php echo site_url('beranda/logout')?>">Logout</a>
                    </div>
                </form>
                </li>
            </ul>
        </nav>