<%@page import="rd.ebudget.servlet.LoginServlet"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.Budget.UserPermission"%>
<%@page import="rd.ebudget.object.Budget.User"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories(); %>
<%
    String tag = "";
    User u = new User();
    if (!acc.IsNullToEmtyString(request.getParameter("id")).isEmpty()) {
        tag = "แก้ไข";

    } else {
        tag = "เพิ่ม";
    }
%>
<div class="main-content-inner">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.jsp">Home</a></li>
            <li><a href="index.jsp?service=UserManagement"> จัดการผู้ใช้งาน </a></li>
            <li> <%=tag%>ผู้ใช้งาน </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>
    <div class="page-content">
        <div class="page-header">
            <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ข้อมูลผู้ใช้งาน </small></h1>
        </div>
        <div class="col-xs-12">
            <div class="profile-user-info profile-user-info-striped">
                <div class="profile-info-row">
                    <div class="profile-info-name"> ลสก. </div>
                    <div class="profile-info-value" style="text-align: center;width: 300px;" >
                        <span>
                            <div class="input-group col-sm-12">
                                <input class="form-control active center" type="text" id="uid_tf" value="<%=acc.IsNullToEmtyString(request.getParameter("id"))%>">
                            </div>                                                
                        </span>
                    </div>
                    <div class="profile-info-value" style="text-align: center;width: 90px;" >
                        <span>
                            <div class="input-group">
                                <button class="btn btn-white btn-warning btn-sm col-sm-12" style="height:33px;" onclick="SearchInfo();">
                                    <i class="ace-icon fa fa-search bigger-120 orange"></i> ค้นหา
                                </button>
                            </div>                                                
                        </span>
                    </div>
                    <div class="profile-info-name"> ชื่อ - สกุล </div>
                    <div class="profile-info-value" style="text-align: center;">
                        <span>
                            <div class="input-group col-sm-2" style="display: inline-block;">
                                <input class="form-control center" type="text" id="title_tf" disabled="">
                            </div>
                            <div class="input-group col-sm-5" style="display: inline-block;">
                                <input class="form-control center" type="text" id="fname_tf" disabled="">
                            </div>
                            <div class="input-group col-sm-4" style="display: inline-block;">
                                <input class="form-control center" type="text" id="lname_tf" disabled="">
                            </div>
                        </span>
                    </div>
                    <div class="profile-info-name"> อีเมล์ </div>
                    <div class="profile-info-value center" style="text-align: center;">
                        <span class="editable">
                            <div class="input-group col-sm-12">
                                <input class="form-control active center" type="text" id="email_tf" disabled="">
                            </div>
                        </span>
                    </div>
                </div>
            </div>
            <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                <div class="profile-info-row">
                    <div class="profile-info-name"> ตำแหน่ง </div>
                    <div class="profile-info-value center" style="text-align: center;">
                        <span class="editable">
                            <div class="input-group col-sm-12">
                                <input class="form-control active center" type="text" id="position_m_tf" disabled="">
                            </div>
                        </span>
                    </div>
                    <div class="profile-info-name"> กลุ่มงาน </div>
                    <div class="profile-info-value center" style="text-align: center;">
                        <span class="editable">
                            <div class="input-group col-sm-12">
                                <input class="form-control active center" type="text" id="groupname_tf" disabled="">
                            </div>
                        </span>
                    </div>
                    <div class="profile-info-name"> รหัสหน่วยงาน </div>
                    <div class="profile-info-value center" style="text-align: center;">
                        <span class="editable">
                            <div class="input-group col-sm-12">
                                <input class="form-control active center" type="text" id="officeid_tf" disabled="">
                            </div>
                        </span>
                    </div>
                    <div class="profile-info-name"> หน่วยงาน </div>
                    <div class="profile-info-value center" style="text-align: center;">
                        <span class="editable">
                            <div class="input-group col-sm-12">
                                <input class="form-control" type="text" id="officename_tf" readonly="">
                            </div>
                        </span>
                    </div>
                </div>
            </div>


            <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                <div class="profile-info-row">
                    <div class="profile-info-name"> สิทธิ์การใช้งาน </div>
                    <div class="profile-info-value">
                        <div class="control-group">
                            <div class="checkbox">
                                <%

                                    String sup = "";

                                    if (!acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-UID")).equals("352451") && !acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-UID")).equals("150378")) {
                                        sup = "disabled=''";
                                    }
                                    UserPermission up = new UserPermission();
                                    if (!acc.IsNullToEmtyString(request.getParameter("id")).isEmpty()) {
                                        DB2Manager dbms = new DB2Manager();
                                        String query = "select * from e_budget.user_permission u where u.officeid = '" + acc.IsNullToEmtyString(request.getParameter("officeid")) + "' and u.id='" + acc.IsNullToEmtyString(request.getParameter("id")) + "'";
                                        ResultSet rs = dbms.GetDataAsResultSet(query);
                                        if (rs.next()) {
                                            up.setId(acc.IsNullToEmtyString(rs.getString("id")));
                                            up.setOfficeid(acc.IsNullToEmtyString(rs.getString("officeid")));
                                            up.setSuper_admin(acc.IsNullToEmtyString(rs.getString("super_admin")));
                                            up.setAdmin(acc.IsNullToEmtyString(rs.getString("admin")));
                                            up.setBoss(acc.IsNullToEmtyString(rs.getString("boss")));
                                            up.setFinance(acc.IsNullToEmtyString(rs.getString("finance")));
                                            up.setParcel(acc.IsNullToEmtyString(rs.getString("parcel")));
                                            up.setProject_manager(acc.IsNullToEmtyString(rs.getString("project_manager")));
                                            up.setPermission_status(acc.IsNullToEmtyString(rs.getString("permission_status")));
                                        } else {
                                            up.setId("");
                                            up.setOfficeid("");
                                            up.setSuper_admin("");
                                            up.setAdmin("");
                                            up.setBoss("");
                                            up.setFinance("");
                                            up.setParcel("");
                                            up.setProject_manager("");
                                            up.setPermission_status("");
                                        }
                                        rs.close();
                                        dbms.closeConnection();
                                    } else {
                                        up.setId("");
                                        up.setOfficeid("");
                                        up.setSuper_admin("");
                                        up.setAdmin("");
                                        up.setBoss("");
                                        up.setFinance("");
                                        up.setParcel("");
                                        up.setProject_manager("");
                                        up.setPermission_status("");
                                    }

                                %>

                                <label>
                                    <input <%=sup%> id="supper_admin_ch" type="checkbox" class="ace" <% out.print(up.getSuper_admin().equals("Y") ? "checked" : "");%>>
                                    <span class="lbl"> Supper Admin </span>
                                </label>
                            </div>

                            <div class="checkbox">
                                <label>
                                    <input <%=sup%> id="admin_ch" name="admin_ch" type="checkbox" class="ace" <% out.print(up.getAdmin().equals("Y") ? "checked" : "");%>>
                                    <span class="lbl"> ผู้ดูแลระบบ </span>
                                </label>
                            </div>

                            <div class="checkbox">
                                <label>
                                    <input id="boss_ch"  name="boss_ch" type="checkbox" class="ace" <% out.print(up.getBoss().equals("Y") ? "checked" : "");%>>
                                    <span class="lbl"> ผู้บริหาร </span>
                                </label>
                            </div>

                            <div class="checkbox">
                                <label>
                                    <input id="finance_ch" name="finance_ch" type="checkbox" class="ace" <% out.print(up.getFinance().equals("Y") ? "checked" : "");%>>
                                    <span class="lbl"> เจ้าหน้าที่การเงิน </span>
                                </label>
                            </div>

                            <div class="checkbox">
                                <label>
                                    <input id="parcel_ch" name="parcel_ch" type="checkbox" class="ace" <% out.print(up.getParcel().equals("Y") ? "checked" : "");%>>
                                    <span class="lbl"> เจ้าหน้าที่พัสดุ </span>
                                </label>
                            </div>

                            <div class="checkbox">
                                <label>
                                    <input id="project_manager_ch" name="project_ch" type="checkbox" class="ace" <% out.print(up.getProject_manager().equals("Y") ? "checked" : "");%>>
                                    <span class="lbl"> ผู้รับผิดชอบโครงการ </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                <div class="profile-info-row">
                    <div class="profile-info-name"> สถานะการใช้งาน </div>
                    <div class="profile-info-value">
                        <div class="control-group">
                            <div class="checkbox">
                                <label>
                                    <input id="permission_status_ch" type="checkbox" class="ace" <% out.print(up.getPermission_status().equals("Y") ? "checked" : "");%>>
                                    <span class="lbl"> ใช้งาน </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="space-12"></div>
            <div class="hr hr2"></div>
            <div class="space-6"></div>

            <div class="center">
                <button type="button" id="register_b" class="btn btn-sm btn-success btn-round" onclick="RegisterUser()" disabled="">
                    <i class="ace-icon fa fa-plus-circle bigger-150 middle"></i>
                    <span class="bigger-110">บันทึกผู้ใช้งาน</span>
                </button>
                <button type="button" class="btn btn-sm btn-danger btn-round" onclick="Goto('News')">
                    <i class="ace-icon fa fa-times-circle bigger-150 middle"></i>
                    <span class="bigger-110"> ยกเลิก </span>
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    function SearchInfo() {
        waitingDialog.show();
        var id = $('#uid_tf').val();
        $.ajax({
            type: "POST",
            url: "GetUserInfoEOffice",
            data: {id: id},
            cache: false,
            success: function (data) {
                var DataUser = $.parseJSON(data);
                $('#title_tf').val(DataUser['title']);
                $('#fname_tf').val(DataUser['fname']);
                $('#lname_tf').val(DataUser['lname']);
                $('#email_tf').val(DataUser['email']);
                $('#position_m_tf').val(DataUser['positionm']);
                $('#groupname_tf').val(DataUser['groupname']);
                $('#officeid_tf').val(DataUser['officeid']);
                $('#officename_tf').val(DataUser['officename']);
                $('#register_b').removeAttr("disabled");
                waitingDialog.hide();
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });

    }
    function RegisterUser() {
        var id = $('#uid_tf').val();
        var officeid = $('#officeid_tf').val();
        var super_admin = $('#supper_admin_ch').is(':checked') ? 'Y' : 'N';
        var admin = $('#admin_ch').is(':checked') ? 'Y' : 'N';
        var boss = $('#boss_ch').is(':checked') ? 'Y' : 'N';
        var finance = $('#finance_ch').is(':checked') ? 'Y' : 'N';
        var parcel = $('#parcel_ch').is(':checked') ? 'Y' : 'N';
        var project_manager = $('#project_manager_ch').is(':checked') ? 'Y' : 'N';
        var permission_status = $('#permission_status_ch').is(':checked') ? 'Y' : 'N';
        var user_permission = {
            id: id,
            super_admin: super_admin,
            admin: admin,
            boss: boss,
            finance: finance,
            parcel: parcel,
            project_manager: project_manager,
            officeid: officeid,
            permission_status: permission_status,
            METHOD: "UPDATE"
        };
        $.ajax({
            type: "POST",
            url: "UserPermissionServlet",
            data: {user_permission: user_permission},
            cache: false,
            success: function (data) {
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto("UserManagement");
                                }}}
                    });
                }
                waitingDialog.hide();
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });

    }
</script>
<%
    if (!acc.IsNull(request.getParameter("id"))) {
        out.print("<script>SearchInfo()</script>");
    }
%>