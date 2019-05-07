<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    String budget_category_status = "";
    String budget_category_name = "";
    String budget_type_id = "";
    if (!acc.IsNullToEmtyString(request.getParameter("budget_category_id")).isEmpty()) {
        String query = "SELECT * FROM e_budget.budget_category WHERE budget_category_id=" + acc.IsNullToEmtyString(request.getParameter("budget_category_id"));
        DB2Manager mm = new DB2Manager();
        ResultSet rs = mm.GetDataAsResultSet(query);
        rs.next();
        if (acc.IsNullToEmtyString(rs.getString("budget_category_status")).equals("Y")) {
            budget_category_status = "checked='checked'";
        }
        budget_type_id = acc.IsNullToEmtyString(rs.getString("budget_type_id"));
        budget_category_name = acc.IsNullToEmtyString(rs.getString("budget_category_name"));
        tag = "แก้ไข";
        rs.close();
        mm.closeConnection();
    } else {
        tag = "เพิ่ม";
        budget_category_status = "checked='checked'";
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
                    <li><a href="index.jsp?service=BudgetCategory"> หมวดงบประมาณ </a></li>
                    <li> <%=tag%>หมวดงบประมาณ </li>
                </ul>
                <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> หมวดงบประมาณ </small></h1>
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
                                                    <span class="white"><%=tag%>หมวดงบประมาณ</span>
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
                                                        <select class="chosen-select form-control" id="budget_type_id_tf">
                                                            <option value="">  </option>
                                                            <%
                                                                String query = "SELECT * FROM e_budget.budget_type WHERE budget_type_status = 'Y'";
                                                                DB2Manager mm = new DB2Manager();
                                                                ResultSet rs = mm.GetDataAsResultSet(query);
                                                                while (rs.next()) {
                                                                    if (budget_type_id.equals(acc.IsNullToEmtyString(rs.getString("budget_type_id")))) {
                                                                        out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_type_id")) + "' SELECTED> " + acc.IsNullToEmtyString(rs.getString("budget_type_name")) + " </option>");
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
                                                        <input class="form-control active" type="text" id="budget_category_tf" value="<%=budget_category_name%>">
                                                        <span class="input-group-addon">
                                                            <i class="fa fa-info bigger-110"></i>
                                                        </span>

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
                                                            <input id="budget_category_status_tf" class="ace ace-switch ace-switch-6" type="checkbox" <%=budget_category_status%>>
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
                                        <button class="btn btn-danger btn-white" onclick="Goto('RDGoal')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
    function Add() {
        waitingDialog.show();
        var budget_category_id = '<%=acc.IsNullToEmtyString(request.getParameter("budget_category_id"))%>';
        var budget_category_name = $('#budget_category_tf').val();
        if (budget_category_name.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var budget_category_status = $('#budget_category_status_tf').is(":checked") ? 'Y' : 'N';
        var budget_type_id = $('#budget_type_id_tf').val();
        if (budget_type_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }

        var budget_category = {
            budget_category_id: budget_category_id,
            budget_category_name: budget_category_name,
            budget_category_status: budget_category_status,
            budget_type_id: budget_type_id,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "BudgetCategoryServlet",
            data: {budget_category: budget_category},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('BudgetCategory');
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
