<%@page import="rd.ebudget.object.Budget.TermOfPaymentResult"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    String tag = "";
    String disbursement_category_id = acc.IsNullToEmtyString(request.getParameter("disbursement_category_id"));
    String disbursement_id = "";
    String payment_budget_datetime = "";
    double payment_budget_total = 0;

    if (acc.IsNullToEmtyString(request.getParameter("payment_budget_id")).isEmpty()) {
        tag = "เพิ่ม";

    } else {
        tag = "แก้ไข";
        String query = "select disbursement_id,payment_budget_datetime,payment_budget_total from e_budget.payment_budget WHERE payment_budget_id="+request.getParameter("payment_budget_id");
        DB2Manager dbms = new DB2Manager();
        ResultSet rs = dbms.GetDataAsResultSet(query);
        if(rs.next()){
            disbursement_id = rs.getString("disbursement_id");
            payment_budget_datetime = acc.ChageDateFormat(rs.getString("payment_budget_datetime"),"yyyy-MM-dd hh:mm:ss","dd-MM-yyyy hh:mm:ss");
            payment_budget_total = rs.getDouble("payment_budget_total");
        }
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
                <li><i class="ace-icon fa fa-home home-icon"></i><a href="#"> หน้าหลัก </a></li>
                <li><a href="index.jsp?service=BudgetAllocate"> รายการงบประมาณ </a></li>
                <li><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>"> รายการจัดสรรงบประมาณ </a></li>
                <li><%=tag%>เบิกจ่ายงบประมาณ </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <%
                    
                    String budget_category_name = "";
                    String budget_type_name = "";
                    String disbursement_category_name = "";
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
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> <%=tag%>เเบิกจ่ายงบประมาณ >> ประเภทงบประมาณ : <%=budget_type_name%> >> หมวดงบประมาณ : <%=budget_category_name%> >> หมวดรายจ่าย : <%=disbursement_category_name%> </small></h1>
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
                                                <span class="white"><%=tag%>รายการเบิกจ่ายงบประมาณ</span>
                                            </b>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-6"></div>
                                <div class="hr hr16 dotted"></div>
                            </div>
                            <div class="col-xs-12 col-sm-9">
                                <div class="space-12"></div>

                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> วันที่เบิกจ่าย <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <div class="input-group">
                                                    <input id="payment_budget_datetime_tf" type="text" class="form-control" value="<%=payment_budget_datetime%>"/>
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-clock-o bigger-110"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> รายจ่าย <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span>
                                                    <select class="chosen-select col-sm-6" id="disbursement_id_tf">
                                                        <%
                                                            String query = "SELECT * FROM e_budget.disbursement WHERE disbursement_status = 'Y' AND disbursement_category_id = "+request.getParameter("disbursement_category_id") ;
                                                            DB2Manager dbms = new DB2Manager();
                                                            ResultSet rs = dbms.GetDataAsResultSet(query);
                                                            while (rs.next()) {
                                                                if(rs.getString("disbursement_id").equals(disbursement_id)){
                                                                    out.print("<option value='" + rs.getInt("disbursement_id") + "' selected> " + rs.getString("disbursement_name") + " </option>");
                                                                }else{
                                                                    out.print("<option value='" + rs.getInt("disbursement_id") + "'> " + rs.getString("disbursement_name") + " </option>");
                                                                }
                                                            }
                                                            rs.close();
                                                            dbms.closeConnection();
                                                        %>
                                                    </select>                                              
                                                </span>  
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> จำนวนเงิน (บาท) <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <input class="form-control active" type="text" onkeypress="validateNumber(event)" id="payment_budget_total_tf"  style="width: 338px;" value="<%=acc.NumberFormat(payment_budget_total,"####.##")%>">                                              
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="space-10"></div>
                            <div class="col-xs-9 col-sm-9" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="SavePaymentBudget()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
        if (!ace.vars['old_ie'])
            $('#payment_budget_datetime_tf').datetimepicker({
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
    function SavePaymentBudget() {
        waitingDialog.show();
        var payment_budget_id = "<%=acc.IsNullToEmtyString(request.getParameter("payment_budget_id"))%>";
        var disbursement_category_id = "<%=acc.IsNullToEmtyString(request.getParameter("disbursement_category_id"))%>";
        var payment_budget_datetime = $('#payment_budget_datetime_tf').val();
        if (payment_budget_datetime.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var officeid = "<%=session.getAttribute("E-Budget-OFFICEID")%>";
        var payment_budget_total = $('#payment_budget_total_tf').val();
        if (payment_budget_total.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var disbursement_id = $("#disbursement_id_tf").val();
        if (disbursement_id.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var payment_budget = {
            payment_budget_id: payment_budget_id,
            disbursement_category_id: disbursement_category_id,
            payment_budget_datetime: payment_budget_datetime,
            officeid: officeid,
            payment_budget_total: payment_budget_total,
            disbursement_id: disbursement_id,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "PaymentBudgetServlet",
            data: {payment_budget: payment_budget},
            cache: false,
            success: function (data) {
                waitingDialog.hide();
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto("BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>");
                                }}}
                    });
                }else{
                    $.confirm({
                        title: '', content: '<b>'+data+'</b>', animation: 'news', closeAnimation: 'news',
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