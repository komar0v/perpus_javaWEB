
<%@ include file="/Views_/Panel_Admin/partialHeader_Panel_Admin.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_pinjamBuku" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Pengembalian Pinjaman Buku</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">Dashboard</li>
                        <li class="breadcrumb-item active">Pengembalian Buku</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">

                    <div class="card">

                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="dataTable_" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID Pinjam</th>
                                        <th>Nama Member</th>
                                        <th>Judul Buku</th>
                                        <th>Mulai Pinjam</th>
                                        <th>Akhir Pinjam</th>
                                        <th>Tindakan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% ArrayList<M_pinjamBuku> listPermintaanPinjam = (ArrayList<M_pinjamBuku>) request.getAttribute("list_semuaOnGoingPinjam");
                                        for (M_pinjamBuku permintaanPinjam : listPermintaanPinjam) {
                                    %>
                                    <tr>
                                        <td><%= permintaanPinjam.getId_pinjam()%></td>
                                        <td><%= permintaanPinjam.getNama_member()%></td>
                                        <td><%= permintaanPinjam.getJudul_buku()%></td>
                                        <td><%= permintaanPinjam.getMulai_pinjam()%></td>
                                        <td><%= permintaanPinjam.getAkhir_pinjam()%></td>
                                        <td>
                                            <form action="<%=request.getContextPath() %>/admin/doAdmin_konfirmasiPengembalianBuku" method="POST" accept-charset="utf-8">
                                                <input type="hidden" name="idMember_" value="<%= permintaanPinjam.getId_member()%>" >
                                                <input type="hidden" name="idPinjam_" value="<%= permintaanPinjam.getId_pinjam()%>" >
                                                <input type="hidden" name="idBuku_" value="<%= permintaanPinjam.getId_buku()%>" >
                                                <button type="submit" class="btn btn-success btn-sm"><i class="fas fa-check-circle"></i> Buku dikembalikan</button>
                                            </form>
                                        </td>
                                        
                                    </tr>
                                    <%}%> 
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/Views_/Panel_Admin/partialFooter_Panel_Admin.jsp" %>
