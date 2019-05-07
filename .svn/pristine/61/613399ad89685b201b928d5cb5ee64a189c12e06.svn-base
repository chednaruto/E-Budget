<%@page import="rd.ebudget.object.Budget.EBiddingPlan"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    EBiddingPlan eb = new EBiddingPlan();
    String query = "SELECT * FROM e_budget.e_bidding_plan WHERE project_id='" + request.getParameter("project_id") + "'";
    DB2Manager dbms = new DB2Manager();
    ResultSet rs = dbms.GetDataAsResultSet(query);
    if (rs.next()) {
        eb.setProject_id(request.getParameter("project_id"));
        eb.setDraf_tor_start(acc.ChageDateFormat(rs.getString("draf_tor_start"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setDraf_tor_end(acc.ChageDateFormat(rs.getString("draf_tor_end"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setApprove_tor_start(acc.ChageDateFormat(rs.getString("approve_tor_start"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setApprove_tor_end(acc.ChageDateFormat(rs.getString("approve_tor_end"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setContest_announcement_start(acc.ChageDateFormat(rs.getString("contest_announcement_start"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setContest_announcement_end(acc.ChageDateFormat(rs.getString("contest_announcement_end"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setOpen_envelope_start(acc.ChageDateFormat(rs.getString("open_envelope_start"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setOpen_envelope_end(acc.ChageDateFormat(rs.getString("open_envelope_end"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setApprove_start(acc.ChageDateFormat(rs.getString("approve_start"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setApprove_end(acc.ChageDateFormat(rs.getString("approve_end"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setSign_promise_start(acc.ChageDateFormat(rs.getString("sign_promise_start"), "dd-MM-yyyy", "yyyy-MM-dd"));
        eb.setSign_promise_end(acc.ChageDateFormat(rs.getString("sign_promise_end"), "dd-MM-yyyy", "yyyy-MM-dd"));
    } else {
        eb.setProject_id("");
        eb.setDraf_tor_start("");
        eb.setDraf_tor_end("");
        eb.setApprove_tor_start("");
        eb.setApprove_tor_end("");
        eb.setContest_announcement_start("");
        eb.setContest_announcement_end("");
        eb.setOpen_envelope_start("");
        eb.setOpen_envelope_end("");
        eb.setApprove_start("");
        eb.setApprove_end("");
        eb.setSign_promise_start("");
        eb.setSign_promise_end("");
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
                <li> บันทึก/แก้ไขแผนงานจัดซื้อจัดจ้าง </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> บันทึก/แก้ไขแผนงานจัดซื้อจัดจ้าง (e - bidding) </small></h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div>
                        <div id="user-profile-1" class="user-profile row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> จัดทำร่าง TOR <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('draf_tor_start_tf','draf_tor_end_tf','draf_tor_day_tf')" id="draf_tor_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getDraf_tor_start()%>">
                                                <span class="input-group-addon">
                                                    วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('draf_tor_start_tf','draf_tor_end_tf','draf_tor_day_tf')" id="draf_tor_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getDraf_tor_end()%>">
                                                <span class="input-group-addon">
                                                    จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="draf_tor_day_tf">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> อนุมัติร่างประกาศประกวด/ประกาศจัดซื้อจัดจ้าง <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('approve_tor_start_tf','approve_tor_end_tf','approve_tor_day_tf')" id="approve_tor_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getApprove_tor_start()%>">
                                                <span class="input-group-addon">
                                                    วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('approve_tor_start_tf','approve_tor_end_tf','approve_tor_day_tf')" id="approve_tor_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getApprove_tor_end()%>">
                                                <span class="input-group-addon">
                                                    จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="approve_tor_day_tf">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> ประกาศประกวด/ประกาศจัดซื้อจัดจ้าง <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('contest_announcement_start_tf','contest_announcement_end_tf','contest_announcement_day_tf')" id="contest_announcement_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getContest_announcement_start()%>">
                                                <span class="input-group-addon">
                                                    วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('contest_announcement_start_tf','contest_announcement_end_tf','contest_announcement_day_tf')" id="contest_announcement_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getContest_announcement_end()%>">
                                                <span class="input-group-addon">
                                                    จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="contest_announcement_day_tf">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> เปิดซองสอบราคา/e-market/e-bidding <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('open_envelope_start_tf','open_envelope_end_tf','open_envelope_day_tf')" id="open_envelope_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getOpen_envelope_start()%>">
                                                <span class="input-group-addon">
                                                    วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('open_envelope_start_tf','open_envelope_end_tf','open_envelope_day_tf')" id="open_envelope_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getOpen_envelope_end()%>">
                                                <span class="input-group-addon">
                                                    จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="open_envelope_day_tf">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> อนุมัติผลการจัดซื้อจัดจ้าง (รอลงนามสัญญา) <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('approve_start_tf','approve_end_tf','approve_day_tf')" id="approve_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getApprove_start()%>">
                                                <span class="input-group-addon">
                                                    วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('approve_start_tf','approve_end_tf','approve_day_tf')" id="approve_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getApprove_end()%>">
                                                <span class="input-group-addon">
                                                    จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="approve_day_tf">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> ลงนามในสัญญา <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('sign_promise_start_tf','sign_promise_end_tf','sign_promise_day_tf')" id="sign_promise_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getSign_promise_start()%>">
                                                <span class="input-group-addon">
                                                    วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('sign_promise_start_tf','sign_promise_end_tf','sign_promise_day_tf')" id="sign_promise_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=eb.getSign_promise_end()%>">
                                                <span class="input-group-addon">
                                                    จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="sign_promise_day_tf">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="space-10"></div>
                            <div class="col-xs-12 col-sm-12" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="SaveEBiddingPlan()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('ActiveProjectList')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
    function GetDay(startdate,enddate,day){
        var start_date = $('#'+startdate).val();
        var end_date = $('#'+enddate).val();
        $.ajax({
            type: "POST",
            url: "CalculateDateDiftServlet",
            data: {start_date: start_date,end_date:end_date},
            cache: false,
            success: function (data) {
               $("#"+day).val(data);
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });
        
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
    function SaveEBiddingPlan() {
        var project_id = "<%=request.getParameter("project_id")%>";
        var draf_tor_start = $('#draf_tor_start_tf').val();
        if (draf_tor_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var draf_tor_end = $('#draf_tor_end_tf').val();
        if (draf_tor_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var approve_tor_start = $('#approve_tor_start_tf').val();
        if (approve_tor_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var approve_tor_end = $('#approve_tor_end_tf').val();
        if (approve_tor_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var contest_announcement_start = $('#contest_announcement_start_tf').val();
        if (contest_announcement_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var contest_announcement_end = $('#contest_announcement_end_tf').val();
        if (contest_announcement_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var open_envelope_start = $('#open_envelope_start_tf').val();
        if (open_envelope_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var open_envelope_end = $('#open_envelope_end_tf').val();
        if (open_envelope_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var approve_start = $('#approve_start_tf').val();
        if (approve_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var approve_end = $('#approve_end_tf').val();
        if (approve_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var sign_promise_start = $('#sign_promise_start_tf').val();
        if (sign_promise_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var sign_promise_end = $('#sign_promise_end_tf').val();
        if (sign_promise_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var e_bidding_plan = {
            project_id: project_id,
            draf_tor_start: draf_tor_start,
            draf_tor_end: draf_tor_end,
            approve_tor_start: approve_tor_start,
            approve_tor_end: approve_tor_end,
            contest_announcement_start: contest_announcement_start,
            contest_announcement_end: contest_announcement_end,
            open_envelope_start: open_envelope_start,
            open_envelope_end: open_envelope_end,
            approve_start: approve_start,
            approve_end: approve_end,
            sign_promise_start: sign_promise_start,
            sign_promise_end: sign_promise_end,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "EBiddingPlanServlet",
            data: {e_bidding_plan: e_bidding_plan},
            cache: false,
            success: function (data) {
               waitingDialog.hide();
               if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    location.reload();
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