
<%@ include file="/Views_/Panel_Admin/partialHeader_Panel_Admin.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_buku" %>


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Semua koleksi buku</h1>
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
                <div class="col-12">

                    <div class="card">

                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="dataTable_" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Judul Buku</th>
                                        <th>Pengarang</th>
                                        <th>Tahun Terbit</th>
                                        <th>Tindakan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% ArrayList<M_buku> listBuku = (ArrayList<M_buku>)request.getAttribute("list_koleksiBuku"); 
                                    for(M_buku buku_:listBuku){
                                    %>
                                    <tr>
                                        <td><%= buku_.getJudul_buku() %></td>
                                        <td><%= buku_.getPengarang_buku()%></td>
                                        <td><%= buku_.getTahunterbit_buku()%></td>
                                        <td>
                                            <button onclick="window.location.href = '<%=request.getContextPath()%>/admin/editBuku?idBuku_=<%= buku_.getId_buku()%>'" type="button" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i> Edit</button>
                                            |
                                            <button onclick="window.location.href = '<%=request.getContextPath()%>/admin/doAdmin_deleteBuku?idBuku_=<%= buku_.getId_buku()%>'" type="button" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Hapus</button>
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
