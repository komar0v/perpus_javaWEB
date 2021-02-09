<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_akunMember" %>

<%    String[] jenisKel = {"Laki-laki", "Perempuan"};
    String nama_member = "", alamat_member = "", email_member = "", jeniskel_member = "", notel_member = "";
    int id_member = 0;

    ArrayList<M_akunMember> detailMember = (ArrayList<M_akunMember>) request.getAttribute("detailMembernya");
    for (M_akunMember member_details : detailMember) {
        id_member = member_details.getId_member();
        nama_member = member_details.getNama_member();
        email_member = member_details.getEmail_member();
        notel_member = member_details.getNotel_member();
        alamat_member = member_details.getAlamat_member();
        jeniskel_member = member_details.getJeniskel_member();

    }
%>


<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Edit Profil Member</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">Dashboard
                                </li>
                                <li class="breadcrumb-item active">Edit Profil
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

            <section id="multiple-column-form">
                <div class="row match-height">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Data Profil</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <form action="<%=request.getContextPath()%>/member/domember_updateProfile" method="POST" accept-charset="utf-8">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-md-6 col-12">
                                                    <div class="form-label-group">
                                                        <div class="position-relative has-icon-left">
                                                            <input type="hidden" name="idMember" value="<% out.print(id_member); %>" >
                                                            <input type="text" id="fname-icon" class="form-control" name="namaMember" placeholder="Nama.. (tnp angka)" value="<% out.print(nama_member); %>">
                                                            <div class="form-control-position">
                                                                <i class="feather icon-user"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-label-group">
                                                        <div class="position-relative has-icon-left">
                                                            <input type="number" id="fname-icon" class="form-control" name="notelMember" placeholder="Nomor Telepon (08xx..)" value="<% out.print(notel_member); %>">
                                                            <div class="form-control-position">
                                                                <i class="fa fa-phone"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-label-group">
                                                        <div class="position-relative has-icon-left">
                                                            <input type="email" id="fname-icon" class="form-control" name="emailMember" placeholder="E-Mail" value="<% out.print(email_member); %>">
                                                            <div class="form-control-position">
                                                                <i class="feather icon-mail"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-label-group">
                                                        <fieldset class="form-group">
                                                            <select name="jeniskelMember" class="form-control" id="basicSelect">
                                                                <%
                                                                    for (int i = 0; i < jenisKel.length; i++) {
                                                                        if (jeniskel_member.equals(jenisKel[i])) {
                                                                            out.print("<option selected value=" + jenisKel[i] + ">" + jenisKel[i] + "</option>");
                                                                        } else {
                                                                            out.print("<option value=" + jenisKel[i] + ">" + jenisKel[i] + "</option>");
                                                                        }
                                                                    }

                                                                %>
                                                            </select>
                                                        </fieldset>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-label-group">
                                                        <div class="position-relative has-icon-left">
                                                            <input type="text" name="alamatMember" id="fname-icon" class="form-control" name="fname-icon" placeholder="Alamat" value="<% out.print(alamat_member);%>">
                                                            <div class="form-control-position">
                                                                <i class="feather icon-map-pin"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-12">
                                                    <div class="form-label-group">
                                                        <button type="button" onclick="window.location.href = '<%=request.getContextPath()%>/member/gantiPassword'" class="btn btn-info mr-1 mb-1"><i class="feather icon-lock"></i> Klik disini untuk Ganti Password</button>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-success mr-1 mb-1">Simpan Perubahan</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>
</div>
<!-- END: Content-->

<%@ include file="/Views_/Panel_Member/partialFooter_Panel_Member.jsp" %>