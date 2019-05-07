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
    String disable = "";
    double allocate_budget_total= 0;
    if (acc.IsNullToEmtyString(request.getParameter("allocate_budget_id")).isEmpty()) {
        tag = "เพิ่ม";
    } else {
        tag = "แก้ไข";
        String query = "select ab.*,p.officeid from e_budget.allocate_budget ab LEFT JOIN e_budget.project p ON ab.project_id = p.project_id WHERE ab.allocate_budget_id="+request.getParameter("allocate_budget_id");
        DB2Manager dbms = new DB2Manager();
        ResultSet rs = dbms.GetDataAsResultSet(query);
        if(rs.next()){
            project_id = rs.getString("project_id");
            officeid = rs.getString("officeid");
            allocate_budget_total = rs.getDouble("allocate_budget_total");
        }
        rs.close();
        dbms.closeConnection();
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
                <li><a href="index.jsp?service=BudgetAllocate"> รายการงบประมาณ </a></li>
                <li><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>"> รายการจัดสรรงบประมาณ </a></li>
                <li> <%=tag%>การจัดสสร </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <%
                    String budget_category_name = "";
                    String budget_type_name = "";
                    String disbursement_category_name="";
                    if (!acc.IsNullToEmtyString(request.getParameter("budget_category_id")).isEmpty()) {
                        String query = "select * from e_budget.disbursement_category dc "
                                + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                + "left join e_budget.budget_type bt ON bc .budget_type_id = bt.budget_type_id "
                                + "where dc.disbursement_category_id = " + acc.IsNullToEmtyString(request.getParameter("disbursement_category_id"));
                        DB2Manager dbms = new DB2Manager();
                        ResultSet rs = dbms.GetDataAsResultSet(query);
                        rs.next();
                        budget_category_name = acc.IsNullToEmtyString(rs.getString("budget_category_name"));
                        budget_type_name = acc.IsNullToEmtyString(rs.getString("budget_type_name"));
                        disbursement_category_name = acc.IsNullToEmtyString(rs.getString("disbursement_category_name"));
                        rs.close();
                        dbms.closeConnection();
                    }
                %>
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=tag%>การจัดสสรรงบประมาณ >> ประเภทงบประมาณ : <%=budget_type_name%> >> หมวดงบประมาณ : <%=budget_category_name%> >> หมวดรายจ่าย : <%=disbursement_category_name%> </small></h1>
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
                                                <span class="white"><%=tag%>การจัดสสรร</span>
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
                                        <div class="profile-info-name" style="width:200px;"> หน่วยงาน <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select form-control" id="officeid_tf" onchange="getProject(this.value)">
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
                                                <select class="chosen-select form-control" id="project_tf" onchange="GetMoney(this.value)" <%=disable%>>

                                                    <option value="">  </option>
                                                    <%
                                                        if (!project_id.isEmpty()) {
                                                            query = "SELECT * FROM e_budget.project WHERE project_id='" + project_id + "'";
                                                            rs = dbms.GetDataAsResultSet(query);
                                                            if (rs.next()) {
                                                                out.print("<option value='" + rs.getString("project_id") + "' SELECTED> " + rs.getString("project_name") + " </option>");
                                                            }
                                                        }
                                                    %>
                                                </select>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> จำนวนเงิน <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <input class="form-control active" type="text" id="budget_total_tf" onkeypress="validateNumber(event)" value="<%=allocate_budget_total%>" >                                              
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-10"></div>
                            <div class="col-xs-9 col-sm-9" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="SaveAllocateBudget()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>')""><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
    function GetMoney(project_id) {
        $.ajax({
            type: "POST",
            url: "GetBudgetTotal",
            data: {project_id: project_id},
            cache: false,
            success: function (data) {
                $("#budget_total_tf").val(data);
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });

    }
    function GetOffice(officeid) {
        $.ajax({
            type: "POST",
            url: "GetOfficeServlet",
            data: {officeid: officeid},
            cache: false,
            success: function (data) {
                $('#officeid_tf').children('option').remove();
                var office = $.parseJSON(data);
                $('#officeid_tf').append('<option value=""> </option>');
                for (i = 0; i < office.length; i++) {
                    $('#officeid_tf').append('<option value="' + office[i]['officeid'] + '">' + office[i]['officename'] + '</option>');
                }
            },
            error: function (err) {

            }
        });
    }
    function SaveAllocateBudget() {
        waitingDialog.show();
        var project_id = $("#project_tf").val();
        if (project_id.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var officeid = "<%= session.getAttribute("E-Budget-OFFICEID")%>";
        var disbursement_category_id = "<%=request.getParameter("disbursement_category_id")%>";
        var allocate_budget_total = $("#budget_total_tf").val();
        if (allocate_budget_total.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var allocate_budget = {
            allocate_budget_id : "<%=acc.IsNullToEmtyString(request.getParameter("allocate_budget_id"))%>",
            officeid: officeid,
            project_id: project_id,
            allocate_budget_total: allocate_budget_total,
            disbursement_category_id: disbursement_category_id,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "AllocateBudgetServlet",
            data: {allocate_budget: allocate_budget},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto("BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id="+disbursement_category_id)
                                }}}
                    });
                }else{
                    $.confirm({
                        title: '', content: '<b>'+data+'</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                   alert(data);
                                }}}
                    });
                }
            },
            error: function (err) {

            }
        });
    }
</script>