<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Cari buku untuk dipinjam</h2>

                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            <div class="content-body">

                <!-- Input with Icons start -->
                <section id="input-with-icons">
                    <div class="row match-height">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-12 col-12">
                                                <div class="text-bold-600 font-medium-2 mb-1">
                                                    Cari Judul Buku
                                                </div>
                                                <form action="<%=request.getContextPath()%>/member/cariBuku" method="GET" accept-charset="utf-8">
                                                    <fieldset class="form-group position-relative has-icon-left">

                                                        <input required="" type="text" class="form-control form-control-lg" name="keyword_cari" id="keyword_cari" placeholder="cari judul buku apa?">
                                                        <div class="form-control-position">
                                                            <i class="feather icon-search"></i>
                                                        </div>
                                                    </fieldset>
                                                    <button type="submit" class="btn btn-success mr-1 mb-1">Cari Buku</button>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Input with Icons end -->
            </div>


        </div>
    </div>
</div>
<!-- END: Content-->

<%@ include file="/Views_/Panel_Member/partialFooter_Panel_Member.jsp" %>