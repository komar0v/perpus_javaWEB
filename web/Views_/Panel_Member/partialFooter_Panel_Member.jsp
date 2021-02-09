<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- BEGIN: Footer-->
<footer class="footer footer-static footer-light">
    <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2020 | All rights Reserved</span><span class="float-md-right d-none d-md-block">Perpustakaan</span>
        <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
    </p>
</footer>
<!-- END: Footer-->


<!-- BEGIN: Vendor JS-->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->

<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/pickers/pickadate/legacy.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/charts/apexcharts.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/extensions/tether.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/extensions/shepherd.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/extensions/toastr.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/js/core/app-menu.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/js/core/app.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/js/scripts/components.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/js/scripts/datatables/datatable.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/tables/datatable/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/tables/datatable/buttons.print.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/js/scripts/ui/data-list-view.js"></script>
<script src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/js/scripts/pickers/dateTime/pick-a-datetime.js"></script>

<!-- END: Page JS-->

<!-- Notif Receiver -->
<script>
    <%
        if (session.getAttribute("flashMessageMember") != null) {
            out.println((String) session.getAttribute("flashMessageMember"));
            session.removeAttribute("flashMessageMember");
        }
    %>
</script>


</body>
<!-- END: Body-->

</html>