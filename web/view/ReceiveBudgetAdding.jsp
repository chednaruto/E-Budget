<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />

<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    String budget_type_id = "";
    String budget_category_id = "";
    String budget_receive_year = "";
    String budget_receive_date = "";
    String disbursement_category_id = "";
    double budget_total = 0;
    if (!acc.IsNullToEmtyString(request.getParameter("receive_budget_id")).isEmpty()) {
        String query = "SELECT * FROM e_budget.receive_budget WHERE receive_budget_id=" + acc.IsNullToEmtyString(request.getParameter("receive_budget_id"));
        DB2Manager mm = new DB2Manager();
        ResultSet rs = mm.GetDataAsResultSet(query);
        rs.next();
        budget_type_id = acc.IsNullToEmtyString(rs.getString("budget_type_id"));
        budget_category_id = acc.IsNullToEmtyString(rs.getString("budget_category_id"));
        budget_total = Double.parseDouble(acc.IsNullToEmtyString(rs.getString("budget_total")));
        budget_receive_year = acc.IsNullToEmtyString(rs.getString("budget_receive_year"));
        budget_receive_date = acc.IsNullToEmtyString(rs.getString("budget_receive_date"));
        disbursement_category_id = acc.IsNullToEmtyString(rs.getString("disbursement_category_id"));
        tag = "แก้ไข";
        rs.close();
        mm.closeConnection();
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
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.php">หน้าหลัก</a></li>
                    <li><a href="index.jsp?service=ReceiveBudget"> รายการรับงบประมาณ </a></li>
                    <li> <%=tag%>รายการรับงบประมาณ </li>
                </ul>
                <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายการรับงบประมาณ </small></h1>
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
                                                    <span class="white"><%=tag%>รายการรับงบประมาณ</span>
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
                                                    <select class="chosen-select form-control" id="budget_type_tf" onchange="GetBudgetCategory(this.value)">
                                                        <option value=""> ------- เลือกประเภทงบประมาณ ------- </option>
                                                        <%

                                                            String query = "SELECT * FROM e_budget.budget_type WHERE budget_type_status = 'Y'";
                                                            DB2Manager mm = new DB2Manager();
                                                            ResultSet rs = mm.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if (budget_type_id.equals(acc.IsNullToEmtyString(rs.getString("budget_type_id")))) {
                                                                    out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_type_id")) + "' SELECTED> " + acc.IsNullToEmtyString(rs.getString("budget_type_name")) + " </option>");
                                                                } else {
                                                                    out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_type_id")) + "' > " + acc.IsNullToEmtyString(rs.getString("budget_type_name")) + " </option>");
                                                                }
                                                            }

                                                        %>

                                                    </select>                                              
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
                                                        <div class="input-group col-sm-12">
                                                            <select class="chosen-select form-control" id="budget_category_tf" onchange="GetDisbursementCategory(this.value)">
                                                                <option value=""> ------- เลือกหมวดงบประมาณ ------- </option>
                                                                <%                                                                    if (!budget_type_id.isEmpty()) {
                                                                        query = "SELECT * FROM e_budget.budget_category WHERE budget_category_status = 'Y' AND budget_type_id=" + budget_type_id;
                                                                        rs = mm.GetDataAsResultSet(query);
                                                                        while (rs.next()) {
                                                                            if (budget_type_id.equals(acc.IsNullToEmtyString(rs.getString("budget_type_id")))) {
                                                                                out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_category_id")) + "' SELECTED> " + acc.IsNullToEmtyString(rs.getString("budget_category_name")) + " </option>");
                                                                            } else {
                                                                                out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_category_id")) + "' > " + acc.IsNullToEmtyString(rs.getString("budget_category_name")) + " </option>");
                                                                            }
                                                                        }
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>  
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
                                                        <div class="input-group col-sm-12">
                                                            <select class="chosen-select form-control" id="disbursement_category_id_tf">
                                                                <option value=""> ------- เลือกหมวดรายจ่าย ------- </option>
                                                                <%
                                                                    if (!budget_category_id.isEmpty()) {
                                                                        query = "SELECT * FROM e_budget.disbursement_category WHERE disbursement_category_status = 'Y' AND budget_category_id=" + budget_category_id;
                                                                        rs = mm.GetDataAsResultSet(query);
                                                                        while (rs.next()) {
                                                                            if (disbursement_category_id.equals(acc.IsNullToEmtyString(rs.getString("disbursement_category_id")))) {
                                                                                out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("disbursement_category_id")) + "' SELECTED> " + acc.IsNullToEmtyString(rs.getString("disbursement_category_name")) + " </option>");
                                                                            } else {
                                                                                out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("disbursement_category_id")) + "' > " + acc.IsNullToEmtyString(rs.getString("disbursement_category_name")) + " </option>");
                                                                            }
                                                                        }
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>  
                                                    </div>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> ยอดเงิน <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <%
                                                        NumberFormat formatter = new DecimalFormat("#0.00");
                                                    %>
                                                    <input class="form-control active" type="text" onkeypress="validateNumber(event)" id="budget_total_tf" value="<%=formatter.format(budget_total)%>">                                              
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name" style="width:200px;"> ปีงบประมาณ <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <span>
                                                    <input class="form-control active" type="text" onkeypress="validateNumber(event)" maxlength="4" id="budget_receive_year_tf" value="<%=budget_receive_year%>">                                              
                                                </span>
                                            </div>
                                            <div class="profile-info-name" style="width:200px;"> วันที่รับโอนงบประมาณ <b class="red">*</b></div>
                                            <div class="profile-info-value col-sm-12">
                                                <div class="input-group">
                                                    <input class="form-control date-picker" id="budget_receive_date_tf"  type="text" data-date-format="dd-mm-yyyy" value="<%=acc.ChageDateFormat(budget_receive_date, "yyyy-MM-dd", "dd-MM-yyyy")%>" />
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar bigger-110"></i>
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-10"></div>
                                <div class="col-xs-9 col-sm-9" id="infomation3">
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


