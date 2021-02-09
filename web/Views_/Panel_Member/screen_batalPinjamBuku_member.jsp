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
                        <h2 class="content-header-title float-left mb-0">Batalkan Pinjam Buku</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">Dashboard
                                </li>
                                <li class="breadcrumb-item active">Batal Pinjam
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
                                                    <th>Status</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% ArrayList<M_pinjamBuku> listBuku_dipinjam = (ArrayList<M_pinjamBuku>) request.getAttribute("listBuku_yangmauDibatalkanPinjamnya");
                                                    if (listBuku_dipinjam.isEmpty() == true) {
                                                        out.print("<h4 class=\"font-weight-normal content-header-title pb-3\">BUKU TIDAK ADA</h4>");
                                                    }

                                                    for (M_pinjamBuku buku_dipinjam : listBuku_dipinjam) {
                                                %>

                                                <tr>
                                                    <td><%= buku_dipinjam.getJudul_buku()%></td>

                                                    

                                                    <% if (buku_dipinjam.getBatalkah().equals("tidak")) {
                                                            out.print("<td><button onclick=\"window.location.href ='"+request.getContextPath()+"/member/doMember_mintaDibatalkanPinjam?idPinjam_="+buku_dipinjam.getId_pinjam()+"'\" type=\"button\" class=\"btn btn-relief-primary mr-1 mb-1\">Batal Pinjam</button></td>");
                                                        } else if (buku_dipinjam.getBatalkah().equals("onProccess")) {
                                                            out.print("<td><div class=\"badge badge-pill badge-danger\">sedang menunggu konfirmasi</div></td>");
                                                        }else if (buku_dipinjam.getBatalkah().equals("ya")){
                                                            out.print("<td><div class=\"badge badge-pill badge-success\">Buku sudah dibatalkan pinjamnya</div></td>");
                                                        }else{
                                                            out.print("<td><div class=\"badge badge-pill badge-danger\">tidak bisa dibatalkan</div></td>");
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