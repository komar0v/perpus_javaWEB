<%@ include file="/Views_/Panel_Member/partialHeader_Panel_Member.jsp" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="Model_.M_akunMember" %>

<%  
    String password_lama = "";
    int id_member = 0;

    ArrayList<M_akunMember> detailMember = (ArrayList<M_akunMember>) request.getAttribute("detailMembernya");
    for (M_akunMember member_details : detailMember) {
        id_member = member_details.getId_member();
        password_lama = member_details.getPassword_member();

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
                                <li class="breadcrumb-item">Edit Profil
                                </li>
                                <li class="breadcrumb-item active">Ubah Password
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
                                <h4 class="card-title">Masukkan Password Baru</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <form action="<%=request.getContextPath()%>/member/domember_savePasswordBaru" method="POST" accept-charset="utf-8">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-md-6 col-12">
                                                    <div class="form-label-group">
                                                        <div class="position-relative has-icon-left">
                                                            <input type="hidden" name="idMember_" value="<% out.print(id_member); %>" >
                                                            <input type="password" id="fname-icon" class="form-control" name="passBaru_" placeholder="password baru">
                                                            <div class="form-control-position">
                                                                <i class="feather icon-lock"></i>
                                                            </div>
                                                        </div>
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