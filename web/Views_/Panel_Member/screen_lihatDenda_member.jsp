<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_denda" %>

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Denda</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">Dashboard
                                </li>
                                <li class="breadcrumb-item active">Lihat Denda
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="content-body">
            <div class="row">
                <div class="col-12">

                </div>
            </div>
            <!-- Zero configuration table -->
            <section id="basic-datatable">
                <div class="row">
                    <div class="col-12">
                        <div class="card">

                            <div class="card-content">
                                <div class="card-body card-dashboard">

                                    <div class="table-responsive">
                                        <table class="table zero-configuration">
                                            <thead>
                                                <tr>
                                                    <th>Judul Buku</th>
                                                    <th>Besar Denda</th>
                                                    <th>Status</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% ArrayList<M_denda> listDenda = (ArrayList<M_denda>) request.getAttribute("denda_member");
                                                    if (listDenda.isEmpty() == true) {
                                                        out.print("<h4 class=\"font-weight-normal content-header-title pb-3\">DENDA TIDAK ADA</h4>");
                                                    }
                                                    
                                                    for (M_denda detailDenda : listDenda) {
                                                %>

                                                <tr>
                                                    <td><%= detailDenda.getJudul_buku()%></td>
                                                    <td>Rp. <%= detailDenda.getBesar_denda()%></td>

                                                    <% if (detailDenda.getDibayarkah().equals("belum")) {
                                                            out.print("<td><div class=\"badge badge-pill badge-danger\"><strong>BELUM DIBAYAR</strong></div></td>");
                                                        } else if (detailDenda.getDikembalikan().equals("sudah")) {
                                                            out.print("<td><div class=\"badge badge-pill badge-success\"><strong>TIDAK DENDA</strong></div></td>");
                                                        }
                                                    %>

                                                </tr>
                                                <%}%>

                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--/ Zero configuration table -->


        </div>
    </div>
</div>
<!-- END: Content-->

<%@ include file="/Views_/Panel_Member/partialFooter_Panel_Member.jsp" %>