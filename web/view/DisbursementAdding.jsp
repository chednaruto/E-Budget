<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    String disbursement_status = "";
    String disbursement_name = "";
    String disbursement_category_id = "";
    String gfmis_account_id = "";
    String disbursement_type_id = "";
    String budget_type_id = "";
    String budget_category_id = "";
    String plan_type_id = "";
    if (!acc.IsNullToEmtyString(request.getParameter("disbursement_id")).isEmpty()) {
        String query = "SELECT d.*,dc.disbursement_category_name,dt.budget_type_id,dt.budget_category_id "
                + "FROM e_budget.disbursement d "
                + "LEFT JOIN e_budget.disbursement_category dc ON d.disbursement_category_id = dc.disbursement_category_id "
                + "LEFT JOIN e_budget.budget_category dt ON dc.budget_category_id = dt.budget_category_id "
                + "WHERE d.disbursement_id=" + acc.IsNullToEmtyString(request.getParameter("disbursement_id"));
        DB2Manager mm = new DB2Manager();
        ResultSet rs = mm.GetDataAsResultSet(query);
        rs.next();
        if (acc.IsNullToEmtyString(rs.getString("disbursement_status")).equals("Y")) {
            disbursement_status = "checked='checked'";
        }
        disbursement_category_id = acc.IsNullToEmtyString(rs.getString("disbursement_category_id"));
        disbursement_name = acc.IsNullToEmtyString(rs.getString("disbursement_name"));
        gfmis_account_id = acc.IsNullToEmtyString(rs.getString("gfmis_account_id"));
        plan_type_id = acc.IsNullToEmtyString(rs.getString("plan_type_id"));
        budget_type_id = acc.IsNullToEmtyString(rs.getString("budget_type_id"));
        budget_category_id = acc.IsNullToEmtyString(rs.getString("budget_category_id"));
        tag = "แก้ไข";
        rs.close();
        mm.closeConnection();
    } else {
        tag = "เพิ่ม";
        disbursement_status = "checked='checked'";
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
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.php">หน้าหลัก</a></li>
                    <li><a href="index.jsp?service=Disbursement"> รายจ่าย </a></li>
                    <li> <%=tag%>รายจ่าย </li>
                </ul>
                <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=tag%>รายจ่าย </small></h1>
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
                                                    <span class="white"><%=tag%>รายจ่าย</span>
                                                </b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-6"></div>
                                    <div class="hr hr16 dotted"></div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> ประเภทงบประมาณ <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <select class="chosen-select form-control" id="budget_type_id_tf" onchange="DisplayBudgetCategory(this.value)">
                                                            <option value=""> ------- เลือกประเภทงบประมาณ ------- </option>
                                                            <%
                                                                String query = "SELECT * FROM e_budget.budget_type WHERE budget_type_status = 'Y'";
                                                                DB2Manager mm = new DB2Manager();
                                                                ResultSet rs = mm.GetDataAsResultSet(query);
                                                                while (rs.next()) {
                                                                    if (budget_type_id.equals(rs.getString("budget_type_id"))) {
                                                                        out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_type_id")) + "' selected> " + acc.IsNullToEmtyString(rs.getString("budget_type_name")) + " </option>");
                                                                    } else {
                                                                        out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_type_id")) + "'> " + acc.IsNullToEmtyString(rs.getString("budget_type_name")) + " </option>");
                                                                    }
                                                                }
                                                            %>

                                                        </select>
                                                    </div>                                                
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> หมวดงบประมาณ <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <select class="chosen-select form-control" id="budget_category_id_tf" onchange="GetDisbursementCategory(this.value)">
                                                            <option value=""> ------- เลือกหมวดงบประมาณ ------- </option>
                                                            <%
                                                                if (!budget_type_id.isEmpty()) {
                                                                    query = "SELECT * FROM e_budget.budget_category WHERE budget_category_status = 'Y' AND budget_type_id=" + budget_type_id;
                                                                    rs = mm.GetDataAsResultSet(query);
                                                                    while(rs.next()) {
                                                                        if (budget_category_id.equals(rs.getString("budget_category_id"))) {
                                                                            out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_category_id")) + "' selected> " + acc.IsNullToEmtyString(rs.getString("budget_category_name")) + " </option>");
                                                                        } else {
                                                                            out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_category_id")) + "'> " + acc.IsNullToEmtyString(rs.getString("budget_category_name")) + " </option>");
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
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> หมวดรายจ่าย <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <select class="chosen-select form-control" id="disbursement_category_id_tf">
                                                            <option value=""> ------- เลือกหมวดรายจ่าย ------- </option>
                                                            <%
                                                                if (budget_category_id.isEmpty()) {
                                                                } else {
                                                                    query = "SELECT * FROM e_budget.disbursement_category dc WHERE dc.budget_category_id = " + budget_category_id;
                                                                    rs = mm.GetDataAsResultSet(query);
                                                                    while (rs.next()) {
                                                                        if (disbursement_category_id.equals(acc.IsNullToEmtyString(rs.getString("disbursement_category_id")))) {
                                                                            out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("disbursement_category_id")) + "' SELECTED> " + acc.IsNullToEmtyString(rs.getString("disbursement_category_name")) + " </option>");
                                                                        } else {
                                                                            out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("disbursement_category_id")) + "'> " + acc.IsNullToEmtyString(rs.getString("disbursement_category_name")) + " </option>");
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
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> ชื่อรายจ่าย <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <input class="form-control active" type="text" id="disbursement_name_tf" value="<%=disbursement_name%>">
                                                        <span class="input-group-addon">
                                                            <i class="fa fa-info bigger-110"></i>
                                                        </span>

                                                    </div>                                                
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> รหีสบัญชี GFMIS <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <select class="chosen-select form-control" id="gfmis_code_tf">
                                                            <option value="">  </option>
                                                            <%
                                                                query = "SELECT * FROM e_budget.gfmis_account";
                                                                rs = mm.GetDataAsResultSet(query);
                                                                while (rs.next()) {
                                                                    if (gfmis_account_id.equals(acc.IsNullToEmtyString(rs.getString("gfmis_account_id")))) {
                                                                        out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("gfmis_account_id")) + "' SELECTED> [" + acc.IsNullToEmtyString(rs.getString("gfmis_account_id")) + "] " + acc.IsNullToEmtyString(rs.getString("gfmis_account_name")) + " </option>");
                                                                    } else {
                                                                        out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("gfmis_account_id")) + "'> [" + acc.IsNullToEmtyString(rs.getString("gfmis_account_id")) + "] " + acc.IsNullToEmtyString(rs.getString("gfmis_account_name")) + " </option>");
                                                                    }
                                                                }
                                                            %>

                                                        </select>
                                                    </div>                                                
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> แผนงาน <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <div class="input-group col-sm-12">
                                                        <select class="chosen-select form-control" id="plan_type_id_tf">
                                                            <option value="">  </option>
                                                            <%
                                                                query = "SELECT * FROM e_budget.plan_type";
                                                                rs = mm.GetDataAsResultSet(query);
                                                                while (rs.next()) {
                                                                    if (plan_type_id.equals(acc.IsNullToEmtyString(rs.getString("plan_type_id")))) {
                                                                        out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("plan_type_id")) + "' SELECTED> " + acc.IsNullToEmtyString(rs.getString("plan_type_name")) + " </option>");
                                                                    } else {
                                                                        out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("plan_type_id")) + "'> " + acc.IsNullToEmtyString(rs.getString("plan_type_name")) + " </option>");
                                                                    }
                                                                }
                                                            %>

                                                        </select>
                                                    </div>                                                
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-10"></div>
                                <div class="col-xs-9 col-sm-9" id="infomation3">
                                    <div class="space-10"></div>
                                    <div class="social-or-login center">
                                        <span class="bigger-110"> สถานะการใช้งาน </span>
                                    </div>
                                    <div class="space-10"></div>
                                    <!-- #section:pages/profile.info -->
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">										
                                            <div class="profile-info-value">
                                                <span id="username">
                                                    <div class="col-xs-12 center">
                                                        <label>
                                                            <input id="disbursement_status_tf" class="ace ace-switch ace-switch-6" type="checkbox" <%=disbursement_status%>>
                                                            <span class="lbl">&nbsp;&nbsp;ปิดใช้งาน/เปิดใช้งาน</span>
                                                        </label>
                                                    </div>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- /section:pages/profile.info -->
                                    <div class="space-10"></div>

                                    <div class="center">
                                        <button class="btn btn-success btn-white" onclick="Add()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                        <button class="btn btn-danger btn-white" onclick="Goto('Disbursement')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
