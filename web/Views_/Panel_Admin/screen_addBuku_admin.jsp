<%@ include file="/Views_/Panel_Admin/partialHeader_Panel_Admin.jsp" %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Tambah Koleksi Buku</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">Dashboard</li>
                        <li class="breadcrumb-item active">Kelola Buku</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-6">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Data Buku</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group">
                                <form action="<%=request.getContextPath()%>/admin/doAdmin_addBuku" method="POST" accept-charset="utf-8">
                                    <label for="judulBuku">Judul Buku</label>
                                    <input required type="text" class="form-control" name="judulBuku" id="judulBuku" placeholder="Judul Buku">
                                    </div>
                                    <div class="form-group">
                                        <label for="pengarangBuku">Pengarang</label>
                                        <input required type="text" class="form-control" name="pengarangBuku" id="pengarangBuku" placeholder="Pengarang Buku">
                                    </div>
                                    <div class="form-group">
                                        <label for="isbnBuku">ISBN</label>
                                        <input required type="text" class="form-control" name="isbnBuku" id="isbnBuku" placeholder="ISBN Buku (number only)">
                                    </div>

                                    <div class="form-group row">
                                        <label for="inputEmail3" class="col-sm-2 col-form-label">Kategori</label>
                                        <div class="col-sm-10">
                                            <select required="" name="kategoriBuku" class="form-control drpDown" style="width: 100%;">
                                                <option></option>
                                                <option value="Novel">Novel</option>
                                                <option value="Cergam">Cergam</option>
                                                <option value="Komik">Komik</option>
                                                <option value="Ensiklopedia">Ensiklopedia</option>
                                                <option value="Jurnal">Jurnal</option>
                                                <option value="Karya Ilmiah">Karya Ilmiah</option>
                                                <option value="Biografi">Biografi</option>
                                                <option value="Cergam">Cergam</option>
                                                <option value="lainnya">lainnya</option>
                                            </select>
                                        </div>
                                    </div>

                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">
                                    Data Buku
                                </h3>

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="kodeBuku">Kode Buku</label>
                                    <input required type="text" class="form-control" name="kodeBuku" id="kodeBuku" placeholder="Kode Buku">
                                </div>

                                <div id="tahunTerbitBuku" class="form-group">
                                    <label for="tahunTerbitBuku">Tahun Terbit</label>
                                    <input required type="number" oninput="fourdigityr(this);" min="1900" max="2050" class="form-control" name="tahunTerbitBuku" id="tahunTerbitBuku" placeholder="Tahun Terbit">
                                </div>
                                <div class="form-group">
                                    <label for="penerbitBuku">Penerbit Buku</label>
                                    <input required type="text" class="form-control" name="penerbitBuku" id="penerbitBuku" placeholder="Penerbit Buku">
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-outline card-info">

                            <!-- /.card-header -->
                            <div class="card-body pad">
                                <div class="mb-3">
                                    <button type="submit" class="btn btn-block btn-success">Tambahkan Buku</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-->
                </div>


                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <%@ include file="/Views_/Panel_Admin/partialFooter_Panel_Admin.jsp" %>