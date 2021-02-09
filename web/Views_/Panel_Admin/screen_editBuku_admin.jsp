<%@ include file="/Views_/Panel_Admin/partialHeader_Panel_Admin.jsp" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_buku" %>

<%
    String[] kategori_list = {"Novel", "Cergam", "Komik", "Ensiklopedia", "Jurnal", "Karya Ilmiah", "Biografi", "Cergam", "lainnya"};
    String id_buku = "", judul_buku = "", pengarang_buku = "", penerbit_buku = "", tahunterbit_buku = "", isbn_buku = "", kategori_buku = "";
    ArrayList<M_buku> detailBuku = (ArrayList<M_buku>) request.getAttribute("detailBukunya");
    for (M_buku book_details : detailBuku) {
        id_buku = book_details.getId_buku();
        judul_buku = book_details.getJudul_buku();
        pengarang_buku = book_details.getPengarang_buku();
        kategori_buku = book_details.getKategori_buku();
        isbn_buku = book_details.getIsbn_buku();
        tahunterbit_buku = book_details.getTahunterbit_buku();
        penerbit_buku = book_details.getPenerbit_buku();
    }
%>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Edit Data Buku</h1>
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
                                <form action="<%=request.getContextPath()%>/admin/doAdmin_updateBuku" method="POST" accept-charset="utf-8">
                                    <label for="judulBuku">Judul Buku</label>
                                    <input required type="text" class="form-control" name="judulBuku" id="judulBuku" placeholder="Judul Buku" value="<% out.print(judul_buku); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="pengarangBuku">Pengarang</label>
                                        <input required type="text" class="form-control" name="pengarangBuku" id="pengarangBuku" placeholder="Pengarang Buku" value="<% out.print(pengarang_buku); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="isbnBuku">ISBN</label>
                                        <input required type="text" class="form-control" name="isbnBuku" id="isbnBuku" placeholder="ISBN Buku (number only)" value="<% out.print(isbn_buku); %>">
                                    </div>

                                    <div class="form-group row">
                                        <label for="inputEmail3" class="col-sm-2 col-form-label">Kategori</label>
                                        <div class="col-sm-10">
                                            <select name="kategoriBuku" class="form-control drpDown" style="width: 100%;">
                                                <option></option>

                                                <%
                                                    for (int i = 0; i < kategori_list.length; i++) {
                                                        if(kategori_buku.equals(kategori_list[i])){
                                                            out.println("<option selected value=\"" + kategori_list[i] + "\">" + kategori_list[i] + "</option>");
                                                        }else{
                                                            out.println("<option value=\"" + kategori_list[i] + "\">" + kategori_list[i] + "</option>");
                                                        }
                                                        
                                                    }
                                                %>

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
                                <input required type="hidden" class="form-control" name="kodeBuku" id="kodeBuku" placeholder="Kode Buku" value="<% out.print(id_buku); %>">


                                <div id="tahunTerbitBuku" class="form-group">
                                    <label for="tahunTerbitBuku">Tahun Terbit</label>
                                    <input required type="number" oninput="fourdigityr(this);" min="1900" max="2050" class="form-control" name="tahunTerbitBuku" id="tahunTerbitBuku" placeholder="Tahun Terbit" value="<% out.print(tahunterbit_buku); %>">
                                </div>
                                <div class="form-group">
                                    <label for="penerbitBuku">Penerbit Buku</label>
                                    <input required type="text" class="form-control" name="penerbitBuku" id="penerbitBuku" placeholder="Penerbit Buku" value="<% out.print(penerbit_buku); %>">
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
                                    <button type="submit" class="btn btn-block btn-success">Simpan Perubahan</button>
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