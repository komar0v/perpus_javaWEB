<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_buku" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Perpustakaan</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="./ASSETS/asset_index/vendors/owl-carousel/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./ASSETS/asset_index/vendors/owl-carousel/css/owl.theme.default.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.8.55/css/materialdesignicons.min.css"/>
        <link rel="stylesheet" href="./ASSETS/asset_index/vendors/aos/css/aos.css">
        <link rel="stylesheet" href="./ASSETS/asset_index/css/style.min.css">
        <link rel="icon" type="image/ico" href="./ASSETS/asset_index/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            .form-control-borderless {
                border: none;
            }

            .form-control-borderless:hover,
            .form-control-borderless:active,
            .form-control-borderless:focus {
                border: none;
                outline: none;
                box-shadow: none;
            }
        </style>
    </head>

    <body id="body" data-spy="scroll" data-target=".navbar" data-offset="100">
        <header id="header-section">
            <nav class="navbar navbar-expand-lg pl-3 pl-sm-0" id="navbar">
                <div class="container">
                    <div class="navbar-brand-wrapper d-flex w-100">
                        <a href="./"><img src="./ASSETS/asset_index/images/Group12.svg" alt=""></a>
                        <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="mdi mdi-menu navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse navbar-menu-wrapper" id="navbarSupportedContent">
                        <ul class="navbar-nav align-items-lg-center align-items-start ml-auto">
                            <li class="d-flex align-items-center justify-content-between pl-4 pl-lg-0">
                                <div class="navbar-collapse-logo">
                                    <a href="./"><img src="./ASSETS/asset_index/images/Group12.svg" alt=""></a>
                                </div>
                                <button class="navbar-toggler close-button" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="mdi mdi-close navbar-toggler-icon pl-5"></span>
                                </button>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#header-section">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#tentang-section">Tentang</a>
                            </li>

                            <li class="nav-item btn-contact-us">
                                <button class="btn btn-success" data-toggle="modal" data-target="#modal_login"><span class="mdi mdi-login-variant"></span> Login/Daftar</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <div class="content-wrapper">
            <div class="container">
                <div class="banner">
                    <div class="container">
                        <h1 class="font-weight-semibold">Hasil Pencarian Buku</h1>
                        <h4 class="font-weight-normal text-muted pb-3">${keyword_cari}</h4>

                    </div>
                </div>

                <div class="container">

                    <% ArrayList<M_buku> listBuku_hasilCari = (ArrayList<M_buku>) request.getAttribute("hasilCariBuku_tnpLogin");
                        if (listBuku_hasilCari.isEmpty() == true) {
                            out.print("<h4 class=\"font-weight-normal text-muted pb-3\">BUKU TIDAK ADA</h4>");
                        }

                        for (M_buku buku_ : listBuku_hasilCari) {
                    %>
                    <div class="post-entry-2 d-flex">
                        <div class="contents order-md-1 pl-0">
                            <h2><%= buku_.getJudul_buku()%></h2>
                            <div class="post-meta"><span class="d-block">Pengarang &bull; <%= buku_.getPengarang_buku()%></span><span class="date-read">Penerbit &bull; <%= buku_.getPenerbit_buku()%> diterbitkan tahun <%= buku_.getTahunterbit_buku()%></span></div>
                            <br><br>
                        </div>
                    </div>
                    <%}%> 


                </div>

                <section class="contact-details" id="tentang-section">
                    <div class="row text-center text-md-left">
                        <div class="col-12 col-md-6 col-lg-3 grid-margin">
                            <img src="./ASSETS/asset_index/images/Group12.svg" alt="" class="pb-2">

                        </div>
                        <div class="col-12 col-md-6 col-lg-3 grid-margin">
                            <h5 class="pb-2"><span class="mdi mdi-phone"></span> Telepon</h5>
                            <p class="text-muted">(628)xxx</p>
                        </div>
                        <div class="col-12 col-md-6 col-lg-3 grid-margin">
                            <h5 class="pb-2"><span class="mdi mdi-email"></span> E-Mail</h5>
                            <p class="text-muted">perpustakaan@gmail.com</p>
                        </div>

                        <div class="col-12 col-md-6 col-lg-3 grid-margin">
                            <h5 class="pb-2"><span class="mdi mdi-map-marker"></span> Alamat Kami</h5>
                            <p class="text-muted">Jalan yuk<br>Kec. Pasti Bisa<br>Indonesia</p>
                        </div>
                    </div>
                </section>
                <footer class="border-top">
                    <p class="text-center text-muted pt-4">Copyright © 2020 | All rights reserved.</p>
                </footer>
                <!-- Modal for Contact - us Button -->
                <div class="modal fade" id="modal_login" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel">LOGIN</h4>
                            </div>
                            <div class="modal-body">
                                <form action="./member/doMemberLogin" method="post" accept-charset="utf-8">
                                    <div class="form-group">
                                        <label for="Name">email</label>
                                        <input type="email" class="form-control" name="emailMember" id="emailMember" placeholder="email">
                                    </div>
                                    <div class="form-group">
                                        <label for="Email">password</label>
                                        <input type="password" class="form-control" name="passwordMember" id="passwordMember" placeholder="password">
                                    </div>
                                    <h6>Belum punya akun?<a style="color:#1998FF" href="http://localhost:8080/rpl_perpus/Register_member"> Daftar disini</a></h6>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-success">Login</button>
                                </form>      
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>
        <!--FLASH MESSAGE -->
        <script>
        </script>
        <script src="./ASSETS/asset_index/vendors/jquery/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="./ASSETS/asset_index/vendors/owl-carousel/js/owl.carousel.min.js"></script>
        <script src="./ASSETS/asset_index/vendors/aos/js/aos.js"></script>
        <script src="./ASSETS/asset_index/js/landingpage.js"></script>
    </body>

</html>