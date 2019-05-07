<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    if (acc.IsNullToEmtyString(request.getParameter("change_budget_id")).isEmpty()) {
        tag = "ขอ";
    } else {
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
                <li><a href="index.jsp?service=BudgetAllocate"> รายการงบประมาณ </a></li>
                <li><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>"> รายการจัดสรรงบประมาณ </a></li>
                <li> <%=tag%>เปลี่ยนแปลงงบประมาณ </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <%
                    String budget_category_name = "";
                    String budget_type_name = "";
                    int budget_type_id = 0;
                    int budget_category_id = 0;
                    String disbursement_category_name = "";
                    String disbursement_category_id = request.getParameter("disbursement_category_id");
                    String change_budget_datetime = "";
                    double budget_total = 0;
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
                        budget_type_id = rs.getInt("budget_type_id");
                        budget_category_id = rs.getInt("budget_category_id");
                        if (!acc.IsNullToEmtyString(request.getParameter("change_budget_id")).isEmpty()) {
                            query = "SELECT * FROM e_budget.change_budget bc "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON bc.to_disbursement_category_id = dc.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bcc ON dc.budget_category_id = bcc.budget_category_id "
                                    + "WHERE change_budget_id=" + request.getParameter("change_budget_id");
                            rs = dbms.GetDataAsResultSet(query);
                            if (rs.next()) {
                                budget_type_id = rs.getInt("budget_type_id");
                                budget_category_id = rs.getInt("budget_category_id");
                                disbursement_category_id = rs.getString("disbursement_category_id");
                                budget_total = rs.getDouble("budget_total");
                                change_budget_datetime = acc.ChageDateFormat(rs.getString("change_budget_datetime"), "yyyy-MM-dd hh:mm:ss", "dd-MM-yyyy hh:mm:ss");
                            }
                        }
                        rs.close();
                        dbms.closeConnection();
                    }
                %>
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=tag%>การจัดสสร >> ประเภทงบประมาณ : <%=budget_type_name%> >> หมวดงบประมาณ : <%=budget_category_name%> >> หมวดรายจ่าย : <%=disbursement_category_name%> </small></h1>
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
                                                <span class="white"><%=tag%>เปลี่ยนแปลงงบประมาณ</span>
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
                                        <div class="profile-info-name" style="width:200px;"> ประเภทงบประมาณ <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <select class="chosen-select form-control col-sm-12" id="budget_type_tf" onchange="GetBudgetCategory(this.value)" disabled>
                                                    <option value="" >  </option>
                                                    <%

                                                        String query = "SELECT * FROM e_budget.budget_type WHERE budget_type_status = 'Y'";
                                                        DB2Manager mm = new DB2Manager();
                                                        ResultSet rs = mm.GetDataAsResultSet(query);
                                                        while (rs.next()) {
                                                            if (rs.getInt("budget_type_id") == budget_type_id) {
                                                                out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_type_id")) + "' selected=''> " + acc.IsNullToEmtyString(rs.getString("budget_type_name")) + " </option>");
                                                            } else {
                                                                out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_type_id")) + "' > " + acc.IsNullToEmtyString(rs.getString("budget_type_name")) + " </option>");
                                                            }
                                                        }
                                                        rs.close();
                                                        mm.closeConnection();
                                                    %>

                                                </select>                                              
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> หมวดงบประมาณ <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select form-control col-sm-12" id="budget_category_id_tf" onchange="GetDisbursementCategory(this.value)" >
                                                        <%
                                                            query = "SELECT * FROM e_budget.budget_category WHERE budget_category_status = 'Y' AND budget_type_id = " + budget_type_id;
                                                            mm = new DB2Manager();
                                                            rs = mm.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if (rs.getInt("budget_category_id") == budget_category_id) {
                                                                    out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_category_id")) + "' selected=''> " + acc.IsNullToEmtyString(rs.getString("budget_category_name")) + " </option>");
                                                                } else {
                                                                    out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("budget_category_id")) + "' > " + acc.IsNullToEmtyString(rs.getString("budget_category_name")) + " </option>");
                                                                }
                                                            }
                                                            rs.close();
                                                            mm.closeConnection();
                                                        %>
                                                    </select>                                              
                                                </span>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> หมวดงรายจ่ายที่ขอเปลี่ยน <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select form-control col-sm-12" id="disbursement_category_id_tf" >
                                                        <%
                                                            query = "SELECT * FROM e_budget.disbursement_category WHERE disbursement_category_status = 'Y'  AND budget_category_id=" + budget_category_id;
                                                            mm = new DB2Manager();
                                                            rs = mm.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if (rs.getString("disbursement_category_id").equals(disbursement_category_id)) {
                                                                    out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("disbursement_category_id")) + "' selected=''> " + acc.IsNullToEmtyString(rs.getString("disbursement_category_name")) + " </option>");
                                                                } else {
                                                                    out.println("<option value='" + acc.IsNullToEmtyString(rs.getString("disbursement_category_id")) + "' > " + acc.IsNullToEmtyString(rs.getString("disbursement_category_name")) + " </option>");
                                                                }
                                                            }
                                                            rs.close();
                                                            mm.closeConnection();
                                                        %>
                                                    </select>                                              
                                                </span>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> วันที่โอนงบประมาณ <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <div class="input-group">
                                                    <input id="change_budget_datetime_tf" type="text" class="form-control" value="<%=change_budget_datetime%>"/>
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-clock-o bigger-110"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> จำนวนเงิน <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <input class="form-control active" type="text" onkeypress="validateNumber(event)" id="budget_total_tf" value="<%=budget_total%>">                                              
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-10"></div>
                            <div class="col-xs-9 col-sm-9" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="ChangeBudget()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
