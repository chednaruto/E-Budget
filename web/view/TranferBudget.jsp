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
    String office_top = "";
    double tranfer_budget_total = 0;
    String tranfer_budget_datetime = "";
    if (acc.IsNullToEmtyString(request.getParameter("tranfer_budget_id")).isEmpty()) {
        tag = "เพิ่ม";
    } else {
        tag = "แก้ไข";
        String query = "SELECT tb.* FROM e_budget.tranfer_budget tb WHERE tb.tranfer_budget_id =" + request.getParameter("tranfer_budget_id");
        DB2Manager dbms = new DB2Manager();
        ResultSet rs = dbms.GetDataAsResultSet(query);
        if (rs.next()) {
            officeid = rs.getString("to_officeid");
            tranfer_budget_total = rs.getDouble("budget_total");
            tranfer_budget_datetime = acc.ChageDateFormat(rs.getString("tranfer_budget_datetime"), "yyyy-MM-dd hh:mm:ss", "dd-MM-yyyy hh:mm:ss");
            query = "SELECT * FROM e_budget.office WHERE officeid like '" + rs.getString("to_officeid").substring(0, 2) + "%' and office_level = '00'";
            rs = dbms.GetDataAsResultSet(query);
            if (rs.next()) {
                office_top = rs.getString("officeid");
            }
        }
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
                <li> <%=tag%>การโอนงบประมาณ </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <%
                    String budget_category_name = "";
                    String budget_type_name = "";
                    String disbursement_category_name = "";
                    DB2Manager dbms = new DB2Manager();
                    if (!acc.IsNullToEmtyString(request.getParameter("disbursement_category_id")).isEmpty()) {
                        String query = "select * from e_budget.disbursement_category dc "
                                + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                + "left join e_budget.budget_type bt ON bc .budget_type_id = bt.budget_type_id "
                                + "where dc.disbursement_category_id = " + acc.IsNullToEmtyString(request.getParameter("disbursement_category_id"));

                        ResultSet rs = dbms.GetDataAsResultSet(query);
                        rs.next();
                        budget_category_name = acc.IsNullToEmtyString(rs.getString("budget_category_name"));
                        budget_type_name = acc.IsNullToEmtyString(rs.getString("budget_type_name"));
                        disbursement_category_name = acc.IsNullToEmtyString(rs.getString("disbursement_category_name"));
                        rs.close();
                    }

                %>
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=tag%>การโอนงบประมาณ >> ประเภทงบประมาณ : <%=budget_type_name%> >> หมวดงบประมาณ : <%=budget_category_name%> >> หมวดรายจ่าย : <%=disbursement_category_name%> </small></h1>
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
                                                <span class="white"><%=tag%>การโอนงบประมาณ</span>
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
                                        <div class="profile-info-name" style="width:200px;"> หน่วยงานหลัก <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select form-control col-sm-12" id="office_top_tf" onchange="GetOffice(this.value)">
                                                        <option value="">  </option>
                                                        <%
                                                            String query = "select * from e_budget.office o where o.office_level = '00' AND o.officeid NOT IN('00000000')";
                                                            dbms = new DB2Manager();
                                                            ResultSet rs = dbms.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if (office_top.equals(rs.getString("officeid"))) {
                                                                    out.println("<option value='" + rs.getString("officeid") + "' SELECTED> " + rs.getString("officename") + " </option>");
                                                                } else {
                                                                    out.println("<option value='" + rs.getString("officeid") + "'> " + rs.getString("officename") + " </option>");
                                                                }
                                                            }
                                                            rs.close();
                                                            dbms.closeConnection();
                                                        %>
                                                    </select>                                              
                                                </span>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> หน่วยงานรับโอน <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select form-control col-sm-12" id="officeid_tf" >
                                                        <option value="">  </option>
                                                        <%
                                                            if (!officeid.isEmpty()) {
                                                                query = "SELECT * FROM e_budget.office WHERE officeid like '" + officeid.substring(0, 2) + "%'";
                                                                rs = dbms.GetDataAsResultSet(query);
                                                                while (rs.next()) {
                                                                    if (officeid.equals(rs.getString("officeid"))) {
                                                                        out.println("<option value='" + rs.getString("officeid") + "' SELECTED> " + rs.getString("officename") + " </option>");
                                                                    } else {
                                                                        out.println("<option value='" + rs.getString("officeid") + "'> " + rs.getString("officename") + " </option>");
                                                                    }

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
                                        <div class="profile-info-name" style="width:200px;"> วันที่โอนงบประมาณ <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <div class="input-group">
                                                    <input id="tranfer_budget_datetime_tf" type="text" class="form-control" value="<%=tranfer_budget_datetime%>"/>
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
                                                <input class="form-control active" type="text" onkeypress="validateNumber(event)" id="budget_total_tf" value="<%=acc.NumberFormat(tranfer_budget_total, "####.##")%>">                                              
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-10"></div>
                            <div class="col-xs-9 col-sm-9" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="Tranfered()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
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
            $('#tranfer_budget_datetime_tf').datetimepicker({
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
                $('#officeid_tf').trigger('chosen:updated');
            },
            error: function (err) {
            }
        });
    }
    function Tranfered() {
        var to_officeid = $('#officeid_tf').val();
        if (to_officeid == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var tranfer_budget_datetime = $('#tranfer_budget_datetime_tf').val();
        if (tranfer_budget_datetime == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            return false;
        }
        var disbursement_category_id = "<%=request.getParameter("disbursement_category_id")%>";
        var from_officeid = "<%=request.getSession().getAttribute("E-Budget-OFFICEID")%>";
        var budget_total = $('#budget_total_tf').val();
        var tranfer_budget = {
            to_officeid: to_officeid,
            tranfer_budget_id: "<%=acc.IsNullToEmtyString(request.getParameter("tranfer_budget_id")).isEmpty() ? 0 : request.getParameter("tranfer_budget_id")%>",
            disbursement_category_id: disbursement_category_id,
            from_officeid: from_officeid,
            budget_total: budget_total,
            tranfer_budget_datetime: tranfer_budget_datetime,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "TranferBudgetServlet",
            data: {tranfer_budget: tranfer_budget},
            cache: false,
            success: function (data) {
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=' + disbursement_category_id);
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