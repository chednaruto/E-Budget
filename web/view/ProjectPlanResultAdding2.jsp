<%@page import="rd.ebudget.object.Budget.EBiddingResult"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    EBiddingResult ebs = new EBiddingResult();
    String project_id = request.getParameter("project_id");
    String query = "SELECT * FROM e_budget.e_bidding_result where project_id= '" + project_id + "'";
    DB2Manager dbms = new DB2Manager();
    ResultSet rs = dbms.GetDataAsResultSet(query);

    if (rs.next()) {
        ebs.setProject_id(project_id);
        ebs.setDraf_tor_step1_date(acc.IsNullToEmtyString(rs.getString("draf_tor_step1_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("draf_tor_step1_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setDraf_tor_step2_date(acc.IsNullToEmtyString(rs.getString("draf_tor_step2_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("draf_tor_step2_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setDraf_tor_step3_date(acc.IsNullToEmtyString(rs.getString("draf_tor_step3_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("draf_tor_step3_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_tor_step1_date(acc.IsNullToEmtyString(rs.getString("approve_tor_step1_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_tor_step1_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_tor_step2_date(acc.IsNullToEmtyString(rs.getString("approve_tor_step2_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_tor_step2_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setContest_announcement_step1_startdate(acc.IsNullToEmtyString(rs.getString("contest_announcement_step1_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("contest_announcement_step1_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setContest_announcement_step1_enddate(acc.IsNullToEmtyString(rs.getString("contest_announcement_step1_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("contest_announcement_step1_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setOpen_envelope_step1_date(acc.IsNullToEmtyString(rs.getString("open_envelope_step1_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("open_envelope_step1_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setOpen_envelope_step2_startdate(acc.IsNullToEmtyString(rs.getString("open_envelope_step2_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("open_envelope_step2_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setOpen_envelope_step2_enddate(acc.IsNullToEmtyString(rs.getString("open_envelope_step2_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("open_envelope_step2_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step1_startdate(acc.IsNullToEmtyString(rs.getString("approve_step1_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step1_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step1_enddate(acc.IsNullToEmtyString(rs.getString("approve_step1_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step1_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step2_startdate(acc.IsNullToEmtyString(rs.getString("approve_step2_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step2_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step2_enddate(acc.IsNullToEmtyString(rs.getString("approve_step2_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step2_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step3_date(acc.IsNullToEmtyString(rs.getString("approve_step3_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step3_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step4_startdate(acc.IsNullToEmtyString(rs.getString("approve_step4_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step4_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step4_enddate(acc.IsNullToEmtyString(rs.getString("approve_step4_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step4_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step5_startdate(acc.IsNullToEmtyString(rs.getString("approve_step5_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step5_startdate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setApprove_step5_enddate(acc.IsNullToEmtyString(rs.getString("approve_step5_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("approve_step5_enddate"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setSign_promise_date(acc.IsNullToEmtyString(rs.getString("sign_promise_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("sign_promise_date"), "yyyy-MM-dd", "dd-MM-yyyy"));
        ebs.setPromise_number(acc.IsNullToEmtyString(rs.getString("promise_number")));
        ebs.setPromise_name(acc.IsNullToEmtyString(rs.getString("promise_name")));
    } else {
        ebs.setProject_id(project_id);
        ebs.setDraf_tor_step1_date("");
        ebs.setDraf_tor_step2_date("");
        ebs.setDraf_tor_step3_date("");
        ebs.setApprove_tor_step1_date("");
        ebs.setApprove_tor_step2_date("");
        ebs.setContest_announcement_step1_startdate("");
        ebs.setContest_announcement_step1_enddate("");
        ebs.setOpen_envelope_step2_startdate("");
        ebs.setOpen_envelope_step2_enddate("");
        ebs.setApprove_step1_enddate("");
        ebs.setApprove_step2_startdate("");
        ebs.setApprove_step2_enddate("");
        ebs.setApprove_step3_date("");
        ebs.setApprove_step4_startdate("");
        ebs.setApprove_step4_enddate("");
        ebs.setApprove_step5_startdate("");
        ebs.setApprove_step5_enddate("");
        ebs.setSign_promise_date("");
        ebs.setPromise_number("");
        ebs.setPromise_name("");
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
                        <div class="social-or-login center">
                            <span class="bigger-110"> จัดทำร่าง TOR </span>
                        </div>
                        <div class="space-10"></div>
                        <div id="user-profile-1" class="user-profile row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> แต่งตั้งคณะกรรมการจัดทำรายละเอียดคุณลักษณะเฉพาะ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="draf_tor_step1_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getDraf_tor_step1_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:200px;"> คณะกรรมการส่งคืนเอกสาร </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="draf_tor_step2_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getDraf_tor_step2_date()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เสนอรายงานตามระเบียบ ฯ ข้อ 22 </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="draf_tor_step3_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getDraf_tor_step3_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:200px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="page-header">
                                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ประกาศร่าง TOR </small></h1>
                                </div>
                                <div id="tor_loop">

                                    <%
                                        query = "SELECT COUNT(*) as cc FROM e_budget.e_bidding_result_tor_loop WHERE project_id='" + request.getParameter("project_id") + "'";
                                        rs = dbms.GetDataAsResultSet(query);
                                        rs.next();
                                        if (rs.getInt("cc") > 0) {
                                            query = "SELECT * FROM e_budget.e_bidding_result_tor_loop WHERE project_id='" + request.getParameter("project_id") + "' ORDER BY e_bidding_result_tor_loop_id ASC";
                                            rs = dbms.GetDataAsResultSet(query);
                                            while (rs.next()) {
                                    %>
                                    <div id="tor_loop_sub<%=rs.getString("e_bidding_result_tor_loop_id")%>">
                                        <div class="profile-user-info profile-user-info-striped" style="margin-top:10px;">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name" style="width:350px;"> ลงประกาศร่าง (ครั้งที่ <%=rs.getString("e_bidding_result_tor_loop_id")%>) </div>
                                                <div class="profile-info-value col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <i class="ace-icon fa fa-calendar">  </i>
                                                        </span>
                                                        <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step1_startdate_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step1_startdate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("e_bidding_result_tor_loop_step1_startdate"), "yyyy-MM-dd", "dd-MM-yyyy")%>"> 
                                                        <span class="input-group-addon"> ถึง
                                                            <i class="ace-icon fa fa-calendar">  </i>
                                                        </span>
                                                        <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step1_enddate_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step1_enddate")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("e_bidding_result_tor_loop_step1_enddate"), "yyyy-MM-dd", "dd-MM-yyyy")%>">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-user-info profile-user-info-striped">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name" style="width:350px;"> รายละเอียดวิจารณ์ </div>
                                                <div class="profile-info-value col-sm-12">
                                                    <div class="input-group col-sm-12">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input name="e_bidding_result_tor_loop_step2_status_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="radio" class="ace" value="N" onchange="dispayStatus(<%=rs.getString("e_bidding_result_tor_loop_id")%>)" <% if (rs.getString("e_bidding_result_tor_loop_step2_status").equals("N")) {
                                                                        out.print("checked");
                                                                    }%>>
                                                                <span class="lbl"> ไม่มีผู้วิจารณ์ </span>
                                                            </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input name="e_bidding_result_tor_loop_step2_status_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="radio" class="ace" value="Y" onchange="dispayStatus(<%=rs.getString("e_bidding_result_tor_loop_id")%>)" <% if (rs.getString("e_bidding_result_tor_loop_step2_status").equals("Y")) {
                                                                        out.print("checked");
                                                                    }%>>
                                                                <span class="lbl"> มีผู้วิจารณ์ </span>
                                                            </label>
                                                        </div>
                                                               <input class="form-control" id="e_bidding_result_tor_loop_step2_desc_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="text" <% if (rs.getString("e_bidding_result_tor_loop_step2_status").equals("N")) {
                                                                out.print("style='display: none;'");
                                                            }%> placeholder="---------รายละเอียด---------" value="<%=rs.getString("e_bidding_result_tor_loop_step2_desc")%>">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div id="status<%=rs.getString("e_bidding_result_tor_loop_id")%>" <% if (rs.getString("e_bidding_result_tor_loop_step2_status").equals("N")) {
                                                out.print("style='display: none;'");
                                            }%>>
                                            <div class="profile-user-info profile-user-info-striped" >
                                                <div class="profile-info-row">
                                                    <div class="profile-info-name" style="width:350px;"> ส่งรายละเอียดให้คณะกรรมการ ฯ </div>
                                                    <div class="profile-info-value col-sm-12">
                                                        <div class="input-group col-sm-12">
                                                            <span class="input-group-addon">
                                                                <i class="ace-icon fa fa-calendar">  </i>
                                                            </span>
                                                            <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step3_date_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step3_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("e_bidding_result_tor_loop_step3_date"), "yyyy-MM-dd", "dd-MM-yyyy")%>">
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
                                                    <div class="profile-info-name" style="width:350px;"> คณะกรรมการ ฯ รายงานผลการวิจารณ์ </div>
                                                    <div class="profile-info-value col-sm-12">
                                                        <div class="input-group col-sm-12">
                                                            <span class="input-group-addon">
                                                                <i class="ace-icon fa fa-calendar">  </i>
                                                            </span>
                                                            <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step4_date_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step4_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("e_bidding_result_tor_loop_step4_date"), "yyyy-MM-dd", "dd-MM-yyyy")%>">
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
                                                    <div class="profile-info-name" style="width:350px;"> เสนอปรับปรุงร่าง </div>
                                                    <div class="profile-info-value col-sm-12">
                                                        <div class="input-group col-sm-12">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input name="e_bidding_result_tor_loop_step5_status_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="radio" class="ace" value="N" onchange="dispayStep5Date(<%=rs.getString("e_bidding_result_tor_loop_id")%>)" <% if (rs.getString("e_bidding_result_tor_loop_step5_status").equals("N")) {
                                                                            out.print("checked");
                                                                        }%>>
                                                                    <span class="lbl"> เสนอยืน </span>
                                                                </label>
                                                            </div>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input name="e_bidding_result_tor_loop_step5_status_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="radio" class="ace" value="Y" onchange="dispayStep5Date(<%=rs.getString("e_bidding_result_tor_loop_id")%>)" <% if (rs.getString("e_bidding_result_tor_loop_step5_status").equals("Y")) {
                                                                            out.print("checked");
                                                                        }%>>
                                                                    <span class="lbl"> เสนอปรับปรุงร่าง </span>
                                                                </label>
                                                            </div>
                                                            <div class="input-group col-sm-12" id="step5<%=rs.getString("e_bidding_result_tor_loop_id")%>" <% if (rs.getString("e_bidding_result_tor_loop_step5_status").equals("N")) {
                                                                    out.print("style='display: none;'");
                                                                }%>>
                                                                <span class="input-group-addon">
                                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                                </span>
                                                                <input placeholder="---------วันที่เสนอปรับปรุงร่าง---------" class="form-control active date-picker center" id="e_bidding_result_tor_loop_step5_date_tf<%=rs.getString("e_bidding_result_tor_loop_id")%>" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=acc.IsNullToEmtyString(rs.getString("e_bidding_result_tor_loop_step5_date")).isEmpty() ? "" : acc.ChageDateFormat(rs.getString("e_bidding_result_tor_loop_step5_date"), "yyyy-MM-dd", "dd-MM-yyyy")%>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                                    <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                                        <div class="input-group col-sm-12">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%

                                        }

                                    } else {
                                    %>
                                    <div id="tor_loop_sub1">
                                        <div class="profile-user-info profile-user-info-striped" style="margin-top:10px;">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name" style="width:350px;"> ลงประกาศร่าง (ครั้งที่ 1) </div>
                                                <div class="profile-info-value col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <i class="ace-icon fa fa-calendar">  </i>
                                                        </span>
                                                        <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step1_startdate_tf1" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;"> 
                                                        <span class="input-group-addon"> ถึง
                                                            <i class="ace-icon fa fa-calendar">  </i>
                                                        </span>
                                                        <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step1_enddate_tf1" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-user-info profile-user-info-striped">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name" style="width:350px;"> รายละเอียดวิจารณ์ </div>
                                                <div class="profile-info-value col-sm-12">
                                                    <div class="input-group col-sm-12">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input name="e_bidding_result_tor_loop_step2_status_tf1" type="radio" class="ace" value="N" onchange="dispayStatus(1)" checked>
                                                                <span class="lbl"> ไม่มีผู้วิจารณ์ </span>
                                                            </label>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input name="e_bidding_result_tor_loop_step2_status_tf1" type="radio" class="ace" value="Y" onchange="dispayStatus(1)">
                                                                <span class="lbl"> มีผู้วิจารณ์ </span>
                                                            </label>
                                                        </div>
                                                        <input class="form-control" id="e_bidding_result_tor_loop_step2_desc_tf1" type="text" style="display: none;" placeholder="---------รายละเอียด---------" >
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div id="status1" style="display: none;">
                                            <div class="profile-user-info profile-user-info-striped" >
                                                <div class="profile-info-row">
                                                    <div class="profile-info-name" style="width:350px;"> ส่งรายละเอียดให้คณะกรรมการ ฯ </div>
                                                    <div class="profile-info-value col-sm-12">
                                                        <div class="input-group col-sm-12">
                                                            <span class="input-group-addon">
                                                                <i class="ace-icon fa fa-calendar">  </i>
                                                            </span>
                                                            <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step3_date_tf1" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">
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
                                                    <div class="profile-info-name" style="width:350px;"> คณะกรรมการ ฯ รายงานผลการวิจารณ์ </div>
                                                    <div class="profile-info-value col-sm-12">
                                                        <div class="input-group col-sm-12">
                                                            <span class="input-group-addon">
                                                                <i class="ace-icon fa fa-calendar">  </i>
                                                            </span>
                                                            <input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step4_date_tf1" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">
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
                                                    <div class="profile-info-name" style="width:350px;"> เสนอปรับปรุงร่าง </div>
                                                    <div class="profile-info-value col-sm-12">
                                                        <div class="input-group col-sm-12">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input name="e_bidding_result_tor_loop_step5_status_tf1" type="radio" class="ace" value="N" onchange="dispayStep5Date(1)" checked>
                                                                    <span class="lbl"> เสนอยืน </span>
                                                                </label>
                                                            </div>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input name="e_bidding_result_tor_loop_step5_status_tf1" type="radio" class="ace" value="Y" onchange="dispayStep5Date(1)">
                                                                    <span class="lbl"> เสนอปรับปรุงร่าง </span>
                                                                </label>
                                                            </div>
                                                            <div class="input-group col-sm-12" id="step51"
                                                                 " style="display: none;">
                                                                <span class="input-group-addon">
                                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                                </span>
                                                                <input placeholder="---------วันที่เสนอปรับปรุงร่าง---------" class="form-control active date-picker center" id="e_bidding_result_tor_loop_step5_date_tf1" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                                    <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                                        <div class="input-group col-sm-12">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }

                                    %>
                                </div>
                                <div class="col-xs-12 col-sm-12">
                                    <div class="space-10"></div>
                                    <div style="float: right;">
                                        <button class="btn btn-success btn-white" onclick="AddingTORLoop()"><i class="ace-icon fa fa-plus-circle"></i> เพิ่มประกาศร่าง TOR </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12">    
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> อนุมัติร่างประกาศประกวด/ประกาศจัดซื้อจัดจ้าง </span>
                                </div>
                                <div class="space-10"></div>
                                <div class="profile-user-info profile-user-info-striped" style="border-top: none;">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;">เสนอกรม ฯ เพื่อลงนามและเผยแพร่ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_tor_step1_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_tor_step1_date()%>">
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
                                        <div class="profile-info-name" style="width:350px;">กรม ฯ อนุมัติ ลงนามประกาศเผยแพร่ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_tor_step2_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_tor_step2_date()%>">
                                            </div>
                                        </div>
                                        <div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>
                                        <div class="profile-info-value col-sm-12" style="visibility: hidden;">
                                            <div class="input-group col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12">    
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> ประกาศประกวด/ประกาศจัดซื้อจัดจ้าง </span>
                                </div>
                                <div class="space-10"></div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> ลงประกาศประกวดราคา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="contest_announcement_step1_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getContest_announcement_step1_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="contest_announcement_step1_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getContest_announcement_step1_enddate()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12">    
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> เปิดซองสอบราคา/e-market/e-bidding </span>
                                </div>
                                <div class="space-10"></div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เสนอราคา </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="open_envelope_step1_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getOpen_envelope_step1_date()%>"> 
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
                                        <div class="profile-info-name" style="width:350px;"> คณะกรรมการพิจารณาผล </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="open_envelope_step2_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getOpen_envelope_step2_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="open_envelope_step2_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getOpen_envelope_step2_enddate()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12">    
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> อนุมัติผลการจัดซื้อจัดจ้าง (รอลงนามสัญญา) </span>
                                </div>
                                <div class="space-10"></div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เสนอกรม ฯ ให้ความเห็นชอบ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step1_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step1_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step1_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step1_enddate()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> เสนอกระทรวงอนุมัติ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step2_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step2_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step2_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step2_enddate()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:350px;"> ประกาศผู้ชนะ </div>
                                        <div class="profile-info-value col-sm-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step3_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step3_date()%>">
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
                                                <input class="form-control active date-picker center" id="approve_step4_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step4_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step4_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step4_enddate()%>">
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
                                                <input class="form-control active date-picker center" id="approve_step5_startdate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step5_startdate()%>"> 
                                                <span class="input-group-addon"> ถึง
                                                    <i class="ace-icon fa fa-calendar">  </i>
                                                </span>
                                                <input class="form-control active date-picker center" id="approve_step5_enddate_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getApprove_step5_enddate()%>">
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
                                                <input class="form-control active date-picker center" id="sign_promise_date_tf" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;" value="<%=ebs.getSign_promise_date()%>">
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
                                                <input class="form-control col-sm-12" id="promise_number_tf" type="text" value="<%=ebs.getPromise_number()%>">
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
                                                <input class="form-control col-sm-12" id="promise_name_tf" type="text" value="<%=ebs.getPromise_name()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="space-10"></div>
                            <div class="col-xs-12 col-sm-12" id="infomation3">
                                <div class="space-10"></div>
                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="SaveEBiddingResult()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
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
    function SaveEBiddingResult() {
        var divL = $('div[id^=tor_loop_sub]').length;
        var project_id = "<%=request.getParameter("project_id")%>";
        var tls = {project_id: project_id, METHOD: "DELETE"};
        $.ajax({type: "POST", url: "TorLoopServlet", data: {tls: tls},
            cache: false, success: function (data) {
                for (var i = 1; i <= divL; i++) {
                    var tl = {
                        project_id: project_id,
                        e_bidding_result_tor_loop_id: i,
                        e_bidding_result_tor_loop_step1_startdate: $('#e_bidding_result_tor_loop_step1_startdate_tf' + i).val(),
                        e_bidding_result_tor_loop_step1_enddate: $('#e_bidding_result_tor_loop_step1_enddate_tf' + i).val(),
                        e_bidding_result_tor_loop_step2_status: $("input[name='e_bidding_result_tor_loop_step2_status_tf" + i + "']:checked").val(),
                        e_bidding_result_tor_loop_step2_desc: $('#e_bidding_result_tor_loop_step2_desc_tf' + i).val(),
                        e_bidding_result_tor_loop_step3_date: $('#e_bidding_result_tor_loop_step3_date_tf' + i).val(),
                        e_bidding_result_tor_loop_step4_date: $('#e_bidding_result_tor_loop_step4_date_tf' + i).val(),
                        e_bidding_result_tor_loop_step5_status: $("input[name='e_bidding_result_tor_loop_step5_status_tf" + i + "']:checked").val(),
                        e_bidding_result_tor_loop_step5_date: $('#e_bidding_result_tor_loop_step5_date_tf' + i).val(),
                        METHOD: "INSERT"
                    };
                    console.log(tl);
                    $.ajax({
                        type: "POST",
                        url: "TorLoopServlet",
                        data: {tls: tl},
                        cache: false,
                        success: function (data) {

                        },
                        error: function (err) {
                            waitingDialog.hide();
                        }
                    });
                }
            },
            error: function (err) {
            }
        });

        var draf_tor_step1_date = $('#draf_tor_step1_date_tf').val();
        var draf_tor_step2_date = $('#draf_tor_step2_date_tf').val();
        var draf_tor_step3_date = $('#draf_tor_step3_date_tf').val();
        var approve_tor_step1_date = $('#approve_tor_step1_date_tf').val();
        var approve_tor_step2_date = $('#approve_tor_step2_date_tf').val();
        var contest_announcement_step1_startdate = $('#contest_announcement_step1_startdate_tf').val();
        var contest_announcement_step1_enddate = $('#contest_announcement_step1_enddate_tf').val();
        var open_envelope_step1_date = $('#open_envelope_step1_date_tf').val();
        var open_envelope_step2_startdate = $('#open_envelope_step2_startdate_tf').val();
        var open_envelope_step2_enddate = $('#open_envelope_step2_enddate_tf').val();
        var approve_step1_startdate = $('#approve_step1_startdate_tf').val();
        var approve_step1_enddate = $('#approve_step1_enddate_tf').val();
        var approve_step2_startdate = $('#approve_step2_startdate_tf').val();
        var approve_step2_enddate = $('#approve_step2_enddate_tf').val();
        var approve_step3_date = $('#approve_step3_date_tf').val();
        var approve_step4_startdate = $('#approve_step4_startdate_tf').val();
        var approve_step4_enddate = $('#approve_step4_enddate_tf').val();
        var approve_step5_startdate = $('#approve_step5_startdate_tf').val();
        var approve_step5_enddate = $('#approve_step5_enddate_tf').val();
        var sign_promise_date = $('#sign_promise_date_tf').val();
        var promise_number = $('#promise_number_tf').val();
        var promise_name = $('#promise_name_tf').val();
        var e_bidding_result = {
            project_id: project_id,
            draf_tor_step1_date: draf_tor_step1_date,
            draf_tor_step2_date: draf_tor_step2_date,
            draf_tor_step3_date: draf_tor_step3_date,
            approve_tor_step1_date: approve_tor_step1_date,
            approve_tor_step2_date: approve_tor_step2_date,
            contest_announcement_step1_startdate: contest_announcement_step1_startdate,
            contest_announcement_step1_enddate: contest_announcement_step1_enddate,
            open_envelope_step1_date: open_envelope_step1_date,
            open_envelope_step2_startdate: open_envelope_step2_startdate,
            open_envelope_step2_enddate: open_envelope_step2_enddate,
            approve_step1_startdate: approve_step1_startdate,
            approve_step1_enddate: approve_step1_enddate,
            approve_step2_startdate: approve_step2_startdate,
            approve_step2_enddate: approve_step2_enddate,
            approve_step3_date: approve_step3_date,
            approve_step4_startdate: approve_step4_startdate,
            approve_step4_enddate: approve_step4_enddate,
            approve_step5_startdate: approve_step5_startdate,
            approve_step5_enddate: approve_step5_enddate,
            sign_promise_date: sign_promise_date,
            promise_number: promise_number,
            promise_name: promise_name,
            METHOD: "INSERT"
        };
        $.ajax({
            type: "POST",
            url: "EBiddingResultServlet",
            data: {e_bidding_result: e_bidding_result},
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
    function AddingTORLoop() {
        var divL = $('div[id^=tor_loop_sub]').length + 1;
        var html = '<div id="tor_loop_sub' + divL + '">' +
                '<div class="profile-user-info profile-user-info-striped" style="margin-top:10px;">' +
                '<div class="profile-info-row">' +
                '<div class="profile-info-name" style="width:350px;"> ลงประกาศร่าง (ครั้งที่ ' + divL + ') </div>' +
                '<div class="profile-info-value col-sm-12">' +
                '<div class="input-group">' +
                '<span class="input-group-addon">' +
                '<i class="ace-icon fa fa-calendar">  </i>' +
                '</span>' +
                '<input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step1_startdate_tf' + divL + '" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;"> ' +
                '<span class="input-group-addon"> ถึง' +
                '<i class="ace-icon fa fa-calendar">  </i>' +
                '</span>' +
                '<input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step1_enddate_tf' + divL + '" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="profile-user-info profile-user-info-striped">' +
                '<div class="profile-info-row">' +
                '<div class="profile-info-name" style="width:350px;"> รายละเอียดวิจารณ์ </div>' +
                '<div class="profile-info-value col-sm-12">' +
                '<div class="input-group col-sm-12">' +
                '<div class="checkbox">' +
                '<label>' +
                '<input name="e_bidding_result_tor_loop_step2_status_tf' + divL + '" type="radio" class="ace" value="N" onchange="dispayStatus(' + divL + ')" checked>' +
                '<span class="lbl"> ไม่มีผู้วิจารณ์ </span>' +
                '</label>' +
                '</div>' +
                '<div class="checkbox">' +
                '<label>' +
                '<input name="e_bidding_result_tor_loop_step2_status_tf' + divL + '" type="radio" class="ace" value="Y" onchange="dispayStatus(' + divL + ')">' +
                '<span class="lbl"> มีผู้วิจารณ์ </span>' +
                '</label>' +
                '</div>' +
                '<input class="form-control" id="e_bidding_result_tor_loop_step2_desc_tf' + divL + '" type="text" style="display: none;" placeholder="---------รายละเอียด---------" >' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div id="status' + divL + '" style="display: none;">' +
                '<div class="profile-user-info profile-user-info-striped" >' +
                '<div class="profile-info-row">' +
                '<div class="profile-info-name" style="width:350px;"> ส่งรายละเอียดให้คณะกรรมการ ฯ </div>' +
                '<div class="profile-info-value col-sm-12">' +
                '<div class="input-group col-sm-12">' +
                '<span class="input-group-addon">' +
                '<i class="ace-icon fa fa-calendar">  </i>' +
                '</span>' +
                '<input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step3_date_tf' + divL + '" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">' +
                '</div>' +
                '</div>' +
                '<div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>' +
                '<div class="profile-info-value col-sm-12" style="visibility: hidden;">' +
                '<div class="input-group col-sm-12">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="profile-user-info profile-user-info-striped">' +
                '<div class="profile-info-row">' +
                '<div class="profile-info-name" style="width:350px;"> คณะกรรมการ ฯ รายงานผลการวิจารณ์ </div>' +
                '<div class="profile-info-value col-sm-12">' +
                '<div class="input-group col-sm-12">' +
                '<span class="input-group-addon">' +
                '<i class="ace-icon fa fa-calendar">  </i>' +
                '</span>' +
                '<input class="form-control active date-picker center" id="e_bidding_result_tor_loop_step4_date_tf' + divL + '" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">' +
                '</div>' +
                '</div>' +
                '<div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>' +
                '<div class="profile-info-value col-sm-12" style="visibility: hidden;">' +
                '<div class="input-group col-sm-12">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="profile-user-info profile-user-info-striped">' +
                '<div class="profile-info-row">' +
                '<div class="profile-info-name" style="width:350px;"> เสนอปรับปรุงร่าง </div>' +
                '<div class="profile-info-value col-sm-12">' +
                '<div class="input-group col-sm-12">' +
                '<div class="checkbox">' +
                '<label>' +
                '<input name="e_bidding_result_tor_loop_step5_status_tf' + divL + '" type="radio" class="ace" value="N" onchange="dispayStep5Date(' + divL + ')" checked>' +
                '<span class="lbl"> เสนอยืน </span>' +
                '</label>' +
                '</div>' +
                '<div class="checkbox">' +
                '<label>' +
                '<input name="e_bidding_result_tor_loop_step5_status_tf' + divL + '" type="radio" class="ace" value="Y" onchange="dispayStep5Date(' + divL + ')">' +
                '<span class="lbl"> เสนอปรับปรุงร่าง </span>' +
                '</label>' +
                '</div>' +
                '<div class="input-group col-sm-12" id="step5' + divL + '" style="display: none;">' +
                '<span class="input-group-addon">' +
                '<i class="ace-icon fa fa-calendar">  </i>' +
                '</span>' +
                '<input placeholder="---------วันที่เสนอปรับปรุงร่าง---------" class="form-control active date-picker center" id="e_bidding_result_tor_loop_step5_date_tf' + divL + '" type="text" data-date-format="dd-mm-yyyy" style="width: 300px;">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="profile-info-name" style="width:350px;visibility: hidden;">  </div>' +
                '<div class="profile-info-value col-sm-12" style="visibility: hidden;">' +
                '<div class="input-group col-sm-12">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
        $('#tor_loop').append(html);
        $("#e_bidding_result_tor_loop_step1_startdate_tf" + divL).datepicker({
            autoclose: true,
            todayHighlight: true,
            language: 'th',
            thaiyear: true,
        });
        $("#e_bidding_result_tor_loop_step1_enddate_tf" + divL).datepicker({
            autoclose: true,
            todayHighlight: true,
            language: 'th',
            thaiyear: true,
        });
        $("#e_bidding_result_tor_loop_step3_date_tf" + divL).datepicker({
            autoclose: true,
            todayHighlight: true,
            language: 'th',
            thaiyear: true,
        });
        $("#e_bidding_result_tor_loop_step4_date_tf" + divL).datepicker({
            autoclose: true,
            todayHighlight: true,
            language: 'th',
            thaiyear: true,
        });
        $("#e_bidding_result_tor_loop_step5_date_tf" + divL).datepicker({
            autoclose: true,
            todayHighlight: true,
            language: 'th',
            thaiyear: true,
        });
    }
    function dispayStatus(id) {
        var e_bidding_result_tor_loop_step2_status = $('#tor_loop_sub' + id).parent().find("input[name='e_bidding_result_tor_loop_step2_status_tf" + id + "']:checked").val();
        if (e_bidding_result_tor_loop_step2_status == 'Y') {
            $('#tor_loop_sub' + id).parent().find('#status' + id).show();
            $('#tor_loop_sub' + id).parent().find('#e_bidding_result_tor_loop_step2_desc_tf' + id).show();
        } else {
            $('#tor_loop_sub' + id).parent().find('#status' + id).hide();
            $('#tor_loop_sub' + id).parent().find('#e_bidding_result_tor_loop_step2_desc_tf' + id).hide();
        }
    }
    function dispayStep5Date(id) {
        var e_bidding_result_tor_loop_step5_status = $('#tor_loop_sub' + id).parent().find("input[name='e_bidding_result_tor_loop_step5_status_tf" + id + "']:checked").val();
        if (e_bidding_result_tor_loop_step5_status == 'Y') {
            $('#tor_loop_sub' + id).parent().find('#step5' + id).show();
        } else {
            $('#tor_loop_sub' + id).parent().find('#step5' + id).hide();
            $('#tor_loop_sub' + id).parent().find('#e_bidding_result_tor_loop_step5_date_tf' + id).val("")
        }
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