</div>
<script>
    function DisplayBudgetCategory(budget_type_id) {
        $.ajax({
            type: "POST",
            url: "GetBudgetCategoryServlet",
            data: {budget_type_id: budget_type_id},
            cache: false,
            success: function (data) {
                $('#budget_category_id_tf').children('option').remove();
                $('#budget_category_id_tf').append('<option value="">------- เลือกหมวดงบประมาณ -------</option>');
                var budget_category = $.parseJSON(data);
                for (i = 0; i < budget_category.length; i++) {
                    $('#budget_category_id_tf').append('<option value="' + budget_category[i]['budget_category_id'] + '">' + budget_category[i]['budget_category_name'] + '</option>');
                }
                $('#budget_category_id_tf').trigger('chosen:updated');
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });
    }
    function Add() {
        waitingDialog.show();
        var disbursement_id = '<%=acc.IsNullToEmtyString(request.getParameter("disbursement_id"))%>';
        var budget_category_id = $('#budget_category_id_tf').val();
        if (budget_category_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var plan_type_id = $('#plan_type_id_tf').val();
        if (plan_type_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var disbursement_category_id = $('#disbursement_category_id_tf').val();
        if (disbursement_category_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var gfmis_code = $('#gfmis_code_tf').val();
        if (gfmis_code == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var disbursement_status = $('#disbursement_status_tf').is(":checked") ? 'Y' : 'N';
        var disbursement_name = $('#disbursement_name_tf').val();
        if (disbursement_name == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }

        var disbursement = {
            disbursement_id: disbursement_id,
            disbursement_name: disbursement_name,
            disbursement_category_id: disbursement_category_id,
            disbursement_status: disbursement_status,
            budget_category_id: budget_category_id,
            gfmis_code: gfmis_code,
            plan_type_id: plan_type_id,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "DisbursementServlet",
            data: {disbursement: disbursement},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('Disbursement');
                                }}}
                    });
                }
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });
    }
    function GetDisbursementCategory(budget_category_id) {
        $.post("GetDisbursementCategory",
                {budget_category_id: budget_category_id},
                function (data) {
                    $('#disbursement_category_id_tf').children('option').remove();
                    $('#disbursement_category_id_tf').append('<option value=""> ------- เลือกหมวดรายจ่าย ------- </option>');
                    var disbursement_category = $.parseJSON(data);
                    for (i = 0; i < disbursement_category.length; i++) {
                        $('#disbursement_category_id_tf').append('<option value="' + disbursement_category[i]['disbursement_category_id'] + '">' + disbursement_category[i]['disbursement_category_name'] + '</option>');
                    }
                    $('#disbursement_category_id_tf').trigger('chosen:updated');
                }
        );
    }
</script>