<script src="assets/js/bootstrap-datepicker.min.js">

</script>

<script>
    $(document).ready(function () {
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
    function Add() {
        waitingDialog.show();
        var receive_budget_id = '<%=acc.IsNullToEmtyString(request.getParameter("receive_budget_id"))%>';
        var budget_type_id = $("#budget_type_tf").val();
        if (budget_type_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }

        var budget_category_id = $("#budget_category_tf").val();
        if (budget_category_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var disbursement_category_id = $("#disbursement_category_id_tf").val();
        if (disbursement_category_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }

        var budget_total = $('#budget_total_tf').val();
        if (budget_total == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var budget_receive_year = $("#budget_receive_year_tf").val();
        if (budget_receive_year == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var budget_receive_date = $("#budget_receive_date_tf").val();
        if (budget_receive_date == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var receive_budget = {
            receive_budget_id: receive_budget_id,
            budget_type_id: budget_type_id,
            budget_category_id: budget_category_id,
            budget_total: budget_total,
            budget_receive_year: budget_receive_year,
            budget_receive_date: budget_receive_date,
            officeid: "<% out.print(request.getSession().getAttribute("E-Budget-OFFICEID"));%>",
            disbursement_category_id:disbursement_category_id,
            METHOD: "INSERT"
        };

        $.ajax({
            type: "POST",
            url: "BudgetReceiveServlet",
            data: {receive_budget: receive_budget},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('ReceiveBudget');
                                }}}
                    });
                }
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });

    }
    function GetBudgetCategory(budget_type_id) {
        $.post("GetBudgetCategory",
                {budget_type_id: budget_type_id},
                function (data) {
                    $('#budget_category_tf').children('option').remove();
                    $('#budget_category_tf').append('<option value="">------- เลือกหมวดงบประมาณ -------</option>');
                    
                    var budget_category = $.parseJSON(data);
                    for (i = 0; i < budget_category.length; i++) {
                        $('#budget_category_tf').append('<option value="' + budget_category[i]['budget_category_id'] + '">' + budget_category[i]['budget_category_name'] + '</option>');
                    }
                    $('#budget_category_tf').trigger('chosen:updated');
                }
        );
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