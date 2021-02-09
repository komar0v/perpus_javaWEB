<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Log in</title>
        <link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/ASSETS/asset_index/favicon.ico">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- SweetAlert2 -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
        <!-- Toastr -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/toastr/toastr.min.css">
        <link rel="icon" type="image/ico" href="./ASSETS/asset_index/favicon.ico">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/dist/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>

    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <img src="<%=request.getContextPath()%>/ASSETS/asset_index/images/Group12.svg" class="brand-image img-circle elevation-3" style="opacity: .8">
                <h2>Panel Administrasi<br> Perpustakaan</h2>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">

                    <form action="<%=request.getContextPath()%>/admin/doAdminLogin" method="POST" accept-charset="utf-8">
                        <div class="input-group mb-3">
                            <input type="text" name="usernameA" class="form-control" placeholder="username">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" name="passwordA" class="form-control" placeholder="password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">

                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">LOGIN</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/dist/js/adminlte.min.js"></script>
        <!-- SweetAlert2 -->
        <script src="<%=request.getContextPath()%>/ASSETS/asset_panel_admin/plugins/sweetalert2/sweetalert2.min.js"></script>

        <script>
            const Toast = Swal.mixin({
                toast: true,
                position: 'center',
                showConfirmButton: false,
                timer: 3000
            });
            <% if(session.getAttribute("flashMessageAdmin")!=null){
            out.println((String) session.getAttribute("flashMessageAdmin"));
            session.removeAttribute("flashMessageAdmin");
            }%>
        </script>
    </body>

</html>