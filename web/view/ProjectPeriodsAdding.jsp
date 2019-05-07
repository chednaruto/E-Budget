<%@page import="rd.ebudget.object.Budget.TermOfPaymentPlan"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    String project_id = acc.IsNullToEmtyString(request.getParameter("project_id"));
    TermOfPaymentPlan tp = new TermOfPaymentPlan();
    if (acc.IsNullToEmtyString(request.getParameter("term_of_payment_plan_id")).isEmpty()) {
        tag = "เพิ่ม";
        tp.setProject_id(project_id);
        tp.setTerm_of_payment_plan_id(0);
        tp.setTerm_of_payment_plan_deliver_date("");
        tp.setTerm_of_payment_plan_check_date("");
        tp.setTerm_of_payment_plan_approve_payment_date("");
        tp.setTerm_of_payment_plan_payment_date("");
        tp.setTerm_of_payment_plan_budget(0.00);
    } else {
        String query = "SELECT * FROM e_budget.term_of_payment_plan WHERE project_id='" + request.getParameter("project_id") + "' AND term_of_payment_plan_id=" + request.getParameter("term_of_payment_plan_id");
        DB2Manager dbms = new DB2Manager();
        ResultSet rs = dbms.GetDataAsResultSet(query);
        if (rs.next()) {
            tp.setProject_id(project_id);
            tp.setTerm_of_payment_plan_id(Integer.parseInt(request.getParameter("term_of_payment_plan_id")));
            tp.setTerm_of_payment_plan_deliver_date(rs.getString("term_of_payment_plan_deliver_date"));
            tp.setTerm_of_payment_plan_check_date(rs.getString("term_of_payment_plan_check_date"));
            tp.setTerm_of_payment_plan_approve_payment_date(rs.getString("term_of_payment_plan_approve_payment_date"));
            tp.setTerm_of_payment_plan_payment_date(rs.getString("term_of_payment_plan_payment_date"));
            tp.setTerm_of_payment_plan_budget(rs.getDouble("term_of_payment_plan_budget"));
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
                <li> <a href="index.jsp?service=ProjectPeriodsList&project_id=<%=project_id%>"> สัญญาและงวดงาน </a></li>
                <li> <%=tag%>แผนสัญญาและงวดงาน </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <%
                    String query = "SELECT * FROM e_budget.project WHERE project_id='" + project_id + "'";
                    DB2Manager dbms = new DB2Manager();
                    ResultSet rs = dbms.GetDataAsResultSet(query);
                    String project_name = "";
                    if (rs.next()) {
                        project_name = rs.getString("project_name");
                    }
                %>
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=tag%>แผนสัญญาและงวดงาน >> <%=project_name%>  </small></h1>
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
                                                <span class="white"><%=tag%>แผนสัญญาและงวดงาน</span>
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
                                        <div class="profile-info-name" style="width:200px;"> งวดที่ <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <span>
                                                    <select class="chosen-select col-sm-6" id="term_of_payment_plan_id_tf">
                                                        <%
                                                            if(tp.getTerm_of_payment_plan_id()==0){
                                                                query = "SELECT t.* FROM e_budget.term_of_payment t LEFT JOIN e_budget.term_of_payment_plan tp ON t.term_of_payment_id = tp.term_of_payment_plan_id AND tp.project_id='"+project_id+"' WHERE tp.term_of_payment_plan_id IS NULL  ORDER BY term_of_payment_id ASC";
                                                            }else{
                                                                query = "SELECT t.* FROM e_budget.term_of_payment t LEFT JOIN e_budget.term_of_payment_plan tp ON t.term_of_payment_id = tp.term_of_payment_plan_id AND tp.project_id='"+project_id+"' WHERE tp.term_of_payment_plan_id IS NULL OR term_of_payment_id IN("+tp.getTerm_of_payment_plan_id()+")  ORDER BY term_of_payment_id ASC";
                                                            }
                                                            rs = dbms.GetDataAsResultSet(query);
                                                            while(rs.next()){
                                                                out.print("<option value='"+rs.getInt("term_of_payment_id")+"' "+(tp.getTerm_of_payment_plan_id() == rs.getInt("term_of_payment_id") ? "selected" : "")+"> "+rs.getString("term_of_payment_name")+" </option>");
                                                            }
                                                            rs.close();
                                                        %>
                                                    </select>                                              
                                                </span>                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> วันที่ส่งมอบ (แผน) <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="term_of_payment_plan_deliver_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.ChageDateFormat(tp.getTerm_of_payment_plan_deliver_date(), "yyyy-MM-dd", "dd-MM-yyyy")%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> วันที่ตรวจรับ (แผน) <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="term_of_payment_plan_check_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.ChageDateFormat(tp.getTerm_of_payment_plan_check_date(), "yyyy-MM-dd", "dd-MM-yyyy")%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> วันที่อนุมัติจ่ายเงิน (แผน) <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="term_of_payment_plan_approve_payment_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.ChageDateFormat(tp.getTerm_of_payment_plan_approve_payment_date(), "yyyy-MM-dd", "dd-MM-yyyy")%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> วันที่จ่ายเงิน (แผน) <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="term_of_payment_plan_payment_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.ChageDateFormat(tp.getTerm_of_payment_plan_payment_date(), "yyyy-MM-dd", "dd-MM-yyyy")%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> จำนวนเงิน (บาท) <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <input class="form-control active" type="text" id="term_of_payment_plan_budget_tf"  style="width: 338px;" value="<%=tp.getTerm_of_payment_plan_budget()%>" >                                              
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="space-10"></div>
                            <div class="col-xs-9 col-sm-9" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="SaveTermOfPaymentPlan()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('MofStrategic')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
                                </div>
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
    function SaveTermOfPaymentPlan() {
        waitingDialog.show();
        var project_id = "<%=request.getParameter("project_id")%>";
        var term_of_payment_plan_id = $('#term_of_payment_plan_id_tf').val();
        if (term_of_payment_plan_id.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var term_of_payment_plan_deliver_date = $('#term_of_payment_plan_deliver_date_tf').val();
        if (term_of_payment_plan_deliver_date.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var term_of_payment_plan_budget = $('#term_of_payment_plan_budget_tf').val();
        if (term_of_payment_plan_budget.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var term_of_payment_plan_check_date = $('#term_of_payment_plan_check_date_tf').val();
        if (term_of_payment_plan_check_date.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var term_of_payment_plan_approve_payment_date = $('#term_of_payment_plan_approve_payment_date_tf').val();
        if (term_of_payment_plan_approve_payment_date.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var term_of_payment_plan_payment_date = $('#term_of_payment_plan_payment_date_tf').val();
        if (term_of_payment_plan_payment_date.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }


        var term_of_payment_plan = {
            project_id: project_id,
            term_of_payment_plan_id: term_of_payment_plan_id,
            term_of_payment_plan_deliver_date: term_of_payment_plan_deliver_date,
            term_of_payment_plan_budget: term_of_payment_plan_budget,
            term_of_payment_plan_check_date: term_of_payment_plan_check_date,
            term_of_payment_plan_approve_payment_date: term_of_payment_plan_approve_payment_date,
            term_of_payment_plan_payment_date: term_of_payment_plan_payment_date,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "TermOfPaymentPlanServlet",
            data: {term_of_payment_plan: term_of_payment_plan},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto("ProjectPeriodsList&project_id=" + project_id)
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