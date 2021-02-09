<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
        <b>Perpustakaan</b>
    </div>
    <strong>Copyright &copy; 2020 </strong> All rights reserved.
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- pace-progress -->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/pace-progress/pace.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/dist/js/adminlte.min.js"></script>
<!-- SweetAlert2 -->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/select2/js/select2.full.min.js"></script>
<!-- DataTables -->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>

<!-- JAVASCRIPT TABEL BUKU -->
<script>
    $(function () {
        $("#dataTable_").DataTable({
            "responsive": true,
            "autoWidth": false,
        });

    });
</script>

<!-- JAVASCRIPT DROPDOWN KATEGORI BUKU -->
<script>
    $('.drpDown').select2({
        placeholder: 'pilih kategori',
    })
</script>
<!-- JAVASCRIPT BATASI TAHUN (4 digit) TAUN TERBIT BUKU -->
<script>
    function fourdigityr(elem) {
        if (elem.value.length > 4) {
            elem.value = elem.value.slice(0, 4);
        }
    }
</script>

<script>
    const Toast = Swal.mixin({
        toast: true,
        position: 'center',
        showConfirmButton: false,
        timer: 3000
    });
    <% if (session.getAttribute("flashMessageAdmin") != null) {
                    out.println((String) session.getAttribute("flashMessageAdmin"));
                    session.removeAttribute("flashMessageAdmin");
                }%>
</script>

</body>

</html>