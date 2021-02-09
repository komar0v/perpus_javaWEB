<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_buku" %>

<%    String id_buku = "", judul_buku = "", pengarang_buku = "", penerbit_buku = "", tahunterbit_buku = "", isbn_buku = "", kategori_buku = "";
    ArrayList<M_buku> detailBuku = (ArrayList<M_buku>) request.getAttribute("detailBuku_hasilcari");
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

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Detail buku</h2>

                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            <div class="content-body">
                <section id="multiple-column-form">
                    <div class="row match-height">
                        <div class="col-12">
                            <div class="card">

                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="card-text">

                                            <div class="table-responsive">
                                                <table class="table table-hover">

                                                    <tbody>

                                                        <tr>
                                                            <th scope="row"><h3 class="card-title">Judul Buku : <% out.print(judul_buku); %></h3></th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><h3 class="card-title">Kategori : <% out.print(kategori_buku); %></h3></th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><h3 class="card-title">Pengarang : <% out.print(pengarang_buku); %></h3></th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><h3 class="card-title">Penerbit : <% out.print(penerbit_buku); %></h3></th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><h3 class="card-title">Tahun Terbit : <% out.print(tahunterbit_buku); %></h3></th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row"><h3 class="card-title">ISBN : <% out.print(isbn_buku);%></h3></th>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                                <form action="<%=request.getContextPath()%>/member/doMember_pinjamBuku" method="POST" accept-charset="utf-8">
                                                    <div class="col-md-8 offset-md-4">
                                                        <div class="col-md-6 col-12 mb-1">
                                                            <h5 class="text-bold-500">Pilih tanggal ambil buku</h5>
                                                            <input required type='text' name="tanggalAmbilBuku" class="form-control format-picker">
                                                            <input required type="hidden" class="form-control" name="kodeBuku" value="<% out.print(id_buku);%>"><br><br>
                                                            <button type="submit" class="text-center btn btn-success mr-1 mb-1">Pinjam</button>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>


        </div>
    </div>
</div>
<!-- END: Content-->

<%@ include file="/Views_/Panel_Member/partialFooter_Panel_Member.jsp" %>