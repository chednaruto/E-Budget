<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    String project_name = "";
    String project_activity_name = "";
    double project_activity_budget = 0;
    String query = "SELECT * FROM e_budget.project WHERE project_id = '" + request.getParameter("project_id") + "'";
    DB2Manager dbms = new DB2Manager();
    ResultSet rs = dbms.GetDataAsResultSet(query);
    if (rs.next()) {
        project_name = rs.getString("project_name");
    }
    if (!acc.IsNullToEmtyString(request.getParameter("project_activity_id")).isEmpty()) {
        query = "SELECT * FROM e_budget.project_activity WHERE project_id='" + request.getParameter("project_id") + "' AND project_activity_id=" + request.getParameter("project_activity_id");
        rs = dbms.GetDataAsResultSet(query);
        if (rs.next()) {
            project_activity_name = rs.getString("project_activity_name");
            project_activity_budget = rs.getDouble("project_activity_budget");
        }
        tag = "แก้ไข";
    } else {
        tag = "เพิ่ม";
    }
%>
<div class="main-content-inner">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">หน้าหลัก</a></li>
                    <li><a href="index.jsp?service=ProjectManager"> ข้อมูลโครงการ </a></li>
                    <li><a href="index.jsp?service=ProjectActivityList&project_id=<%=request.getParameter("project_id")%>"> ข้อมูลกิจกรรม </a></li>
                    <li> <%=tag%>กิจกรรม </li>
                </ul>
                <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> กิจกรรมตาม : <%=project_name%> </small></h1>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div>
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
                                                    <span class="white"> <%=tag%>กิจกรรม </span>
                                                </b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-6"></div>
                                    <div class="hr hr16 dotted"></div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="space-12"></div>
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:150px;"> ชื่อกิจกรรม <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <input class="form-control active" type="text" id="project_activity_name_tf" value="<%=project_activity_name%>">                                         
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:150px;"> ยอดงบประมาณ <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <div class="input-group col-sm-6">
                                                        <input class="form-control active" type="text" id="project_activity_budget_tf" value="<%=project_activity_budget%>">
                                                    </div>                                                
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-10"></div>
                                <div class="col-xs-9 col-sm-9" id="infomation3">
                                    <div class="space-10"></div>
                                    <div class="space-10"></div>

                                    <div class="center">
                                        <button class="btn btn-success btn-white" onclick="Add()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                        <button class="btn btn-danger btn-white" onclick="Goto('ProjectActivityList&project_id=<%=request.getParameter("project_id")%>')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="space-10"></div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div>
        </div>
    </div>
    <%
        rs.close();
        dbms.closeConnection();
    %>
</div>
<script>
    function Add() {
        waitingDialog.show();
        var project_id = '<%=request.getParameter("project_id")%> ';
        var project_activity_id = '<%=acc.IsNullToEmtyString(request.getParameter("project_activity_id"))%>';
        var project_activity_name = $('#project_activity_name_tf').val();
        if (project_activity_name.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var project_activity_budget = $('#project_activity_budget_tf').val();
        if (project_activity_budget.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }



        var project_activity = {
            project_id: project_id,
            project_activity_id: project_activity_id,
            project_activity_name: project_activity_name,
            project_activity_budget: project_activity_budget,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "ProjectActivityServlet",
            data: {project_activity: project_activity},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('ProjectActivityList&project_id=' + project_id);
                                }}}
                    });
                }
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });

    }

</script>