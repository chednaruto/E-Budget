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

<div class="main-content-inner">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.jsp">Home</a></li>

        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>
    <div class="page-content">
        <div class="page-header">
            <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ยินดีต้อนรับเข้าสู่ระบบบริหารและติดตามการเบิกจ่ายเงินงบประมาณ : e-Budget & Tracking </small></h1>
        </div>
        <div class="row" style="margin-right: -40px">
        </div>
    </div>
    <%
        if (request.getMethod().equals("POST")) {
            //acc.ListRequest(request);
            if (acc.IsNullToEmtyString(request.getParameter("authen")).equals("true")) { //ตรวจสอบ Authen จาด E-Office
                //authen ผ่าน
                User u = new User();
                u.setId(acc.Decryp(request.getParameter("id"), acc.getKey()));
                u.setTitle(acc.Decryp(request.getParameter("title"), acc.getKey()));
                u.setFname(acc.Decryp(request.getParameter("fname"), acc.getKey()));
                u.setLname(acc.Decryp(request.getParameter("lname"), acc.getKey()));
                u.setEmail(acc.Decryp(request.getParameter("email"), acc.getKey()));
                u.setPosname(acc.Decryp(request.getParameter("posname"), acc.getKey()));
                if (acc.Decryp(request.getParameter("empstatus"), acc.getKey()).isEmpty()) {
                    u.setEmpstatus(Integer.parseInt(acc.Decryp(request.getParameter("empstatus"), acc.getKey()))); 
                } else {
                    u.setEmpstatus(0);
                }
                u.setClass_data(acc.Decryp(request.getParameter("class_data"), acc.getKey()));
                u.setSkillid(acc.Decryp(request.getParameter("skillid"), acc.getKey()));
                if (acc.Decryp(request.getParameter("emptype"), acc.getKey()).isEmpty()) {
                    u.setEmptype(Integer.parseInt(acc.Decryp(request.getParameter("emptype"), acc.getKey())));
                } else {
                    u.setEmptype(0);
                }
                u.setOfficeid(acc.Decryp(request.getParameter("officeid"), acc.getKey()));
                u.setOfficename(acc.Decryp(request.getParameter("officename"), acc.getKey()));
                u.setPin(acc.Decryp(request.getParameter("pin"), acc.getKey()));
                u.setPosition_m(acc.Decryp(request.getParameter("position_m"), acc.getKey()));
                u.setClass_new(acc.Decryp(request.getParameter("class_new"), acc.getKey()));
                u.setLevel(acc.Decryp(request.getParameter("level"), acc.getKey()));
                u.setPosact(acc.Decryp(request.getParameter("posact"), acc.getKey()));
                u.setGroupname(acc.Decryp(request.getParameter("groupname"), acc.getKey()));
                u.setIsadmin(acc.Decryp(request.getParameter("isadmin"), acc.getKey()));
                if (!u.CheckUsage(u)) {
                    u.UpdateUser(u);
                } else {
                    u.InsertUser(u);
                }

                //ตรวจสอบสิทธิ์ระบบ E-Budget
                String query = "SELECT * FROM e_budget.user_permission where id = '" + u.getId() + "' AND officeid='" + u.getOfficeid() + "'";
                DB2Manager dbms = new DB2Manager();
                ResultSet rs = dbms.GetDataAsResultSet(query);
                UserPermission up = new UserPermission();

                if (rs.next()) {

                    if (acc.IsNullToEmtyString(rs.getString("permission_status")).equals("Y")) { //มีสิทธิ์ในระบบ
                        up.setId(u.getId());
                        up.setOfficeid(u.getOfficeid());
                        up.setSuper_admin(acc.IsNullToEmtyString(rs.getString("super_admin")));
                        up.setAdmin(acc.IsNullToEmtyString(rs.getString("admin")));
                        up.setFinance(acc.IsNullToEmtyString(rs.getString("finance")));
                        up.setParcel(acc.IsNullToEmtyString(rs.getString("parcel")));
                        up.setProject_manager(acc.IsNullToEmtyString(rs.getString("project_manager")));
                        up.setBoss(acc.IsNullToEmtyString(rs.getString("boss")));
                        up.setPermission_status(acc.IsNullToEmtyString(rs.getString("permission_status")));
                        out.print("<script>authen('" + u.getId() + "','" + u.getOfficeid() + "')</script>");
                        
                    } else {//ไม่มีสิทธิ์ในระบบ ร้องขอสิทธิ์
                        up.setId(u.getId());
                        up.setOfficeid(u.getOfficeid());
                        up.setSuper_admin(acc.IsNullToEmtyString(rs.getString("super_admin")));
                        up.setAdmin(acc.IsNullToEmtyString(rs.getString("admin")));
                        up.setFinance(acc.IsNullToEmtyString(rs.getString("finance")));
                        up.setParcel(acc.IsNullToEmtyString(rs.getString("parcel")));
                        up.setProject_manager(acc.IsNullToEmtyString(rs.getString("project_manager")));
                        up.setBoss(acc.IsNullToEmtyString(rs.getString("boss")));
                        up.setPermission_status(acc.IsNullToEmtyString(rs.getString("permission_status")));
                    }
                }else{
                        up.setId(u.getId());
                        up.setOfficeid(u.getOfficeid());
                        up.setSuper_admin("");
                        up.setAdmin("");
                        up.setFinance("");
                        up.setParcel("");
                        up.setProject_manager("");
                        up.setBoss("");
                        up.setPermission_status("");
                }
    %>
    <div class="col-xs-12">
        <div class="alert alert-block alert-success" style="text-align: center;">
            <button type="button" class="close" data-dismiss="alert">
                <i class="ace-icon fa fa-times"></i>
            </button>
            <i class="ace-icon fa fa-check-circle danger"></i> ท่านไม่สามารถเข้าใช้งานระบบบริหารและติดตามการเบิกจ่ายเงินงบประมาณ : e-Budget & Tracking ได้ <% if (up.getPermission_status().isEmpty()) {
                    out.print("ต้องการร้องขอสิทธิ์ในการใช้งานหรือไม่");
                } else {
                    out.print("เนื่องจากรอการอนุมัติ");
                }%>
        </div>
    </div>
    <div class="col-xs-12">
        <div class="profile-user-info profile-user-info-striped">
            <div class="profile-info-row">
                <div class="profile-info-name"> ลสก. </div>
                <div class="profile-info-value" style="text-align: center;">
                    <span class="editable" id="id_tf"><%=u.getId()%></span>
                </div>
                <div class="profile-info-name"> ชื่อ - สกุล </div>
                <div class="profile-info-value" style="text-align: center;">
                    <span class="editable" id="fullname_tf"><%=u.getTitle() + u.getFname() + " " + u.getLname()%></span>
                </div>
                <div class="profile-info-name"> อีเมล์ </div>
                <div class="profile-info-value center" style="text-align: center;">
                    <span class="editable" id="email_tf"><%=u.getEmail()%></span>
                </div>
            </div>
        </div>
        <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
            <div class="profile-info-row">
                <div class="profile-info-name"> ตำแหน่ง </div>
                <div class="profile-info-value center" style="text-align: center;">
                    <span class="editable" id="position_m_tf"><%=u.getPosition_m()%></span>
                </div>
                <div class="profile-info-name"> กลุ่มงาน </div>
                <div class="profile-info-value center" style="text-align: center;">
                    <span class="editable" id="groupname_tf"><%=u.getGroupname()%></span>
                </div>
                <div class="profile-info-name"> รหัสหน่วยงาน </div>
                <div class="profile-info-value center" style="text-align: center;">
                    <span class="editable" id="officeid_tf"><%=u.getOfficeid()%></span>
                </div>
                <div class="profile-info-name"> หน่วยงาน </div>
                <div class="profile-info-value center" style="text-align: center;">
                    <span class="editable" id="officename_tf"><%=u.getOfficename()%></span>
                </div>
            </div>
        </div>


        <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
            <div class="profile-info-row">
                <div class="profile-info-name"> สิทธิ์การใช้งาน </div>
                <div class="profile-info-value">
                    <div class="control-group">
                        <%
                            String tag = "";
                            if (!u.getId().equals("352451") && !u.getId().equals("150378")) {
                                tag = "disabled=''";
                            }
                        %>
                        <div class="checkbox">
                            <label>
                                <input <%=tag%> id="supper_admin_ch" type="checkbox" class="ace" <% if (acc.IsNullToEmtyString(up.getSuper_admin()).equals("Y")) {
                                        out.print("checked");
                                    }%>>
                                <span class="lbl"> Supper Admin </span>
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input <%=tag%>  id="admin_ch" name="admin_ch" type="checkbox" class="ace" <% if (acc.IsNullToEmtyString(up.getAdmin()).equals("Y")) {
                                        out.print("checked");
                                    }%>>
                                <span class="lbl"> ผู้ดูแลระบบ </span>
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input id="boss_ch"  name="boss_ch" type="checkbox" class="ace" <% if (acc.IsNullToEmtyString(up.getBoss()).equals("Y")) {
                                        out.print("checked");
                                    }%>>
                                <span class="lbl"> ผู้บริหาร </span>
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input id="finance_ch" name="finance_ch" type="checkbox" class="ace" <% if (acc.IsNullToEmtyString(up.getFinance()).equals("Y")) {
                                        out.print("checked");
                                    }%>>
                                <span class="lbl"> เจ้าหน้าที่การเงิน </span>
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input id="parcel_ch" name="parcel_ch" type="checkbox" class="ace" <% if (acc.IsNullToEmtyString(up.getParcel()).equals("Y")) {
                                        out.print("checked");
                                    }%>>
                                <span class="lbl"> เจ้าหน้าที่พัสดุ </span>
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input id="project_manager_ch" name="project_ch" type="checkbox" class="ace" <% if (acc.IsNullToEmtyString(up.getProject_manager()).equals("Y")) {
                                        out.print("checked");
                                    } %>>
                                <span class="lbl"> ผู้รับผิดชอบโครงการ </span>
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
            <button <% if (up.getPermission_status() != null && acc.IsNullToEmtyString(up.getPermission_status()).equals("N") && !acc.IsNullToEmtyString(up.getPermission_status()).isEmpty()) {
                    out.print("disabled");
                } %> type="button" class="btn btn-sm btn-success btn-round" onclick="RequestRegister()">
                <i class="ace-icon fa fa-envelope bigger-150 middle"></i>
                <span class="bigger-110">ขอสิทธิ์ในการใช้งาน</span>
            </button>
            <button type="button" class="btn btn-sm btn-danger btn-round" onclick="Goto('News')">
                <i class="ace-icon fa fa-times-circle bigger-150 middle"></i>
                <span class="bigger-110"> ยกเลิก </span>
            </button>
        </div>
    </div>
    <%

            } else { //authen ไม่ผ่าน
                out.println("<div class='col-xs-12'>");
                out.println("<div class='alert alert-block alert-danger center'>");
                out.println("<button type='button' class='close' data-dismiss='alert'>");
                out.println("<i class='ace-icon fa fa-times'></i>");
                out.println("</button>");
                out.println("<i class='ace-icon fa fa-times danger'></i> ไม่สามารถเข้าสู่ระบบได้ กรุณาเข้าสู่ระบบอีกครั้ง");
                out.println("</div>");
                out.println("</div>");
            }
        } else {
            if (request.getParameter("command") != null && request.getParameter("command").equals("Login")) {
                session.setAttribute("E-Budget", true);
                session.setAttribute("E-Budget-OFFICEID", "00004000");
                session.setAttribute("E-Budget-OFFICENAME", "กองเทคโนโลยีสารสนเทศ");
                session.setAttribute("E-Budget-DISPLAYNAME", "นายณรงค์เดช");
                session.setAttribute("E-Budget-UID", "352451");
                session.setAttribute("E-Budget-POSITIONM", "นักวิชาการคอมพิวเตอร์");
                session.setAttribute("E-Budget-GROUPNAME", "สนับสนุน");
                session.setAttribute("E-Budget-PIN", "1319900132802");
                out.print("<script>location.href='index.jsp?service=News';</script>");
            }
        }
    %>

</div>
<script>
    function RequestRegister() {
        var id = $("#id_tf").html();
        var super_admin = $('#supper_admin_ch').is(':checked') ? 'Y' : 'N';
        var admin = $('#admin_ch').is(':checked') ? 'Y' : 'N';
        var boss = $('#boss_ch').is(':checked') ? 'Y' : 'N';
        var finance = $('#finance_ch').is(':checked') ? 'Y' : 'N';
        var parcel = $('#parcel_ch').is(':checked') ? 'Y' : 'N';
        var project_manager = $('#project_manager_ch').is(':checked') ? 'Y' : 'N';
        var officeid = $("#officeid_tf").html();
        var user_permission = {
            id: id,
            super_admin: super_admin,
            admin: admin,
            boss: boss,
            finance: finance,
            parcel: parcel,
            project_manager: project_manager,
            officeid: officeid,
            permission_status: "N",
            METHOD: "INSERT"
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
                                    location.reload();
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

