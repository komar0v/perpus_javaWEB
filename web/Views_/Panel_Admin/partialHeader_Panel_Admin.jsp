<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Panel Perpustakaan</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/ASSETS/asset_index/favicon.ico">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- pace-progress -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/pace-progress/themes/black/pace-theme-flat-top.css">
        <!-- adminlte-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/dist/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        <!-- SweetAlert2 -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/select2/css/select2.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    </head>

    <body class="hold-transition sidebar-mini pace-primary">
        <!-- Site wrapper -->
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">

                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" role="button">
                            <h5>Perpustakaan</h5>
                        </a>
                    </li>
                </ul>


                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">

                    <!-- Notifications Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="fas fa-user"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            <span class="dropdown-item dropdown-header">
                                <%
                                    String nama_Admin = "";
                                    Cookie[] cookies = request.getCookies();
                                    for (Cookie cookie : cookies) {
                                        if (cookie.getName().equals("namaAdmin")) {
                                            nama_Admin = cookie.getValue();
                                            out.println(nama_Admin);
                                        }
                                    }
                                %>
                            </span>
                            <div class="dropdown-divider"></div>
                            <a href="<%=request.getContextPath()%>/admin/doAdminLogout" class="dropdown-item">
                                <i class="fas fa-sign-out-alt mr-2"></i> Keluar
                            </a>

                        </div>
                    </li>

                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="#" class="brand-link">
                    <img src="<%=request.getContextPath()%>/ASSETS/asset_index/images/Group12.svg" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">
                        <%
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().equals("namaAdmin")) {
                                    nama_Admin = cookie.getValue();
                                    out.println(nama_Admin);
                                }
                            }
                        %>
                    </span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                   with font-awesome or any other icon font library -->
                            <li class="nav-item has-treeview">
                                <a href="<%=request.getContextPath()%>/admin/home" class="nav-link">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>
                                        Dashboard
                                    </p>
                                </a>
                            </li>

                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-book"></i>
                                    <p>
                                        Kelola Buku
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/admin/addBuku" class="nav-link">
                                            <i class="fas fa-plus-square nav-icon"></i>
                                            <p>Tambah Koleksi Buku</p>
                                        </a>
                                        <a href="<%=request.getContextPath()%>/admin/showBuku" class="nav-link">
                                            <i class="fas fa-th-list nav-icon"></i>
                                            <p>Lihat Koleksi Buku</p>
                                        </a>
                                        
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-users"></i>
                                    <p>
                                        Kelola Member
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/admin/showMembers" class="nav-link">
                                            <i class="fas fa-user-circle nav-icon"></i>
                                            <p>Lihat Semua Member</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-people-carry"></i>
                                    <p>
                                        Kelola Peminjaman
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/admin/confirmAmbil" class="nav-link">
                                            <i class="fas fa-hand-holding nav-icon"></i>
                                            <p>Pengambilan</p>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/admin/confirmPembatalan" class="nav-link">
                                            <i class="far fa-times-circle nav-icon"></i>
                                            <p>Pembatalan</p>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/admin/confirmPinjam" class="nav-link">
                                            <i class="fas fa-bookmark nav-icon"></i>
                                            <p>Konfirmasi Peminjaman</p>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="<%=request.getContextPath()%>/admin/pengembalianBuku" class="nav-link">
                                            <i class="fas fa-outdent nav-icon"></i>
                                            <p>Pengembalian</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item has-treeview">
                                <a href="<%=request.getContextPath()%>/admin/historyPinjam" class="nav-link">
                                    <i class="nav-icon fas fa-undo-alt"></i>
                                    <p>History Peminjaman</p>
                                </a>
                            </li>

                            <li class="nav-item has-treeview">
                                <a href="<%=request.getContextPath()%>/admin/showDenda" class="nav-link">
                                    <i class="nav-icon far fa-money-bill-alt"></i>
                                    <p>
                                        Pembayaran Denda
                                    </p>
                                </a>
                            </li>

                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>