<link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="assets/css/chosen.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-colorpicker.min.css" />
<script>
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

        if (!ace.vars['old_ie'])
            $('#change_budget_datetime_tf').datetimepicker({
                //format: 'MM/DD/YYYY h:mm:ss A',//use this option to display seconds
                format: 'DD-MM-YYYY hh:mm:ss',
                icons: {
                    time: 'fa fa-clock-o',
                    date: 'fa fa-calendar',
                    up: 'fa fa-chevron-up',
                    down: 'fa fa-chevron-down',
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-arrows ',
                    clear: 'fa fa-trash',
                    close: 'fa fa-times'
                }
            }).next().on(ace.click_event, function () {
                $(this).prev().focus();
            });
    });
    function GetDisbursementCategory(budget_category_id) {
        $.ajax({
            type: "POST",
            url: "GetDisbursementCategory",
            data: {budget_category_id: budget_category_id},
            cache: false,
            success: function (data) {
                $('#disbursement_category_id_tf').children('option').remove();
                var budget_category = $.parseJSON(data);
                for (i = 0; i < budget_category.length; i++) {
                    $('#disbursement_category_id_tf').append('<option value="' + budget_category[i]['disbursement_category_id'] + '">' + budget_category[i]['disbursement_category_name'] + '</option>');
                }
                $('#disbursement_category_id_tf').trigger('chosen:updated');
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });
    }
    function ChangeBudget() {
        var change_budget_datetime = $('#change_budget_datetime_tf').val();
        if (change_budget_datetime == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var change_budget_id = "<%=acc.IsNullToEmtyString(request.getParameter("change_budget_id"))%>";
        var from_disbursement_category_id = "<%=request.getParameter("disbursement_category_id")%>";
        var to_disbursement_category_id = $('#disbursement_category_id_tf').val();
        if (to_disbursement_category_id == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var officeid = "<%=request.getSession().getAttribute("E-Budget-OFFICEID")%>";
        var budget_total = $('#budget_total_tf').val();
        var change_budget = {
            change_budget_id: change_budget_id,
            from_disbursement_category_id: from_disbursement_category_id,
            to_disbursement_category_id: to_disbursement_category_id,
            officeid: officeid,
            change_budget_datetime:change_budget_datetime,
            budget_total: budget_total,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "ChangeBudgetServlet",
            data: {change_budget: change_budget},
            cache: false,
            success: function (data) {
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>');
                                }}}
                    });
                } else {
                    $.confirm({
                        title: '', content: '<b>' + data + '</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {

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