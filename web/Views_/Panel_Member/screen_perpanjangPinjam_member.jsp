<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_pinjamBuku" %>

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Perpanjang Peminjaman Buku</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">Dashboard
                                </li>
                                <li class="breadcrumb-item active">Perpanjang Peminjaman
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
                                                    <th>Batas Peminjaman</th>
                                                    <th>Status</th>
                                                    <th>Tindakan</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% ArrayList<M_pinjamBuku> listBuku_dipinjam = (ArrayList<M_pinjamBuku>) request.getAttribute("listBuku_yangdipinjam");
                                                    if (listBuku_dipinjam.isEmpty() == true) {
                                                        out.print("<h4 class=\"font-weight-normal content-header-title pb-3\">BUKU TIDAK ADA</h4>");
                                                    }

                                                    for (M_pinjamBuku buku_dipinjam : listBuku_dipinjam) {
                                                %>

                                                <tr>
                                                    <td><%= buku_dipinjam.getJudul_buku()%></td>
                                                    <td><%= buku_dipinjam.getAkhir_pinjam()%></td>

                                                    <% if (buku_dipinjam.getSudah_diambil().equals("belum")) {
                                                            out.print("<td><div class=\"badge badge-pill badge-warning\">Buku belum diambil</div></td>");
                                                        } else if (buku_dipinjam.getSudah_diambil().equals("batal")) {
                                                            out.print("<td><div class=\"badge badge-pill badge-danger\">Buku batal diambil</div></td>");
                                                        } else {
                                                            out.print("<td><strong>" + buku_dipinjam.getPinjam_day_remaining() + " hari lagi</strong></td>");
                                                        }%>
                                                        
                                                        <td>
                                                            <form action="<%=request.getContextPath()%>/member/doMember_perpanjangPinjam" method="POST" accept-charset="utf-8">
                                                                <input type="hidden" name="idPinjam_" value="<%= buku_dipinjam.getId_pinjam()%>">
                                                                <button class="btn btn-relief-primary mr-1 mb-1" type="submit">Perpanjang 7 Hari</button>
                                                            </form>
                                                        </td>

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