<%@page import="rd.ebudget.object.Budget.SpecificMethodPlan"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    String query = "SELECT * FROM e_budget.specific_method_plan WHERE project_id='" + request.getParameter("project_id") + "'";
    System.out.println(query);
    DB2Manager dbms = new DB2Manager();
    ResultSet rs = dbms.GetDataAsResultSet(query);
    SpecificMethodPlan sp = new SpecificMethodPlan();
    if (rs.next()) {
        sp.setProject_id(rs.getString("project_id"));
        sp.setInvitation_announcement_start(acc.ChageDateFormat(rs.getString("invitation_announcement_start"), "yyyy-MM-dd", "dd-MM-yyyy"));
        sp.setInvitation_announcement_end(acc.ChageDateFormat(rs.getString("invitation_announcement_end"), "yyyy-MM-dd", "dd-MM-yyyy"));
        sp.setBoard_review_start(acc.ChageDateFormat(rs.getString("board_review_start"), "yyyy-MM-dd", "dd-MM-yyyy"));
        sp.setBoard_review_end(acc.ChageDateFormat(rs.getString("board_review_end"), "yyyy-MM-dd", "dd-MM-yyyy"));
        sp.setApprove_start(acc.ChageDateFormat(rs.getString("approve_start"), "yyyy-MM-dd", "dd-MM-yyyy"));
        sp.setApprove_end(acc.ChageDateFormat(rs.getString("approve_end"), "yyyy-MM-dd", "dd-MM-yyyy"));
        sp.setSign_promise_start(acc.ChageDateFormat(rs.getString("sign_promise_start"), "yyyy-MM-dd", "dd-MM-yyyy"));
        sp.setSign_promise_end(acc.ChageDateFormat(rs.getString("sign_promise_end"), "yyyy-MM-dd", "dd-MM-yyyy"));
    } else {
        sp.setProject_id("");
        sp.setInvitation_announcement_start("");
        sp.setInvitation_announcement_end("");
        sp.setBoard_review_start("");
        sp.setBoard_review_end("");
        sp.setApprove_start("");
        sp.setApprove_end("");
        sp.setSign_promise_start("");
        sp.setSign_promise_end("");
    }
    rs.close();
    dbms.closeConnection();
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
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> บันทึก/แก้ไขแผนงานจัดซื้อจัดจ้าง (วิธีเฉพาะเจาะจง) </small></h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div>
                        <div id="user-profile-1" class="user-profile row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> ประกาศเชิญชวน <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                   วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('invitation_announcement_start_tf','invitation_announcement_end_tf','invitation_announcement_day_tf')" id="invitation_announcement_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getInvitation_announcement_start() %>">
                                                <span class="input-group-addon">
                                                   วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('invitation_announcement_start_tf','invitation_announcement_end_tf','invitation_announcement_day_tf')" id="invitation_announcement_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getInvitation_announcement_end() %>">
                                                <span class="input-group-addon">
                                                   จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="invitation_announcement_day_tf">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:300px;"> คณะกรรมการพิจารณา <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                   วันที่เริ่มต้น <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('board_review_start_tf','board_review_end_tf','board_review_day_tf')" id="board_review_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getBoard_review_start()%>">
                                                <span class="input-group-addon">
                                                   วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('board_review_start_tf','board_review_end_tf','board_review_day_tf')" id="board_review_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getBoard_review_end()%>">
                                                <span class="input-group-addon">
                                                   จำนวนวัน 
                                                </span>
                                                <input class="form-control center" type="text" id="board_review_day_tf">
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
                                                <input class="form-control active date-picker center" onchange="GetDay('approve_start_tf','approve_end_tf','approve_day_tf')" id="approve_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getApprove_start()%>">
                                                <span class="input-group-addon">
                                                   วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('approve_start_tf','approve_end_tf','approve_day_tf')" id="approve_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getApprove_end()%>">
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
                                                <input class="form-control active date-picker center" onchange="GetDay('sign_promise_start_tf','sign_promise_end_tf','sign_promise_day_tf')" id="sign_promise_start_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getSign_promise_start()%>">
                                                <span class="input-group-addon">
                                                   วันที่สิ้นสุด <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" onchange="GetDay('sign_promise_start_tf','sign_promise_end_tf','sign_promise_day_tf')" id="sign_promise_end_tf" type="text" data-date-format="dd-mm-yyyy" value="<%=sp.getSign_promise_end()%>">
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
                                    <button class="btn btn-success btn-white" onclick="SaveSpecificMethod()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
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
    function SaveSpecificMethod() {
        var project_id = '<%=request.getParameter("project_id")%>';
        var invitation_announcement_start = $('#invitation_announcement_start_tf').val();
        if (invitation_announcement_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var invitation_announcement_end = $('#invitation_announcement_end_tf').val();
        if (invitation_announcement_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var board_review_start = $('#board_review_start_tf').val();
        if (board_review_start.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var board_review_end = $('#board_review_end_tf').val();
        if (board_review_end.trim() == "") {
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
        var sign_promise_end = $("#sign_promise_end_tf").val();
        if (sign_promise_end.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var selection_method_plan = {
            project_id: project_id,
            invitation_announcement_start: invitation_announcement_start,
            invitation_announcement_end: invitation_announcement_end,
            board_review_start: board_review_start,
            board_review_end: board_review_end,
            approve_start: approve_start,
            approve_end: approve_end,
            sign_promise_start: sign_promise_start,
            sign_promise_end: sign_promise_end,
            METHOD: "INSERT"
        };
        
        $.ajax({
            type: "POST",
            url: "SpecificMethodPlanServlet",
            data: {selection_method_plan: selection_method_plan},
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