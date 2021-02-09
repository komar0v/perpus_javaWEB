<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/Views_/Panel_Admin/partialHeader_Panel_Admin.jsp" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Selamat Datang!</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>Tambah</h3>

                            <p>Koleksi Buku</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <a href="<%=request.getContextPath()%>/admin/addBuku" class="small-box-footer">Tambah Buku <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>${jumlahKoleksiBuku}</h3>

                            <p>Koleksi Buku</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-boxes"></i>
                        </div>
                        <a href="<%=request.getContextPath()%>/admin/showBuku" class="small-box-footer">Info Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>${jumlahMember}</h3>

                            <p>Member Terdaftar</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <a href="<%=request.getContextPath()%>/admin/showMembers" class="small-box-footer">Lihat Detail <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <!-- ./col -->
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-success">
                        <a class="weatherwidget-io" href="https://forecast7.com/en/n7d88110d43/special-region-of-yogyakarta/" data-label_1="Yogyakarta" data-font="Roboto" data-icons="Climacons Animated" data-mode="Current" data-theme="pure">Yogyakarta</a>
                        <script>
                            !function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (!d.getElementById(id)) {
                                    js = d.createElement(s);
                                    js.id = id;
                                    js.src = 'https://weatherwidget.io/js/widget.min.js';
                                    fjs.parentNode.insertBefore(js, fjs);
                                }
                            }(document, 'script', 'weatherwidget-io-js');
                        </script>
                        <a class="small-box-footer"><i class="fas fa-cloud"></i></a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>${jumlahMemberMintaKonfirmPinjam}</h3>

                            <p>Menunggu Konfirmasi Pinjam Buku</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <a href="<%=request.getContextPath()%>/admin/confirmPinjam" class="small-box-footer">Lihat Detail <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3 style="color: white;">${jumlahMemberMauAmbilBuku}</h3>

                            <p style="color: white;">Member Ambil Buku</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-hand-holding-heart"></i>
                        </div>
                        <a href="<%=request.getContextPath()%>/admin/confirmAmbil" class="small-box-footer">Lihat Detail <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>${jumlahMemberMintaBatal}</h3>

                            <p>Member Batal Pinjam</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-undo-alt"></i>
                        </div>
                        <a href="<%=request.getContextPath()%>/admin/confirmPembatalan" class="small-box-footer">Lihat Detail <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>${jumlahMemberBelumBayarDenda}</h3>

                            <p>Member Blm Bayar Denda</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <a href="<%=request.getContextPath()%>/admin/showDenda" class="small-box-footer">Lihat Detail <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Default box -->

        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-info"></i>
                    Informasi
                </h3>
            </div>
            <div class="card-body">
                <h4>Halaman ini merupakan halaman admin perpustakaan</h4>

            </div>
            <!-- /.card -->
        </div>


    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/Views_/Panel_Admin/partialFooter_Panel_Admin.jsp" %>
