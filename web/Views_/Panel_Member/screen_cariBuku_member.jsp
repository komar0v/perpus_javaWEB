<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_buku" %>

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Hasil pencarian buku "${keywordCaribuku}"</h2>

                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            <div class="content-body">
                <!-- Data list view starts -->
                <section id="data-list-view" class="data-list-view-header">

                    <!-- DataTable starts -->
                    <div class="table-responsive">
                        <table class="table data-list-view">
                            <thead>
                                <tr>
                                    <th>Judul Buku</th>
                                    <th>Pengarang</th>
                                    <th>Tahun Terbit</th>
                                    <th>Penerbit</th>
                                    <th>Tindakan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% ArrayList<M_buku> listBuku_hasilCari = (ArrayList<M_buku>) request.getAttribute("detailBuku_hasilcari");
                                    if (listBuku_hasilCari.isEmpty() == true) {
                                        out.print("<h4 class=\"font-weight-normal content-header-title pb-3\">BUKU TIDAK ADA</h4>");
                                    }

                                    for (M_buku buku_ : listBuku_hasilCari) {
                                %>
                                <tr>
                                    <td class="product-name"><%= buku_.getJudul_buku() %></td>
                                    <td class="product-category"><%= buku_.getPengarang_buku()%></td>
                                    <td>
                                        <%= buku_.getTahunterbit_buku()%>
                                    </td>
                                    <td class="product-price"><%= buku_.getPenerbit_buku()%></td>
                                    <td class="product-action">
                                        <a class="btn btn-primary mr-1 mb-1" href="<%=request.getContextPath()%>/member/detailBuku?idBuku=<%= buku_.getId_buku()%>" role="button">Detail</a>
                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                    <!-- DataTable ends -->


                </section>
                <!-- Data list view end -->

            </div>


        </div>
    </div>
</div>
<!-- END: Content-->

<%@ include file="/Views_/Panel_Member/partialFooter_Panel_Member.jsp" %>