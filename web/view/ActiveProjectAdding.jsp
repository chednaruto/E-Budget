<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    String officeid = "";
    String project_id = "";
    int purchase_sub_type_id = 0;
    if (acc.IsNullToEmtyString(request.getParameter("project_id")).isEmpty()) {
        tag = "เพิ่ม";
    } else {
        String query = "SELECT * FROM e_budget.project WHERE project_id='" + request.getParameter("project_id") + "'";
        DB2Manager dbms = new DB2Manager();
        ResultSet rs = dbms.GetDataAsResultSet(query);
        if (rs.next()) {
            officeid = rs.getString("officeid");
            project_id = request.getParameter("project_id");
            purchase_sub_type_id = rs.getInt("purchase_sub_type_id");
        }
        tag = "แก้ไข";
    }
%>
<div class="main-content-inner">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.jsp">หน้าหลัก</a></li>
                <li><a href="index.jsp?service=ActiveProjectList"> ข้อมูลโครงการที่ได้รับอนุมัติ </a></li>
                <li> <%=tag%>โครงการที่ได้รับอนุมัติ </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=tag%>โครงการที่ได้รับอนุมัติ</small></h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div>
                        <div id="user-profile-1" class="user-profile row">
                            <div class="col-xs-12 col-sm-3 center">
                                <div>
                                    <span class="profile-picture">
                                        <img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="assets/images/Money256.png" style="width:256px;height:256px;"/></a>
                                    </span>
                                    <div class="space-4"></div>
                                    <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                        <div class="inline position-relative">
                                            <b href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                                                <span class="white"><%=tag%>โครงการที่ได้รับอนุมัติ</span>
                                            </b>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-6"></div>
                                <div class="hr hr16 dotted"></div>
                            </div>
                            <div class="col-xs-12 col-sm-9">
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> หน่วยงานเจ้าของโครงการ <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <%
                                                        String disable = "";
                                                        if (project_id.isEmpty()) {

                                                        } else {
                                                            disable = "disabled=''";
                                                        }
                                                    %>
                                                    <select class="chosen-select form-control" id="officeid_tf"  onchange="getProject(this.value)" <% out.print(disable); %>>
                                                        <option value="">  </option>
                                                        <%
                                                            String query = "";
                                                            if (session.getAttribute("E-Budget-OFFICEID").toString().startsWith("00")) {
                                                                query = "SELECT * FROM e_budget.office WHERE officeid LIKE '" + session.getAttribute("E-Budget-OFFICEID").toString().substring(0, 2) + "%'";
                                                            } else {
                                                                if (session.getAttribute("E-Budget-OFFICEID").toString().endsWith("000000")) {
                                                                    query = "SELECT * FROM e_budget.office WHERE officeid LIKE '" + session.getAttribute("E-Budget-OFFICEID").toString().substring(0, 2) + "%'";
                                                                } else {
                                                                    query = "SELECT * FROM e_budget.office WHERE officeid LIKE '" + session.getAttribute("E-Budget-OFFICEID") + "'";
                                                                }
                                                            }
                                                            DB2Manager dbms = new DB2Manager();
                                                            ResultSet rs = dbms.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if (officeid.equals(rs.getString("officeid"))) {
                                                                    out.print("<option value='" + rs.getString("officeid") + "' SELECTED> " + rs.getString("officename") + " </option>");
                                                                } else {
                                                                    out.print("<option value='" + rs.getString("officeid") + "'> " + rs.getString("officename") + " </option>");
                                                                }

                                                            }
                                                        %>
                                                    </select>                                              
                                                </span>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> โครงการ <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select form-control" id="project_tf" <%=disable%>>

                                                        <option value="">  </option>
                                                        <%
                                                            if(!project_id.isEmpty()){
                                                                query = "SELECT * FROM e_budget.project WHERE project_id='"+project_id+"'";
                                                                rs = dbms.GetDataAsResultSet(query);
                                                                if(rs.next())
                                                                    out.print("<option value='"+rs.getString("project_id")+"' SELECTED> "+rs.getString("project_name")+" </option>");
                                                            }
                                                        %>
                                                    </select>                                              
                                                </span>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ประเภทการจัดซื้อจัดจ้าง<b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select form-control" id="purchase_sub_type_id_tf">
                                                        <option value="">  </option>
                                                        <%                                                            query = "SELECT * FROM e_budget.purchase_sub_type";
                                                            rs = dbms.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if(purchase_sub_type_id == rs.getInt("purchase_sub_type_id")){
                                                                    out.println("<option value='" + rs.getString("purchase_sub_type_id") + "' SELECTED> " + rs.getString("purchase_sub_type_name") + " </option>");
                                                                }else{
                                                                    out.println("<option value='" + rs.getString("purchase_sub_type_id") + "'> " + rs.getString("purchase_sub_type_name") + " </option>");
                                                                }
                                                                
                                                            }
                                                        %>
                                                    </select>                                              
                                                </span>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-10"></div>
                            <div class="col-xs-9 col-sm-9" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="ActiveProject()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('MofStrategic')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
<script>
    function getProject(officeid) {
        $.ajax({
            type: "POST",
            url: "GetProjectFromOfficeidServlet",
            data: {officeid: officeid},
            cache: false,
            success: function (data) {
                $('#project_tf').children('option').remove();
                var project = $.parseJSON(data);
                $('#project_tf').append('<option value=""> </option>');
                for (i = 0; i < project.length; i++) {
                    $('#project_tf').append('<option value="' + project[i]['project_id'] + '">' + project[i]['project_name'] + '</option>');
                }
            },
            error: function (err) {

            }
        });
    }
    function ActiveProject() {
        var officeid = "<%=session.getAttribute("E-Budget-OFFICEID")%>";
        if (officeid == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var project_id = $('#project_tf').val();
        if (project_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var purchase_sub_type_id = $('#purchase_sub_type_id_tf').val();
        if (purchase_sub_type_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var activeProject = {
            project_id: project_id,
            officeid: officeid,
            purchase_sub_type_id: purchase_sub_type_id,
            METHOD: "INSERT"
        };

        $.ajax({
            type: "POST",
            url: "ActiveProjectServlet",
            data: {activeProject: activeProject},
            cache: false,
            success: function (data) {
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('ActiveProjectList');
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