
<%@ include file="/Views_/Panel_Admin/partialHeader_Panel_Admin.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_denda" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Semua Denda member</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">Dashboard</li>
                        <li class="breadcrumb-item active">Denda</li>
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
                                        <th>Besar Denda</th>
                                        <th>Tindakan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% ArrayList<M_denda> listDenda = (ArrayList<M_denda>) request.getAttribute("list_denda");
                                        int i = 0;
                                        for (M_denda denda_ : listDenda) {
                                            i = i + 1;
                                    %>
                                    <tr>
                                        <td><%= denda_.getId_pinjam()%></td>
                                        <td><%= denda_.getNama_member()%></td>
                                        <td><%= denda_.getBesar_denda()%></td>
                                        <td>
                                            <button type="button" data-toggle="modal" data-target="#modal-sm2_<%=i%>" class="btn btn-success btn-sm"><i class="fas fa-check-square"></i> Konfirmasi bayar</button>
                                            <div class="modal fade" id="modal-sm2_<%=i%>">
                                                <div class="modal-dialog modal-sm">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Konfirmasi Bayar</h4>

                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="alert alert-warning alert-dismissible">
                                                                <h6><i class="icon fas fa-exclamation-triangle"></i>Perhatian!</h6>

                                                                <p>Pastikan member "<%= denda_.getNama_member()%>" membayar sebesar<br> Rp. <%= denda_.getBesar_denda()%><br></p>

                                                            </div>
                                                        </div>
                                                        <div class="modal-footer justify-content-between">
                                                            <form action="<%=request.getContextPath()%>/admin/doAdmin_konfirmBayarDenda" method="POST" accept-charset="utf-8">
                                                                <button type="button" class="btn btn-block btn-default" data-dismiss="modal">Tidak</button>
                                                                <br>
                                                                <input type="hidden" name="idPinjam_" value="<%= denda_.getId_pinjam()%>" >
                                                                <input type="hidden" name="idDenda_" value="<%= denda_.getId_denda()%>" >
                                                                <button type="submit" class="btn btn-block btn-primary">Ya, sudah dibayar</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                                <!-- /.modal-dialog -->
                                            </div>
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
