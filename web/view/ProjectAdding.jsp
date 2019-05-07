<%@page import="java.util.ArrayList"%>
<%@page import="rd.ebudget.object.Budget.Project"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Accessories acc = new Accessories();
    DB2Manager mm = new DB2Manager();
    Project p = null;
    String mode = "";
    ArrayList<String> pgps_arr = new ArrayList<String>();
    ArrayList<String> mss_arr = new ArrayList<String>();
    ArrayList<String> rss_arr = new ArrayList<String>();
    ArrayList<String> rgs_arr = new ArrayList<String>();
    ArrayList<String> rts_arr = new ArrayList<String>();

    if (acc.IsNull(request.getParameter("project_id"))) {
        mode = "เพิ่ม";

    } else {
        mode = "แก้ไข";
        String query = "SELECT * FROM e_budget.project p WHERE p.project_id='" + request.getParameter("project_id") + "'";
        DB2Manager dbms = new DB2Manager();
        ResultSet rs = dbms.GetDataAsResultSet(query);
        if (rs.next()) {
            p = new Project();
            p.setOfficeid(rs.getString("officeid"));
            p.setProject_name(rs.getString("project_name"));
            p.setProject_start_date(acc.ChageDateFormat(rs.getString("project_start_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
            p.setProject_end_date(acc.ChageDateFormat(rs.getString("project_end_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
            p.setProject_type_id(rs.getInt("project_type_id"));

            query = "select * from e_budget.project_government_policy WHERE project_id='" + request.getParameter("project_id") + "'";
            rs = dbms.GetDataAsResultSet(query);
            while (rs.next()) {
                pgps_arr.add(rs.getString("government_policy_id"));
            }
            query = "select * from e_budget.project_mof_strategic WHERE project_id='" + request.getParameter("project_id") + "'";
            rs = dbms.GetDataAsResultSet(query);
            while (rs.next()) {
                mss_arr.add(rs.getString("mof_strategic_id"));
            }
            query = "select * from e_budget.project_rd_strategic WHERE project_id='" + request.getParameter("project_id") + "'";
            rs = dbms.GetDataAsResultSet(query);
            while (rs.next()) {
                rss_arr.add(rs.getString("rd_strategic_id"));
            }

            query = "select * from e_budget.project_rd_goal WHERE project_id='" + request.getParameter("project_id") + "'";
            rs = dbms.GetDataAsResultSet(query);
            while (rs.next()) {
                rgs_arr.add(rs.getString("rd_goal_id"));
            }
            query = "select * from e_budget.project_rd_tactics WHERE project_id='" + request.getParameter("project_id") + "'";
            rs = dbms.GetDataAsResultSet(query);
            while (rs.next()) {
                rts_arr.add(rs.getString("rd_tactics_id"));
            }

        }
        rs.close();
        dbms.closeConnection();
    }
%>

<div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>
        <ul class="breadcrumb">
            <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.jsp"> หน้าหลัก </a></li>
            <li><a href="index.jsp?service=ProjectManager"> ข้อมูลโครงการ </a></li>
            <li> <%=mode%>โครงการ</li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>
    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div>
                    <div class="page-header">
                        <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=mode%>ข้อมูลโครงการ</small></h1>
                    </div>
                    <div id="user-profile-1" class="user-profile row">
                        <div class="col-xs-12 col-sm-3 center">
                            <div>
                                <span class="profile-picture">
                                    <img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="assets/images/avatars/project-plan-icon-128.png" style="width:256px;height:256px;"/></a>
                                </span>
                                <div class="space-4"></div>
                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                    <div class="inline position-relative">
                                        <b href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                                            <span class="white"><%=mode%>ข้อมูลโครงการ</span>
                                        </b>
                                    </div>
                                </div>
                            </div>
                            <div class="space-6"></div>
                            <div class="hr hr16 dotted"></div>
                        </div>
                        <div class="col-xs-12 col-sm-9" id="infomation">
                            <div class="page-header">
                                <h1><small style=""><i class="ace-icon fa fa-angle-double-right"></i> รายละเอียดโครงการ </small></h1>
                            </div>
                            <div class="profile-user-info profile-user-info-striped">
                                <div class="profile-info-row">
                                    <div class="profile-info-name"> ชื่อโครงการ </div>

                                    <div class="profile-info-value">
                                        <span id="fullname_tf">
                                            <div class="input-group col-sm-12">
                                                <input class="form-control active" type="text" id="project_name_tf" value="<%= (p != null ? p.getProject_name() : "")%>">
                                            </div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---------------------------------------------------------------------------------------------------->
                        <div class="col-xs-12 col-sm-9" >
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ความสอดคล้อง </small></h1>
                            </div>
                            <div class="profile-user-info profile-user-info-striped">
                                <div class="profile-info-row">
                                    <div class="profile-info-name" style="width:200px;"> นโยบายรัฐบาล </div>

                                    <div class="profile-info-value">
                                        <span id="fullname_tf">
                                            <div class="input-group col-sm-12">
                                                <select class="chosen-select form-control" id="government_policy_id_tf" multiple="multiple" data-placeholder="เลือกนโยบายรัฐบาล">
                                                    <option value=""></option>
                                                    <%
                                                        String query = "SELECT * FROM e_budget.government_policy WHERE government_policy_status='Y'";
                                                        ResultSet rs = mm.GetDataAsResultSet(query);
                                                        while (rs.next()) {
                                                            if (acc.IsEqualsInList(rs.getString("government_policy_id"), pgps_arr.toArray(new String[pgps_arr.size()]))) {
                                                                out.println("<option value='" + rs.getString("government_policy_id") + "' selected>" + rs.getString("government_policy_name") + "</option>");
                                                            } else {
                                                                out.println("<option value='" + rs.getString("government_policy_id") + "'>" + rs.getString("government_policy_name") + "</option>");
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-user-info profile-user-info-striped">
                                <div class="profile-info-row">
                                    <div class="profile-info-name" style="width:200px;"> ยุทธศาสตร์กระทรวงการคลัง </div>

                                    <div class="profile-info-value">
                                        <span id="fullname_tf">
                                            <div class="input-group col-sm-12">
                                                <select class="chosen-select form-control" id="mof_strategic_id_tf" multiple="multiple" data-placeholder="เลือกยุทธศาสตร์กระทรวงการคลัง">
                                                    <option value=""></option>
                                                    <%
                                                        query = "SELECT * FROM e_budget.mof_strategic WHERE mof_strategic_status='Y'";
                                                        rs = mm.GetDataAsResultSet(query);
                                                        while (rs.next()) {
                                                            if (acc.IsEqualsInList(rs.getString("mof_strategic_id"), mss_arr.toArray(new String[mss_arr.size()]))) {
                                                                out.println("<option value='" + rs.getString("mof_strategic_id") + "' selected>" + rs.getString("mof_strategic_name") + "</option>");
                                                            } else {
                                                                out.println("<option value='" + rs.getString("mof_strategic_id") + "'>" + rs.getString("mof_strategic_name") + "</option>");
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-user-info profile-user-info-striped">
                                <div class="profile-info-row">
                                    <div class="profile-info-name" style="width:200px;"> ยุทธศาสตร์กรมสรรพากร </div>

                                    <div class="profile-info-value">
                                        <span id="fullname_tf">
                                            <div class="input-group col-sm-12">
                                                <select class="chosen-select form-control" id="rd_strategic_id_tf" multiple="multiple" data-placeholder="เลือกยุทธศาสตร์กรมสรรพากร" onchange="GetRDGoal(this)">
                                                    <option value=""></option>
                                                    <%
                                                        query = "SELECT * FROM e_budget.rd_strategic WHERE rd_strategic_status='Y'";
                                                        rs = mm.GetDataAsResultSet(query);
                                                        while (rs.next()) {
                                                            if (acc.IsEqualsInList(rs.getString("rd_strategic_id"), rss_arr.toArray(new String[rss_arr.size()]))) {
                                                                out.println("<option value='" + rs.getString("rd_strategic_id") + "' selected>" + rs.getString("rd_strategic_name") + "</option>");
                                                            } else {
                                                                out.println("<option value='" + rs.getString("rd_strategic_id") + "'>" + rs.getString("rd_strategic_name") + "</option>");
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-user-info profile-user-info-striped">
                                <div class="profile-info-row">
                                    <div class="profile-info-name" style="width:200px;"> เป้าประสงค์ </div>

                                    <div class="profile-info-value">
                                        <span id="fullname_tf">
                                            <div class="input-group col-sm-12">
                                                <select class="chosen-select form-control" id="rd_goal_id_tf" multiple="multiple" data-placeholder="เลือกเป้าประสงค์" onchange="GetRDTactics(this)">
                                                    <%
                                                        if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                                                            query = "SELECT * FROM e_budget.rd_goal WHERE rd_strategic_id IN(SELECT DISTINCT rd_strategic_id FROM e_budget.project_rd_strategic WHERE project_id = '" + request.getParameter("project_id") + "')";
                                                            rs = mm.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if (acc.IsEqualsInList(rs.getString("rd_goal_id"), rgs_arr.toArray(new String[rgs_arr.size()]))) {
                                                                    out.println("<option value='" + rs.getString("rd_goal_id") + "' selected>" + rs.getString("rd_goal_name") + "</option>");
                                                                } else {
                                                                    out.println("<option value='" + rs.getString("rd_goal_id") + "'>" + rs.getString("rd_goal_name") + "</option>");
                                                                }
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-user-info profile-user-info-striped">
                                <div class="profile-info-row">
                                    <div class="profile-info-name" style="width:200px;"> กลยุทธ์ </div>

                                    <div class="profile-info-value">
                                        <span id="fullname_tf">
                                            <div class="input-group col-sm-12">
                                                <select class="chosen-select form-control" id="rd_tactics_id_tf" multiple="multiple" data-placeholder="เลือกกลยุทธ์">
                                                    <%
                                                        if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                                                            query = "select * from e_budget.rd_tactics where rd_goal_id in(select DISTINCT rd_goal_id T from e_budget.project_rd_goal WHERE project_id  = '" + request.getParameter("project_id") + "')";
                                                            rs = mm.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if (acc.IsEqualsInList(rs.getString("rd_tactics_id"), rts_arr.toArray(new String[rts_arr.size()]))) {
                                                                    out.println("<option value='" + rs.getString("rd_tactics_id") + "' selected>" + rs.getString("rd_tactics_name") + "</option>");
                                                                } else {
                                                                    out.println("<option value='" + rs.getString("rd_tactics_id") + "'>" + rs.getString("rd_tactics_name") + "</option>");
                                                                }
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ผู้ติดต่อประสานงาน </small></h1>
                            </div>
                            

                                <!---------------------------------------------------------------------------------------------------->
                                <%
                                    if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                                %>
                                <div id="project_owner">
                                <%
                                        query = "select * from e_budget.project_owner WHERE project_id = '" + request.getParameter("project_id") + "'";
                                        rs = mm.GetDataAsResultSet(query);
                                        int i = 0;
                                        while (rs.next()) {
                                %>
                                <div id="owner_project_info">
                                    <div class="space-10"></div>
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:100px;"> เลข ลสก. </div>
                                            <div class="profile-info-value" style="width:200px;">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="uid_tf[]" value="<%= rs.getString("id")%>">
                                                    </div>
                                                </span>
                                            </div>
                                            <div class="profile-info-value" style="width:80px;vertical-align:middle;">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <button class="btn btn-white btn-warning btn-sm" style="height:30px;" onclick="GetPersonInfo(this)">
                                                            <i class="ace-icon fa fa-search bigger-120 orange"></i> ค้นหา
                                                        </button>
                                                    </div> 

                                                </span>
                                            </div>
                                            <div class="profile-info-name" style="width:100px;"> ชื่อ-สกุล </div>
                                            <div class="profile-info-value">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="fullname_tf[]" disabled="disabled" value="<%= rs.getString("fullname")%>">
                                                    </div>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:100px;"> ตำแหน่ง </div>
                                            <div class="profile-info-value" style="width:300px;">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="position_m_tf[]" disabled="disabled" value="<%= rs.getString("position_m")%>">
                                                    </div>
                                                </span>
                                            </div>

                                            <div class="profile-info-name" style="width:100px;"> E-Mail </div>
                                            <div class="profile-info-value" style="width:300px;">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="email_tf[]" disabled="disabled" value="<%= rs.getString("email")%>">
                                                    </div>
                                                </span>

                                            </div>
                                            <%
                                                if (i > 0) {
                                                    out.print("<div class='profile-info-value' style='width:60px;vertical-align:middle;'>"
                                                            + "<span><div class='input-group col-sm-12'>"
                                                            + "<button class='btn btn-white btn-danger btn-sm' style='height:30px;' onclick='DeleteOwnerProject(this)'>"
                                                            + "<i class='ace-icon fa fa-trash bigger-120 red'></i> ลบ </button>"
                                                            + "</div></span></div>");
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        i++;
                                    }
                                %>

                            </div>
                            <div class="profile-user-info profile-user-info-striped" style="border:none;">
                                <div style="margin-top:5px;">
                                    <button class="btn btn-white btn-warning btn-bold btn-sm" onclick="AddingOwnerProject()">
                                        <i class="ace-icon fa fa-plus"></i> เพิ่มรายการ 
                                    </button>
                                </div>
                            </div>
                            <%
                            } else {
                            %>
                            <div id="project_owner">
                                <div id="owner_project_info">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:100px;"> เลข ลสก. </div>
                                            <div class="profile-info-value" style="width:200px;">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="uid_tf[]">
                                                    </div>
                                                </span>
                                            </div>
                                            <div class="profile-info-value" style="width:80px;vertical-align:middle;">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <button class="btn btn-white btn-warning btn-sm" style="height:30px;" onclick="GetPersonInfo(this)">
                                                            <i class="ace-icon fa fa-search bigger-120 orange"></i> ค้นหา
                                                        </button>
                                                    </div> 

                                                </span>
                                            </div>
                                            <div class="profile-info-name" style="width:100px;"> ชื่อ-สกุล </div>
                                            <div class="profile-info-value">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="fullname_tf[]" disabled="disabled">
                                                    </div>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:100px;"> ตำแหน่ง </div>
                                            <div class="profile-info-value" style="width:300px;">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="position_m_tf[]" disabled="disabled">
                                                    </div>
                                                </span>
                                            </div>

                                            <div class="profile-info-name" style="width:100px;"> E-Mail </div>
                                            <div class="profile-info-value" style="width:300px;">
                                                <span id="fullname_tf">
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" name="email_tf[]" disabled="disabled">
                                                    </div>
                                                </span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-user-info profile-user-info-striped" style="border:none;">
                                <div style="margin-top:5px;">
                                    <button class="btn btn-white btn-warning btn-bold btn-sm" onclick="AddingOwnerProject()">
                                        <i class="ace-icon fa fa-plus"></i> เพิ่มรายการ 
                                    </button>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <!---------------------------------------------------------------------------------------------------->
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> วัตถุประสงค์ </small></h1>
                            </div>
                            <div id="project_objective">
                                <%
                                    if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                                        query = "select * from e_budget.project_objective WHERE project_id = '" + request.getParameter("project_id") + "'";
                                        rs = mm.GetDataAsResultSet(query);
                                        int i = 0;
                                        while (rs.next()) {
                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:100px;"> วัตถุประสงค์</div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control activee" type="text" name="project_objective_tf[]" value="<%=rs.getString("project_objective_name")%>">
                                                    <%
                                                        if (i > 0) {
                                                            out.print("<span class='input-group-btn'><button class='btn btn-sm btn-danger' type='button' onclick='DeleteProjectObjective(this)'></button></span>");
                                                        }
                                                    %>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        i++;
                                    }
                                } else {
                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:100px;"> วัตถุประสงค์</div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control activee" type="text" name="project_objective_tf[]">
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <%
                                    }
                                %>
                            </div>
                            <div class="profile-user-info profile-user-info-striped" style="border:none;">
                                <div style="margin-top:5px;">
                                    <button class="btn btn-white btn-warning btn-bold btn-sm" onclick="AddingProjectObjective()">
                                        <i class="ace-icon fa fa-plus"></i> เพิ่มรายการ 
                                    </button>
                                </div>
                            </div>
                            <!---------------------------------------------------------------------------------------------------->
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ผลผลิตของโครงการ (Output) </small></h1>
                            </div>
                            <div id="project_output">
                                <%
                                    if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                                        query = "select * from e_budget.project_output WHERE project_id = '" + request.getParameter("project_id") + "'";
                                        rs = mm.GetDataAsResultSet(query);
                                        int i = 0;
                                        while (rs.next()) {
                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ผลผลิตของโครงการ (Output) </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active" type="text" name="project_output_tf[]" value="<%=rs.getString("project_output_name")%>">
                                                    <%
                                                        if (i > 0) {
                                                            out.print("<span class='input-group-btn'>"
                                                                    + "<button class='btn btn-sm btn-danger' type='button' onclick='DeleteProjectOutput(this)'>"
                                                                    + "<i class='ace-icon fa fa-trash bigger-110'></i> ลบ "
                                                                    + "</button></span>");
                                                        }
                                                    %>

                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <%                                        i++;
                                    }
                                } else {

                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ผลผลิตของโครงการ (Output) </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active" type="text" name="project_output_tf[]">
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <%                                    }
                                %>
                            </div>
                            <div class="profile-user-info profile-user-info-striped" style="border:none;">
                                <div style="margin-top:5px;">
                                    <button class="btn btn-white btn-warning btn-bold btn-sm" onclick="AddingProjectOutput()">
                                        <i class="ace-icon fa fa-plus"></i> เพิ่มรายการ 
                                    </button>
                                </div>
                            </div>
                            <!---------------------------------------------------------------------------------------------------->
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ผลลัพธ์ของโครงการ (Outcome) </small></h1>
                            </div>
                            <div id="project_outcome">
                                <%
                                    if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                                        query = "select * from e_budget.project_outcome WHERE project_id = '" + request.getParameter("project_id") + "'";
                                        rs = mm.GetDataAsResultSet(query);
                                        int i = 0;
                                        while (rs.next()) {
                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ผลลัพธ์ของโครงการ (Outcome) </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active" type="text" name="project_outcome_tf[]" value="<%= rs.getString("project_outcome_name")%>">
                                                    <%
                                                        if (i > 0) {
                                                            out.print("<span class='input-group-btn'>"
                                                                    + "<button class='btn btn-sm btn-danger' type='button' onclick='DeleteProjectOutCome(this)'>"
                                                                    + "<i class='ace-icon fa fa-trash bigger-110'></i> ลบ "
                                                                    + "</button></span>");
                                                        }
                                                    %>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        i++;
                                    }
                                } else {
                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ผลลัพธ์ของโครงการ (Outcome) </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active" type="text" name="project_outcome_tf[]">
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>

                            </div>
                            <div class="profile-user-info profile-user-info-striped" style="border:none;">
                                <div style="margin-top:5px;">
                                    <button class="btn btn-white btn-warning btn-bold btn-sm" onclick="AddingProjectOutcome()">
                                        <i class="ace-icon fa fa-plus"></i> เพิ่มรายการ 
                                    </button>
                                </div>
                            </div>
                            <!---------------------------------------------------------------------------------------------------->
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ระยะเวลาดำเนินโครงการ </small></h1>
                            </div>
                            <div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> วันที่เริ่มต้น </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active date-picker center" id="project_start_date_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=(p != null ? p.getProject_start_date() : "")%>">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar bigger-110"></i>
                                                    </span>
                                                </div>
                                            </span>
                                        </div>
                                        <div class="profile-info-name" style="width:200px;"> วันที่สิ้นสุด </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active date-picker center" id="project_end_date_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=(p != null ? p.getProject_end_date() : "")%>">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar bigger-110"></i>
                                                    </span>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!---------------------------------------------------------------------------------------------------->
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ลักษณะโครงการ </small></h1>
                            </div>
                            <div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ลักษณะโครงการ </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <div class="control-group">
                                                        <div class="radio">
                                                            <label>
                                                                <input name="project_type_tf" type="radio" class="ace" value="1" <%=(p != null && p.getProject_type_id() == 1 ? "checked" : "")%>>
                                                                <span class="lbl"> โครงการต่อเนื่อง</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </span>
                                        </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <div class="control-group">
                                                        <div class="radio">
                                                            <label>
                                                                <input name="project_type_tf" type="radio" class="ace" value="2" <%=(p != null && p.getProject_type_id() == 2 ? "checked" : "")%>>
                                                                <span class="lbl"> โครงการใหม่ </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!---------------------------------------------------------------------------------------------------->
                            <div class="page-header">
                                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ประโยชน์ที่คาดว่าจะได้รับ </small></h1>
                            </div>
                            <div id="project_benefit">
                                <%
                                    if (!acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
                                        query = "select * from e_budget.project_benefit WHERE project_id = '" + request.getParameter("project_id") + "'";
                                        rs = mm.GetDataAsResultSet(query);
                                        int i = 0;
                                        while (rs.next()) {
                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ประโยชน์ที่คาดว่าจะได้รับ </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active" type="text" name="project_benefit_tf[]" value="<%= rs.getString("project_benefit_name") %>">
                                                    <%
                                                        if(i>0){
                                                            out.print("<span class='input-group-btn'>"
                                                                    + "<button class='btn btn-sm btn-danger' type='button' onclick='DeleteProjectBenefit(this)'>"
                                                                    + "<i class='ace-icon fa fa-trash bigger-110'></i> ลบ "
                                                                    + "</button>"
                                                                    + "</span>");
                                                        }
                                                    %>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <%                                        i++;
                                    }
                                } else {
                                %>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ประโยชน์ที่คาดว่าจะได้รับ </div>
                                        <div class="profile-info-value">
                                            <span id="fullname_tf">
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active" type="text" name="project_benefit_tf[]">
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="profile-user-info profile-user-info-striped" style="border:none;">
                                <div style="margin-top:5px;">
                                    <button class="btn btn-white btn-warning btn-bold btn-sm" onclick="AddingProjectBenefit()">
                                        <i class="ace-icon fa fa-plus"></i> เพิ่มรายการ 
                                    </button>
                                </div>
                            </div>
                            <!---------------------------------------------------------------------------------------------------->
                            <div class="space-10"></div>
                            <div class="center">
                                <button class="btn btn-success btn-white" onclick="ProjectAdding()" id="userAdd_b"><i class="ace-icon fa fa-user"></i> บันทึก </button>
                                <button class="btn btn-danger btn-white" onclick="Goto('projectManager')" ><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-9" id="infomation3">
                            <!-- /section:pages/profile.info -->
                            <div class="space-10"></div>
                        </div>

                    </div>
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</div>
<link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="assets/css/chosen.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-colorpicker.min.css" />

<script>
    function ProjectAdding() {
        waitingDialog.show();
        var project_name = $('#project_name_tf').val();
        if (project_name.trim() == "") {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกชื่อโครงการ',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var government_policy = $('#government_policy_id_tf').val();
        if (government_policy == null) {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกนโยบายรัฐบาล',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var mof_strategic = $('#mof_strategic_id_tf').val();
        if (mof_strategic == null) {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกยุทธศาสตร์กระทรวงการคลัง',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var rd_strategic = $('#rd_strategic_id_tf').val();
        if (rd_strategic == null) {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกยุทธศาสตร์กรมสรรพากร',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var rd_goal = $('#rd_goal_id_tf').val();
        if (rd_goal == null) {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกเป้าประสงค์',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var rd_tactics = $('#rd_tactics_id_tf').val();
        if (rd_tactics == null) {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกกลยุทธ์',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var uid = $("input[name='uid_tf[]']").map(function () {
            return $(this).val();
        }).get();
        var fullname = $("input[name='fullname_tf[]']").map(function () {
            return $(this).val();
        }).get();
        var position_m = $("input[name='position_m_tf[]']").map(function () {
            return $(this).val();
        }).get();
        var telephone = $("input[name='telephone_tf[]']").map(function () {
            return $(this).val();
        }).get();
        var email = $("input[name='email_tf[]']").map(function () {
            return $(this).val();
        }).get();
        var project_owner = {
            uid: uid,
            fullname: fullname,
            position_m: position_m,
            telephone: telephone,
            email: email
        };
        if (uid.length <= 0 || uid[0] == "") {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกผู้ติดต่อประสานงาน',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        project_objective = $("input[name='project_objective_tf[]']").map(function () {
            return $(this).val();
        }).get();
        if (project_objective.length <= 0 || project_objective[0] == "") {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกวัตถุประสงค์',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        project_output = $("input[name='project_output_tf[]']").map(function () {
            return $(this).val();
        }).get();
        if (project_output.length <= 0 || project_output[0] == "") {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกผลผลิตของโครงการ (Output)',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        project_outcome = $("input[name='project_outcome_tf[]']").map(function () {
            return $(this).val();
        }).get();
        if (project_outcome.length <= 0 || project_outcome[0] == "") {
            
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกผลลัพธ์ของโครงการ (Outcome)',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var project_start_date = $('#project_start_date_tf').val();
        if (project_start_date == "") {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกวันที่เริ่มต้นโครงการ',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var project_end_date = $('#project_end_date_tf').val();
        if (project_end_date == "") {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกวันสิ้นสุดโครงการ',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var project_type = $("input[name='project_type_tf']:checked").val();
        if (project_type == null) {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกลักษณะโครงการ',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        project_benefit = $("input[name='project_benefit_tf[]']").map(function () {
            return $(this).val();
        }).get();
        if (project_benefit.length <= 0 || project_benefit[0] == "") {
            waitingDialog.hide();
            $.confirm({
                title: false, content: 'ท่านยังไม่ได้บันทึกประโยชน์ที่คาดว่าจะได้รับ',
                buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var office_code = "<% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICEID"))); %>";
        var project = {
            project_id: "<% out.print(acc.IsNullToEmtyString(request.getParameter("project_id")));%>",
            project_name: project_name,
            project_type_id: project_type,
            project_start_date: project_start_date,
            project_end_date: project_end_date,
            office_code: office_code,
            project_benefit: project_benefit,
            project_outcome: project_outcome,
            project_output: project_output,
            project_objective: project_objective,
            government_policy: government_policy,
            mof_strategic: mof_strategic,
            rd_strategic: rd_strategic,
            rd_goal: rd_goal,
            rd_tactics: rd_tactics,
            project_owner: project_owner
        };
        $.ajax({
            type: "POST",
            url: "ProjectServlet",
            data: {project: project},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('ProjectManager');
                                }}}
                    });
                }
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });
    }
    function GetPersonInfo(obj) {
        waitingDialog.show();
        var uid = $(obj).closest("div#owner_project_info").find("input[name='uid_tf[]']").val();
        $.post("GetPersonInfo",
                {uid: uid},
                function (data) {
                    var user = JSON.parse(data);
                    if (user["authen"]) {
                        $(obj).closest("div#owner_project_info").find("input[name='fullname_tf[]']").val(user['title'] + user['fname'] + " " + user['lname']);
                        $(obj).closest("div#owner_project_info").find("input[name='position_m_tf[]']").val(user['positionm']);
                        $(obj).closest("div#owner_project_info").find("input[name='email_tf[]']").val(user['email']);
                    } else {
                        $.confirm({
                            title: false, content: 'ไม่พบข้อมูลบุคคนี้ในระบบ Eoffice กรุนาตรวจสอบอีกครั้ง',
                            buttons: {confirm: {text: 'ตกลง', btnClass: 'btn-blue', keys: ['enter', 'shift'], action: function () {}}}
                        });
                    }
                }
        );
        waitingDialog.hide();
    }
    function GetRDTactics(obj) {
        var rd_goal_id = $(obj).val();
        $('#rd_tactics_id_tf').children('option').remove();
        $('#rd_tactics_id_tf').trigger('chosen:updated');
        $.post("GetRDTactics",
                {rd_goal_id: rd_goal_id},
                function (data) {
                    var rd_tactics = $.parseJSON(data);
                    for (i = 0; i < rd_tactics.length; i++) {
                        $('#rd_tactics_id_tf').append('<option value="' + rd_tactics[i]['rd_tactics_id'] + '">' + rd_tactics[i]['rd_tactics_name'] + '</option>');
                    }
                    $('#rd_tactics_id_tf').trigger('chosen:updated');
                }
        );
    }
    function GetRDGoal(obj) {
        var rd_strategic_id = $(obj).val();
        $('#rd_goal_id_tf').children('option').remove();
        $('#rd_goal_id_tf').trigger('chosen:updated');
        $('#rd_tactics_id_tf').children('option').remove();
        $('#rd_tactics_id_tf').trigger('chosen:updated');
        $.post("GetRdGoal",
                {rd_strategic_id: rd_strategic_id},
                function (data) {
                    var rd_goal = $.parseJSON(data);
                    for (i = 0; i < rd_goal.length; i++) {
                        $('#rd_goal_id_tf').append('<option value="' + rd_goal[i]['rd_goal_id'] + '">' + rd_goal[i]['rd_goal_name'] + '</option>');
                    }
                    $('#rd_goal_id_tf').trigger('chosen:updated');
                }
        );
    }
    function AddingOwnerProject() {
        var values = $("input[name='project_owner_id_tf[]']").map(function () {
            return $(this).val();
        }).get();
        var html = '<div id="owner_project_info"><div class="space-10"></div><div class="profile-user-info profile-user-info-striped"><div class="profile-info-row"><div class="profile-info-name" style="width:100px;"> เลข ลสก. </div><div class="profile-info-value" style="width:200px;"><span id="fullname_tf"><div class="input-group col-sm-12"><input class="form-control active" type="text" name="uid_tf[]"></div></span></div><div class="profile-info-value" style="width:80px;vertical-align:middle;"><span><div class="input-group col-sm-12"><button class="btn btn-white btn-warning btn-sm" style="height:30px;" onclick="GetPersonInfo(this)"><i class="ace-icon fa fa-search bigger-120 orange"></i> ค้นหา</button></div></span></div><div class="profile-info-name" style="width:100px;"> ชื่อ-สกุล </div><div class="profile-info-value"><span id="fullname_tf"><div class="input-group col-sm-12"><input class="form-control active" type="text" name="fullname_tf[]" disabled="disabled"></div></span></div></div></div><div class="profile-user-info profile-user-info-striped"><div class="profile-info-row"><div class="profile-info-name" style="width:100px;"> ตำแหน่ง </div><div class="profile-info-value" style="width:300px;"><span id="fullname_tf"><div class="input-group col-sm-12"><input class="form-control active" type="text" name="position_m_tf[]" disabled="disabled"></div></span></div><div class="profile-info-name" style="width:100px;"> E-Mail </div><div class="profile-info-value" style="width:300px;"><span id="fullname_tf"><div class="input-group col-sm-12"><input class="form-control active" type="text" name="email_tf[]" disabled="disabled"></div></span></div><div class="profile-info-value" style="width:60px;vertical-align:middle;"><span><div class="input-group col-sm-12"><button class="btn btn-white btn-danger btn-sm" style="height:30px;" onclick="DeleteOwnerProject(this)"><i class="ace-icon fa fa-trash bigger-120 red"></i> ลบ </button></div></span></div></div></div></div>';
        $('#project_owner').append(html);
    }
    function DeleteOwnerProject(obj) {
        $(obj).closest("#owner_project_info").remove();
    }
    function AddingProjectObjective() {
        var values = $("input[name='project_objective_tf[]']").map(function () {
            return $(this).val();
        }).get();
        var html = '<div class="profile-user-info profile-user-info-striped"><div class="profile-info-row"><div class="profile-info-name" style="width:100px;"> วัตถุประสงค์ </div><div class="profile-info-value"><span id="fullname_tf"><div class="input-group"><input class="form-control activee" type="text" name="project_objective_tf[]"><span class="input-group-btn"><button class="btn btn-sm btn-danger" type="button" onclick="DeleteProjectObjective(this)"><i class="ace-icon fa fa-trash bigger-110"></i> ลบ </button></span></div></span></div></div></div>';
        $('#project_objective').append(html);
    }
    function DeleteProjectObjective(obj) {
        $(obj).closest(".profile-user-info").remove();
    }
    function AddingProjectOutput() {
        var html = '<div class="profile-user-info profile-user-info-striped"><div class="profile-info-row"><div class="profile-info-name" style="width:200px;"> ผลผลิตของโครงการ (Output) </div><div class="profile-info-value"><span id="fullname_tf"><div class="input-group col-sm-12"><input class="form-control active" type="text" name="project_output_tf[]"><span class="input-group-btn"><button class="btn btn-sm btn-danger" type="button" onclick="DeleteProjectOutput(this)"><i class="ace-icon fa fa-trash bigger-110"></i> ลบ </button></span></div></span></div></span></div></div></div>';
        $('#project_output').append(html);
    }
    function DeleteProjectOutput(obj) {
        $(obj).closest(".profile-user-info").remove();
    }
    function AddingProjectOutcome() {
        var html = '<div class="profile-user-info profile-user-info-striped"><div class="profile-info-row"><div class="profile-info-name" style="width:200px;"> ผลลัพธ์ของโครงการ (Outcome) </div><div class="profile-info-value"><span id="fullname_tf"><div class="input-group col-sm-12"><input class="form-control active" type="text" name="project_outcome_tf[]"><span class="input-group-btn"><button class="btn btn-sm btn-danger" type="button" onclick="DeleteProjectOutCome(this)"><i class="ace-icon fa fa-trash bigger-110"></i> ลบ </button></span></div></span></div></div></div>';
        $('#project_outcome').append(html);
    }
    function DeleteProjectOutCome(obj) {
        $(obj).closest(".profile-user-info").remove();
    }
    function AddingProjectBenefit() {
        var html = '<div class="profile-user-info profile-user-info-striped"><div class="profile-info-row"><div class="profile-info-name" style="width:200px;"> ประโยชน์ที่คาดว่าจะได้รับ </div><div class="profile-info-value"><span id="fullname_tf"><div class="input-group col-sm-12"><input class="form-control active" type="text" name="project_benefit_tf[]"><span class="input-group-btn"><button class="btn btn-sm btn-danger" type="button" onclick="DeleteProjectBenefit(this)"><i class="ace-icon fa fa-trash bigger-110"></i> ลบ </button></span></div></span></div></div></div>';
        $('#project_benefit').append(html);
    }
    function DeleteProjectBenefit(obj) {
        $(obj).closest(".profile-user-info").remove();
    }
    $(document).ready(function () {
        if (!ace.vars['touch']) {
            $('.chosen-select').chosen({allow_single_deselect: true});
            //resize the chosen on window resize

            $(window)
                    .off('resize.chosen')
                    .on('resize.chosen', function () {
                        $('.chosen-select').each(function () {
                            var $this = $(this);
                            $this.next().css({'width': $this.parent().width()});
                        })
                    }).trigger('resize.chosen');
            //resize chosen on sidebar collapse/expand
            $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                if (event_name != 'sidebar_collapsed')
                    return;
                $('.chosen-select').each(function () {
                    var $this = $(this);
                    $this.next().css({'width': $this.parent().width()});
                })
            });
        }
        $.fn.datepicker.dates['th'] = {

            days: ["อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัส", "ศุกร์", "เสาร์", "อาทิตย์"],
            daysShort: ["อา", "จ", "อ", "พ", "พฤ", "ศ", "ส", "อา"],
            daysMin: ["อา", "จ", "อ", "พ", "พฤ", "ศ", "ส", "อา"],
            months: ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"],
            monthsShort: ["ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค."],
            today: "วันนี้"
        };
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true,
            language: 'th',
            thaiyear: true,
        })
                .next().on(ace.click_event, function () {
            $(this).prev().focus();
        });
    });
</script>
<script src="assets/js/jquery-ui.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/chosen.jquery.min.js"></script>
<script src="assets/js/spinbox.min.js"></script>
<script src="assets/js/bootstrap-datepicker.min.js"></script>
<script src="assets/js/bootstrap-timepicker.min.js"></script>
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/daterangepicker.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/js/bootstrap-colorpicker.min.js"></script>
<script src="assets/js/jquery.knob.min.js"></script>
<script src="assets/js/autosize.min.js"></script>
<script src="assets/js/jquery.inputlimiter.min.js"></script>
<script src="assets/js/jquery.maskedinput.min.js"></script>
<script src="assets/js/bootstrap-tag.min.js"></script>