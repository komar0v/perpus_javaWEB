<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Perpustakaan</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="./ASSETS/asset_index/vendors/owl-carousel/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./ASSETS/asset_index/vendors/owl-carousel/css/owl.theme.default.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.8.55/css/materialdesignicons.min.css" integrity="sha512-x96qcyADhiw/CZY7QLOo7dB8i/REOEHZDhNfoDuJlyQ+yZzhdy91eAa4EkO7g3egt8obvLeJPoUKEKu5C5JYjA==" crossorigin="anonymous" />
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
        </header><div class="banner">
            <div class="container">
                <h1 class="font-weight-semibold">Perpustakaan</h1>

                <img src="./ASSETS/asset_index/images/Group108.svg" alt="" width="400" height="300" class="img-fluid">
            </div>
        </div>
        <div class="content-wrapper">
            <div class="container">

                <section class="case-studies" id="case-studies-section">
                    <div class="row grid-margin">
                        <div class="col-12 text-center pb-5">
                            <h2>Akses digital Perpustakaan</h2>
                            <br>
                            <button class="btn btn-info" data-toggle="modal" data-target="#modalCariBuku">Klik disini untuk cari buku</button>
                        </div>
                        <div class="col-12 text-center pb-5" data-aos="zoom-in">
                            <h3 class="section-subtitle text-muted"><strong>Fitur - fitur</strong></h3>
                        </div>

                        <div class="col-12 col-md-6 col-lg-3 stretch-card mb-3 mb-lg-0" data-aos="zoom-in">

                        </div>
                        <div class="col-12 col-md-6 col-lg-3 stretch-card mb-3 mb-lg-0" data-aos="zoom-in" data-aos-delay="200">
                            <div class="card color-cards">
                                <div class="card-body p-0">
                                    <div class="bg-info text-center card-contents">
                                        <div class="card-image">
                                            <img src="./ASSETS/asset_index/images/web_search_eetr.svg" class="case-studies-card-img" alt="">
                                        </div>

                                    </div>
                                    <div class="card-details text-center pt-4">
                                        <h6 class="m-0 pb-1">Cari buku</h6>
                                        <p>dengan mudah</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-3 stretch-card mb-3 mb-lg-0" data-aos="zoom-in" data-aos-delay="400">
                            <div class="card color-cards">
                                <div class="card-body p-0">
                                    <div class="bg-violet text-center card-contents">
                                        <div class="card-image">
                                            <img src="./ASSETS/asset_index/images/Group126.svg" class="case-studies-card-img" alt="">
                                        </div>

                                    </div>
                                    <div class="card-details text-center pt-4">
                                        <h6 class="m-0 pb-1">Pinjam buku</h6>
                                        <p>dengan mudah</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-3 stretch-card" data-aos="zoom-in" data-aos-delay="600">

                        </div>
                    </div>
                </section>
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
                                    <h6>Belum punya akun?<a style="color:#1998FF" href="./register_member"> Daftar disini</a></h6>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-success">Login</button>
                                </form>      </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modalCariBuku" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel">Cari Buku</h4>
                            </div>
                            <div class="modal-body">
                                <form action="./cariBuku" method="GET" accept-charset="utf-8">
                                    <div class="text-center form-group">
                                        <input type="text" class="form-control" name="keyword_buku" id="keyword_buku" placeholder="Cari Buku apa?">
                                        <button type="submit" class="btn btn-rounded btn-outline-danger"><span class="mdi mdi-magnify"></span> Cari buku</button>
                                    </div>
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
            <% if(session.getAttribute("flashStatusRegister")!=null){
            out.println((String) session.getAttribute("flashStatusRegister"));
            session.removeAttribute("flashStatusRegister");
            }%>
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
