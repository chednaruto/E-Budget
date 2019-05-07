<%@page import="rd.ebudget.object.Budget.SelectionMethodResult"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    DB2Manager dbms = new DB2Manager();
    String query = "SELECT * FROM e_budget.selection_method_result WHERE project_id='" + request.getParameter("project_id") + "'";
    ResultSet rs = dbms.GetDataAsResultSet(query);
    SelectionMethodResult smr = new SelectionMethodResult();
    if (rs.next()) {
        smr.setInvitation_announcement_step1_date(acc.IsNullToEmtyString(rs.getString("invitation_announcement_step1_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("invitation_announcement_step1_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setInvitation_announcement_step2_date(acc.IsNullToEmtyString(rs.getString("invitation_announcement_step2_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("invitation_announcement_step2_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setInvitation_announcement_step3_date(acc.IsNullToEmtyString(rs.getString("invitation_announcement_step3_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("invitation_announcement_step3_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setInvitation_announcement_step4_startdate(acc.IsNullToEmtyString(rs.getString("invitation_announcement_step4_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("invitation_announcement_step4_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setInvitation_announcement_step4_enddate(acc.IsNullToEmtyString(rs.getString("invitation_announcement_step4_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("invitation_announcement_step4_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setBoard_review_step1_date(acc.IsNullToEmtyString(rs.getString("board_review_step1_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("board_review_step1_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setBoard_review_step2_startdate(acc.IsNullToEmtyString(rs.getString("board_review_step2_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("board_review_step2_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setBoard_review_step2_enddate(acc.IsNullToEmtyString(rs.getString("board_review_step2_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("board_review_step2_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setBoard_review_step3_date(acc.IsNullToEmtyString(rs.getString("board_review_step3_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("board_review_step3_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setApprove_step1_date(acc.IsNullToEmtyString(rs.getString("approve_step1_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step1_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setApprove_step2_date(acc.IsNullToEmtyString(rs.getString("approve_step2_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step2_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setApprove_step3_startdate(acc.IsNullToEmtyString(rs.getString("approve_step3_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step3_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setApprove_step3_enddate(acc.IsNullToEmtyString(rs.getString("approve_step3_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step3_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setApprove_step4_startdate(acc.IsNullToEmtyString(rs.getString("approve_step4_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step4_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setApprove_step4_enddate(acc.IsNullToEmtyString(rs.getString("approve_step4_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step4_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setSign_promise_date(acc.IsNullToEmtyString(rs.getString("sign_promise_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("sign_promise_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        smr.setPromise_number(acc.IsNullToEmtyString(rs.getString("promise_number")));
        smr.setPromise_name(acc.IsNullToEmtyString(rs.getString("promise_name")));
    } else {
        smr.setInvitation_announcement_step1_date("");
        smr.setInvitation_announcement_step2_date("");
        smr.setInvitation_announcement_step3_date("");
        smr.setInvitation_announcement_step4_startdate("");
        smr.setInvitation_announcement_step4_enddate("");
        smr.setBoard_review_step1_date("");
        smr.setBoard_review_step2_startdate("");
        smr.setBoard_review_step2_enddate("");
        smr.setBoard_review_step3_date("");
        smr.setApprove_step1_date("");
        smr.setApprove_step2_date("");
        smr.setApprove_step3_startdate("");
        smr.setApprove_step3_enddate("");
        smr.setApprove_step4_startdate("");
        smr.setApprove_step4_enddate("");
        smr.setSign_promise_date("");
        smr.setPromise_number("");
        smr.setPromise_name("");
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
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> บันทึก/แก้ไขแผนงานจัดซื้อจัดจ้าง (วิธีคัดเลือก) </small></h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div>
                        <div class="social-or-login center">
                            <span class="bigger-110"> ประกาศเชิญชวน </span>
                        </div>
                        <div class="space-10"></div>
                        <div id="user-profile-1" class="user-profile row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เสนอรายงานตามระเบียบ ฯ ข้อ 22 </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="invitation_announcement_step1_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getInvitation_announcement_step1_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:200px;"> กรมอนุมัติ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="invitation_announcement_step2_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getInvitation_announcement_step2_date()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> ส่งคำสั่งแต่งตั้งคณะกรรมการซื้อหรือจ้างโดยวิธีคัดเลือก </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="invitation_announcement_step3_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getInvitation_announcement_step3_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> คณะกรรมการ ฯ มีหนีงสือเชิญชวนผู้เสนอราคา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="invitation_announcement_step4_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getInvitation_announcement_step4_startdate()%>">
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="invitation_announcement_step4_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getInvitation_announcement_step4_enddate()%>">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> คณะกรรมการพิจารณา </span>
                                </div>
                                <div class="space-10"></div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> ผู้เสนอราคายื่นเอกสารเสนอราคา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="board_review_step1_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getBoard_review_step1_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> คณะกรรมการ ฯ พิจารณาผลการเสนอราคา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="board_review_step2_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getBoard_review_step2_startdate()%>">
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="board_review_step2_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getBoard_review_step2_enddate()%>">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เสนอกรม ฯ ให้ความเห็นชอบ อนุมัติ ลงนามประกาศผู้ชนะ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="board_review_step3_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getBoard_review_step3_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> อนุมัติผลการจัดซื้อจัดจ้าง (รอลงนามสัญญา) </span>
                                </div>
                                <div class="space-10"></div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> กรม ฯ ให้ความเห็นชอบ อนุมัติ ลงนามประกาศผู้ชนะ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step1_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getApprove_step1_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> ประกาศผู้ชนะ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step2_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getApprove_step2_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> รออุทธรณ์ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step3_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getApprove_step3_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step3_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getApprove_step3_enddate()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เปิดทำสัญญาภายใน </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step4_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getApprove_step4_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step4_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getApprove_step4_enddate()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-12">    
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> ลงนามสัญญา </span>
                                </div>
                                <div class="space-10"></div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> ลงนามสัญญา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="sign_promise_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=smr.getSign_promise_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เลขที่สัญญา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-8">
                                                <input class="form-control col-sm-12" id="promise_number_tf" type="text" value="<%=smr.getPromise_number()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> ชื่อคู่สัญญา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <input class="form-control col-sm-12" id="promise_name_tf" type="text" value="<%=smr.getPromise_name()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="space-10"></div>
                            <div class="col-xs-12 col-sm-12" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="SaveSelecteionMethodResult()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('MofStrategic')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
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
    function SaveSelecteionMethodResult() {
        var project_id = "<%=request.getParameter("project_id")%>";
        var invitation_announcement_step1_date = $('#invitation_announcement_step1_date_tf').val();
        var invitation_announcement_step2_date = $('#invitation_announcement_step2_date_tf').val();
        var invitation_announcement_step3_date = $('#invitation_announcement_step3_date_tf').val();
        var invitation_announcement_step4_startdate = $('#invitation_announcement_step4_startdate_tf').val();
        var invitation_announcement_step4_enddate = $('#invitation_announcement_step4_enddate_tf').val();
        var board_review_step1_date = $('#board_review_step1_date_tf').val();
        var board_review_step2_startdate = $('#board_review_step2_startdate_tf').val();
        var board_review_step2_enddate = $('#board_review_step2_enddate_tf').val();
        var board_review_step3_date = $('#board_review_step3_date_tf').val();
        var approve_step1_date = $('#approve_step1_date_tf').val();
        var approve_step2_date = $('#approve_step2_date_tf').val();
        var approve_step3_startdate = $('#approve_step3_startdate_tf').val();
        var approve_step3_enddate = $('#approve_step3_enddate_tf').val();
        var approve_step4_startdate = $('#approve_step4_startdate_tf').val();
        var approve_step4_enddate = $('#approve_step4_enddate_tf').val();
        var sign_promise_date = $('#sign_promise_date_tf').val();
        var promise_number = $('#promise_number_tf').val();
         var promise_name = $('#promise_name_tf').val();
        var slmr = {
            project_id: project_id,
            invitation_announcement_step1_date: invitation_announcement_step1_date,
            invitation_announcement_step2_date: invitation_announcement_step2_date,
            invitation_announcement_step3_date: invitation_announcement_step3_date,
            invitation_announcement_step4_startdate: invitation_announcement_step4_startdate,
            invitation_announcement_step4_enddate: invitation_announcement_step4_enddate,
            board_review_step1_date: board_review_step1_date,
            board_review_step2_startdate: board_review_step2_startdate,
            board_review_step2_enddate: board_review_step2_enddate,
            board_review_step3_date: board_review_step3_date,
            approve_step1_date: approve_step1_date,
            approve_step2_date: approve_step2_date,
            approve_step3_startdate: approve_step3_startdate,
            approve_step3_enddate: approve_step3_enddate,
            approve_step4_startdate: approve_step4_startdate,
            approve_step4_enddate: approve_step4_enddate,
            sign_promise_date: sign_promise_date,
            promise_number: promise_number,
            promise_name: promise_name,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "SelectionMethodResultServlet",
            data: {slmr: slmr},
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