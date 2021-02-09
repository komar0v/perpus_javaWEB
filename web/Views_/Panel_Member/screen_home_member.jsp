<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <!-- Dashboard Analytics Start -->
            <section id="dashboard-analytics">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="card bg-analytics text-white">
                            <div class="card-content">

                                <div class="card-body text-center">
                                    <img class="card-img img-fluid" src="<%=request.getContextPath()%>/ASSETS/asset_index/images/Group108.svg">
                                    <img src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/images/elements/decore-left.png" class="img-left" alt="card-img-left">
                                    <img src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/images/elements/decore-right.png" class="img-right" alt="card-img-right">

                                    <div class="text-center">
                                        <h1 class="mb-2 text-white">Selamat Datang, <%
                                            String nama_Membermn = "";
                                            Cookie[] kuki = request.getCookies();
                                            for (Cookie cookie : kuki) {
                                                if (cookie.getName().equals("namaMember")) {
                                                    nama_Membermn = cookie.getValue();
                                                    out.println(nama_Membermn);
                                                }
                                            }
                                            %></h1>
                                        <p class="m-auto w-75">Kamu sudah terdaftar dan sudah dapat meminjam buku</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="<%=request.getContextPath()%>/member/daftarPinjam">
                            <div class="card">
                                <div class="card-header d-flex flex-column align-items-start pb-0">
                                    <div class="avatar bg-rgba-primary p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="fa fa-book text-primary font-medium-5"></i>
                                        </div>
                                    </div>
                                    <h2 class="text-bold-700 mt-1 mb-25">${jumlahbuku_dipinjam}</h2>
                                    <p class="mb-0">Buku Dipinjam</p>
                                </div>
                                <div class="card-content">
                                    <div id="subscribe-gain-chart"></div>
                                </div>
                            </div>
                        </a>


                        <div data-toggle="modal" data-target="#mdlSearchBook" class="card">
                            <div class="card-header d-flex flex-column align-items-start pb-0">
                                <div class="avatar bg-rgba-warning p-50 m-0">
                                    <div class="avatar-content">
                                        <i class="fa fa-search text-success font-medium-5"></i>
                                    </div>
                                </div>
                                <h2 class="text-bold-700 mt-1 mb-25">Cari Buku</h2>
                                <p class="mb-0">Klik disini untuk cari buku</p>
                            </div>
                            <div class="card-content">
                                <div id="orders-received-chart"></div>
                            </div>
                        </div>

                        <div class="modal fade text-left" id="mdlSearchBook" tabindex="-1" role="dialog" aria-labelledby="myModalLabel160" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-success white">
                                        <h5 class="modal-title" id="myModalLabel160">Cari Judul Buku</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <form action="<%=request.getContextPath()%>/member/cariBuku" method="GET" accept-charset="utf-8">
                                                <input required="" type="text" name="keyword_cari" id="keyword_cari" class="form-control" placeholder="Cari Judul Buku Apa?">
                                                <div class="form-control-position">
                                                    <i class="fa fa-search"></i>
                                                </div>
                                                <div class="form-group col-12">
                                                    <div class="col-12 text-center">
                                                        <br>
                                                        <button type="submit" class="btn btn-success mr-1 mb-1">Cari Buku</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-3 col-md-6 col-12">
                        <a href="<%=request.getContextPath()%>/member/denda">
                            <div class="card">
                                <div class="card-header d-flex flex-column align-items-start pb-0">
                                    <div class="avatar bg-rgba-warning p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="fa fa-money text-warning font-medium-5"></i>
                                        </div>
                                    </div>
                                    <h2 class="text-bold-700 mt-1 mb-25">${jumlahDendaMember}</h2>
                                    <p class="mb-0">Denda</p>
                                </div>
                                <div class="card-content">
                                    <div id="orders-received-chart"></div>
                                </div>
                            </div>
                        </a>

                    </div>


                </div>

                <!--<div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="mb-0">Cari Buku untuk dipinjam</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="form-body">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" id="first-name-floating-icon" class="form-control" name="fname-floating-icon" placeholder="Cari Buku Apa?">
                                            <div class="form-control-position">
                                                <i class="fa fa-search"></i>
                                            </div>
                                            <div class="form-group col-12">
                                                <div class="col-12 text-center">
                                                    <br>
                                                    <button type="submit" class="btn btn-primary mr-1 mb-1">Cari Buku</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->




            </section>
            <!-- Dashboard Analytics end -->

        </div>
    </div>
</div>
<!-- END: Content-->

<%@ include file="/Views_/Panel_Member/partialFooter_Panel_Member.jsp" %>