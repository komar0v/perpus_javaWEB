<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <!-- BEGIN: Head-->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title>Member Dashboard | Perpustakaan</title>
        <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/ASSETS/asset_index/favicon.ico">
        <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/ASSETS/asset_index/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/css/extensions/tether-theme-arrows.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/css/extensions/tether.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/css/extensions/shepherd-theme-default.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/css/tables/datatable/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/css/extensions/toastr.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/colors.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/components.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/themes/semi-dark-layout.css">

        <!-- BEGIN: Page CSS-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/plugins/extensions/toastr.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/core/menu/menu-types/vertical-menu.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/core/colors/palette-gradient.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/pages/dashboard-analytics.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/pages/card-analytics.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/css/pages/data-list-view.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/vendors/css/pickers/pickadate/pickadate.css">
        <!-- END: Page CSS-->

    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->

    <body class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns navbar-floating footer-static" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="semi-dark-layout">

        <!-- BEGIN: Header-->
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
            <div class="navbar-wrapper">
                <div class="navbar-container content">
                    <div class="navbar-collapse" id="navbar-mobile">
                        <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                            <ul class="nav navbar-nav">
                                <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                            </ul>
                            <ul class="nav navbar-nav bookmark-icons">
                                <li class="nav-item d-none d-lg-block"><a class="nav-link" href="#" data-placement="top" title="Todo">Halo, <%
                                    String nama_Member = "";
                                    Cookie[] cookies = request.getCookies();
                                    for (Cookie cookie : cookies) {
                                        if (cookie.getName().equals("namaMember")) {
                                            nama_Member = cookie.getValue();
                                            out.println(nama_Member);
                                        }
                                    }
                                        %></a>
                                </li>
                            </ul>

                        </div>
                        <ul class="nav navbar-nav float-right">

                            <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">

                                    <span><img class="round" src="<%=request.getContextPath()%>/ASSETS/asset_panel_member/app-assets/images/portrait/small/person_1.png" alt="avatar" height="40" width="40"></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="<%=request.getContextPath()%>/member/editProfile"><i class="feather icon-user"></i> Edit Profil</a>
                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="<%=request.getContextPath()%>/member/doMemberLogout"><i class="feather icon-power"></i> Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- END: Header-->


        <!-- BEGIN: Main Menu-->
        <div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mr-auto">
                        <a class="navbar-brand" href="<%=request.getContextPath()%>/member/home">
                            <img src="<%=request.getContextPath()%>/ASSETS/asset_index/images/Group12.svg" class="brand-image img-circle elevation-3" width="40" height="40">
                        </a></li>
                    <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
                </ul>
            </div>
            <div class="shadow-bottom"></div>
            <div class="main-menu-content">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                    <li class=" nav-item"><a href="<%=request.getContextPath()%>/member/home"><i class="feather icon-home"></i><span class="menu-title">Dashboard</span></a></li>

                    <li class=" nav-item"><a href="<%=request.getContextPath()%>/member/pinjamBuku"><i class="fa fa-book"></i><span class="menu-title">Pinjam Buku</span></a></li>

                    <li class=" nav-item"><a href="<%=request.getContextPath()%>/member/perpanjangPeminjaman"><i class="fa fa-clock-o"></i><span class="menu-title">Perpanjang Pinjam</span></a></li>

                    <li class=" nav-item"><a href="<%=request.getContextPath()%>/member/daftarPinjam"><i class="fa fa-list-ol"></i><span class="menu-title">Daftar Pinjam</span></a></li>

                    <li class=" nav-item"><a href="<%=request.getContextPath()%>/member/batalPinjam"><i class="fa fa-times-circle-o"></i><span class="menu-title">Batal Pinjam</span></a></li>

                    <li class=" nav-item"><a href="<%=request.getContextPath()%>/member/denda"><i class="fa fa-money"></i><span class="menu-title">Denda</span></a></li>

                    <li class=" nav-item"><a href="#"><i class="feather icon-user"></i>
                            <span class="menu-title" data-i18n="User">
                                <%
                                    Cookie[] cookies2 = request.getCookies();
                                    for (Cookie cookie : cookies2) {
                                        if (cookie.getName().equals("namaMember")) {
                                            nama_Member = cookie.getValue();
                                            out.println(nama_Member);
                                        }
                                    }
                                %></span></a>
                        <ul class="menu-content">
                            <li><a href="<%=request.getContextPath()%>/member/editProfile"><i class="feather icon-user"></i><span class="menu-item">Edit Profil</span></a>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/member/doMemberLogout"><i class="feather icon-power"></i><span class="menu-item" data-i18n="View">Logout</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- END: Main Menu-->