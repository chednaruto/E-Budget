<%@page import="rd.ebudget.tools.EBudgetTools"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories(); %>
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
            <li> ข้อมูลโครงการที่ได้รับอนุมัติ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายการโครงการที่ได้รับอนุมัติ </small></h1>
                </div>
                <div class="row">
                    <div class="col-xs-12 center">
                        <button class="btn btn-success btn-white" style="float:right;" onclick="Goto('ActiveProjectAdding')"><i class="ace-icon fa fa-plus"></i> เพิ่มโครงการที่ได้รับอนุมัติ </button>
                    </div>
                </div>
                <div class="space-6"></div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center"> เมนู </th>
                                <th class="center"> หน่วยงาน </th>
                                <th class="center"> ชื่อโครงการ </th>
                                <th class="center"> ประเภทการจัดซื้อจัดจ้าง </th>
                                <th class="center"> งบประมาณ </th>
                                <th class="center"> สถานะโครงการ </th>

                            </tr>
                        </thead>  
                        <tbody>
                            <%
                                String query = "";

                                query = "SELECT p.*,"
                                        + "(select sum(pa.project_activity_budget) from e_budget.project_activity pa where pa.project_id=p.project_id) as total_budget,"
                                        + " pt.purchase_sub_type_name,of.officename "
                                        + " FROM e_budget.project p "
                                        + " LEFT JOIN e_budget.purchase_sub_type pt ON p.purchase_sub_type_id = pt.purchase_sub_type_id "
                                        + " LEFT JOIN e_budget.office of ON p.officeid = of.officeid "
                                        + "WHERE p.officeid_active = '" + session.getAttribute("E-Budget-OFFICEID") + "' AND project_active_status='Y'";
                                DB2Manager dbms = new DB2Manager();
                                ResultSet rs = dbms.GetDataAsResultSet(query);
                                EBudgetTools et = new EBudgetTools();
                                while (rs.next()) {
                            %>
                            <tr>
                                <td class="center">
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle btn-sm" aria-expanded="true">
                                            <i class="ace-icon fa fa-list"></i> เมนู
                                            <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                        </button>

                                        <ul class="dropdown-menu">
                                            <%
                                                if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Parcel")).trim().equals("Y")) {
                                            %>
                                            <li> <a href="index.jsp?service=ActiveProjectAdding&project_id=<%=rs.getString("project_id")%>"> <i class="fa fa-pencil-square-o blue"></i> แก้ไขรายละเอียดการอนุมัติโครงการ </a> </li>
                                            <li> <a href="index.jsp?service=ProjectPlanAdding<%=rs.getInt("purchase_sub_type_id")%>&project_id=<%=rs.getString("project_id")%>"> <i class="fa fa-pencil-square-o blue"></i> บันทึก/แก้ไขแผนงานจัดซื้อจัดจ้าง </a> </li>
                                                <%
                                                    }
                                                    String table = "";
                                                    String table2 = "";
                                                    if (rs.getInt("purchase_sub_type_id") == 1) {
                                                        table = "e_budget.e_market_plan";
                                                        table2 = "e_budget.e_market_result";
                                                    } else if (rs.getInt("purchase_sub_type_id") == 2) {
                                                        table = "e_budget.e_bidding_plan";
                                                        table2 = "e_budget.e_bidding_result";
                                                    } else if (rs.getInt("purchase_sub_type_id") == 3) {
                                                        table = "e_budget.selection_method_plan";
                                                        table2 = "e_budget.selection_method_result";
                                                    } else if (rs.getInt("purchase_sub_type_id") == 4) {
                                                        table = "e_budget.specific_method_plan";
                                                        table2 = "e_budget.specific_method_result";
                                                    }

                                                    query = "SELECT * FROM " + table + " WHERE project_id='" + rs.getString("project_id") + "'";
                                                    ResultSet srs = dbms.GetDataAsResultSet(query);
                                                    if (srs.next()) {
                                                        if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Parcel")).trim().equals("Y")) {
                                                %>
                                            <li> <a href="index.jsp?service=ProjectPlanResultAdding<%=rs.getInt("purchase_sub_type_id")%>&project_id=<%=rs.getString("project_id")%>"> <i class="fa fa-pencil-square-o blue"></i> รายงานผลจัดซื้อจัดจ้าง</a> </li>             
                                                <%
                                                    }
                                                    query = "SELECT * FROM " + table2 + " WHERE project_id = '" + rs.getString("project_id") + "' AND sign_promise_date IS NOT NULL";
                                                    ResultSet srs2 = dbms.GetDataAsResultSet(query);
                                                    if (srs2.next()) {
                                                        if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Parcel")).trim().equals("Y")) {
                                                %>
                                            <li> <a href="index.jsp?service=ProjectPeriodsList&project_id=<%=rs.getString("project_id")%>"> <i class="fa fa-pencil-square-o blue"></i> บันทึก/แก้ไขรายละเอียดงวดงาน/งวดเงิน</a> </li>
                                                <%
                                                    }
                                                    query = "SELECT * FROM e_budget.term_of_payment_plan WHERE project_id='" + rs.getString("project_id") + "'";
                                                    ResultSet srs3 = dbms.GetDataAsResultSet(query);
                                                    if (srs3.next()) {
                                                        query = "SELECT COUNT(*) AS cc FROM e_budget.allocate_budget WHERE project_id='" + rs.getString("project_id") + "'";
                                                        ResultSet srs4 = dbms.GetDataAsResultSet(query);
                                                        srs4.next();
                                                        if (srs4.getInt("cc") > 0) {
                                                            if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Finance")).trim().equals("Y")) {
                                                %>
                                            <li> <a href="index.jsp?service=TermOfPaymentResult&project_id=<%=rs.getString("project_id")%>"> <i class="fa fa-pencil-square-o blue"></i> บันทึกเบิกจ่ายงบประมาณ </a> </li>
                                                <%
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                %>


                                            <li class="divider"></li>
                                            <%
                                                if(rs.getInt("purchase_sub_type_id")==1){
                                            %>
                                            <li> <a href='#' onclick="OpenEMarketModal('<%=rs.getString("project_id")%>')"> <i class='fa fa-info-circle blue'></i> แสดงรายละเอียดโครงการ </a> </li>
                                            <%
                                                }else if(rs.getInt("purchase_sub_type_id")==2){
                                            %>
                                            <li> <a href='#' onclick="OpenEBiddingModal('<%=rs.getString("project_id")%>')"> <i class='fa fa-info-circle blue'></i> แสดงรายละเอียดโครงการ </a> </li>
                                            <%
                                                }
                                            %>
                                            
                                                <%
                                                    query = "select count(*) cc from e_budget.project_activity where project_id='" + rs.getString("project_id") + "'";
                                                    srs = dbms.GetDataAsResultSet(query);
                                                    srs.next();
                                                    if (srs.getInt("cc") > 0) {
                                                    } else {
                                                %>

                                            <li><a href="#"> <i class="ace-icon fa fa-trash red"></i> ลบโครงการ </a> </li>
                                                <% }%>
                                        </ul>
                                    </div>
                                </td>
                                <td class="center"><%=rs.getString("officename")%></td>
                                <td class="left"><%=rs.getString("project_name")%></td>
                                <td class="center"><%=rs.getString("purchase_sub_type_name")%></td>
                                <td class="center"><%=acc.NumberFormat(rs.getDouble("total_budget"), "#,###.##")%></td>
                                <td class="center"><%=et.getProjectStatus(rs.getString("project_id"))%></td>
                            </tr> 
                            <%
                                }
                                rs.close();
                                dbms.closeConnection();
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="fsModal" class="modal animated bounceIn" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <!-- dialog -->
        <div class="modal-dialog">
            <!-- content -->
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h1 id="project_name_lb" class="modal-title small" style="font-size: 20px;">
                        รายละเอียดโครงการ : 
                        </h>
                </div>
                <!-- header -->
                <!-- body -->
                <div class="modal-body" style="overflow-y: scroll;">
                    <div class="main-content-inner" id="printArea">
                        <div class="main-content-inner">
                            <div class="page-content">
                                <div class="page-header">
                                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i>  แผนการจัดซื้อจัดจ้าง </small></h1>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div>
                                            <div class="space-10"></div>
                                            <div id="user-profile-1" class="user-profile row">
                                                <div class="col-xs-12 col-sm-12">
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> ประกาศประกวด/ประกาศจัดซื้อจัดจ้าง </span>
                                                    </div>
                                                    <div class="space-2"></div>
                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอรายงานตามระเบียบ ฯ ข้อ 22 </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="contest_announcement_step1_date_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอกรม ฯ เพื่อลงนามและเผยแพร่ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="contest_announcement_step2_date_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> กรม ฯ อนุมัติ ลงนามประกาศเผยแพร่ </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="contest_announcement_step3_date_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ลงประกาศประกวดราคา </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="contest_announcement_step4_date_tf">  </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="contest_announcement_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="contest_announcement_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>


                                                </div>
                                                <div class="col-xs-12 col-sm-12">   
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> เปิดซองสอบราคา </span>
                                                    </div>
                                                    <div class="space-4"></div>
                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอราคา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="open_envelope_step1_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> คณะกรรมการพิจารณาผล </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="open_envelope_step2_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="open_envelope_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="open_envelope_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">    
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> อนุมัติผลการจัดซื้อจัดจ้าง (รอลงนามสัญญา) </span>
                                                    </div>
                                                    <div class="space-4"></div>

                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอกรม ฯ ให้ความเห็นชอบ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="approve_step1_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอกระทรวงอนุมัติ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="approve_step2_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ประกาศผู้ชนะ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="approve_step3_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> รออุทธรณ์ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="approve_step4_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เปิดทำสัญญาภายใน </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="approve_step5_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="approve_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="approve_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">    
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> ลงนามสัญญา </span>
                                                    </div>
                                                    <div class="space-4"></div>
                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ลงนามสัญญา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="sign_promise_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เลขที่สัญญา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="promise_number_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ชื่อคู่สัญญา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="promise_name_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="sign_promise_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="sign_promise_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12" > 
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> งวดงานและการเบิกจ่ายงบประมาณ </span>
                                                    </div>
                                                    <div class="space-4"></div>
                                                    <div class="col-xs-12 col-sm-12"> 
                                                        <table id="peroid" class="table table-striped table-bordered table-hover">
                                                            <thead>
                                                                <tr style="background-color: #EDF3F4;">
                                                                    <th class="center" style="background-color: #EDF3F4;"> งวดงาน </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> รายการ </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่ส่งมอบ </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่ตรวจรับ </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่อนุมัติจ่ายเงิน </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่จ่ายเงิน </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> จำนวนเงิน </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /.col -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- body -->

                <!-- footer -->
                <div class="modal-footer">
                    <button class="btn btn-primary" onclick="printElement('printArea')">
                        พิมพ์
                    </button>
                    <button class="btn btn-danger"
                            data-dismiss="modal">
                        ปิด
                    </button>
                </div>
                <!-- footer -->

            </div>
            <!-- content -->

        </div>
        <!-- dialog -->

    </div>
    <style>
        .modal {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            overflow: hidden;
        }

        .modal-dialog {
            position: fixed;
            margin: 0;
            width: 100%;
            height: 100%;
            padding: 0;
        }

        .modal-content {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            border: 2px solid #3c7dcf;
            border-radius: 0;
            box-shadow: none;
        }

        .modal-header {
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            height: 50px;
            padding: 10px;
            background: #6598d9;
            border: 0;
        }

        .modal-title {
            font-weight: 300;
            font-size: 2em;
            color: #fff;
            line-height: 30px;
        }

        .modal-body {
            position: absolute;
            top: 50px;
            bottom: 60px;
            width: 100%;
            font-weight: 300;
            overflow: auto;
        }

        .modal-footer {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            height: 60px;
            padding: 10px;
            background: #f1f3f5;
        }
        @media screen {
            #printSection {
                display: none;
            }
        }

        @media print {
            body * {
                visibility:hidden;
            }
            #printSection, #printSection * {
                visibility:visible;
            }
            #printSection {
                position:absolute;
                left:0;
                top:0;
            }
        }
    </style>
    <div id="ebModal" class="modal animated bounceIn" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <!-- dialog -->
        <div class="modal-dialog">
            <!-- content -->
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h1 id="eb_project_name_lb" class="modal-title small" style="font-size: 20px;">
                        รายละเอียดโครงการ : 
                        </h>
                </div>
                <!-- header -->
                <!-- body -->
                <div class="modal-body" style="overflow-y: scroll;">
                    <div class="main-content-inner" id="ebprintArea">
                        <div class="main-content-inner">
                            <div class="page-content">
                                <div class="page-header">
                                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> แผนการจัดซื้อจัดจ้าง </small></h1>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div>
                                            <div class="space-10"></div>
                                            <div id="user-profile-1" class="user-profile row">
                                                <div class="col-xs-12 col-sm-12">
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> จัดทำร่าง TOR </span>
                                                    </div>
                                                    <div class="space-2"></div>
                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped" id="tor_loop">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> แต่งตั้งคณะกรรมการจัดทำรายละเอียดคุณลักษณะเฉพาะ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_draf_tor_step1_date"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> คณะกรรมการส่งคืนเอกสาร </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_draf_tor_step2_date"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอรายงานตามระเบียบ ฯ ข้อ 22 </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_draf_tor_step3_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_draf_tor_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_draf_tor_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-12">   
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> อนุมัติร่างประกาศประกวด/ประกาศจัดซื้อจัดจ้าง </span>
                                                    </div>
                                                    <div class="space-4"></div>
                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอกรม ฯ เพื่อลงนามและเผยแพร่  </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_tor_step1_date"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> คณะกรรมการพิจารณาผล </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_tor_step2_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_tor_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_tor_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">    
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> ประกาศประกวด/ประกาศจัดซื้อจัดจ้าง </span>
                                                    </div>
                                                    <div class="space-4"></div>

                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ลงประกาศประกวดราคา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_contest_announcement_step1_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_contest_announcement_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_contest_announcement_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">    
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> เปิดซองสอบราคา </span>
                                                    </div>
                                                    <div class="space-4"></div>

                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอราคา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_open_envelope_step1_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> คณะกรรมการพิจารณาผล </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_open_envelope_step2_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_open_envelope_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_open_envelope_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">    
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> อนุมัติผลการจัดซื้อจัดจ้าง (รอลงนามสัญญา) </span>
                                                    </div>
                                                    <div class="space-4"></div>

                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอกรม ฯ ให้ความเห็นชอบ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_step1_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เสนอกระทรวงอนุมัติ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_step2_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ประกาศผู้ชนะ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_step3_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> รออุทธรณ์ </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_step4_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เปิดทำสัญญาภายใน </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_step5_date"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_approve_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12">    
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> ลงนามสัญญา </span>
                                                    </div>
                                                    <div class="space-4"></div>
                                                    <div class="col-xs-12 col-sm-8">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> รายละเอียดการดำเนินการ </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ลงนามสัญญา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_sign_promise_date_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> เลขที่สัญญา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_promise_number_tf"> </span>
                                                                </div>
                                                            </div>
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name" style="width: 230px;"> ชื่อคู่สัญญา </div>
                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_promise_name_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-4">
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name center"> แผนการจัดซื้อจัดจ้าง </div>
                                                            </div>
                                                        </div>
                                                        <div class="profile-user-info profile-user-info-striped">
                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่เริ่ม </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_sign_promise_start_tf"> </span>
                                                                </div>
                                                            </div>

                                                            <div class="profile-info-row">
                                                                <div class="profile-info-name"> วันที่สิ้นสุด </div>

                                                                <div class="profile-info-value">
                                                                    <span class="editable editable-click" id="eb_sign_promise_end_tf"> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="space-6"></div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12" > 
                                                    <div class="space-5"></div>
                                                    <div class="social-or-login center">
                                                        <span class="bigger-110"> งวดงานและการเบิกจ่ายงบประมาณ </span>
                                                    </div>
                                                    <div class="space-4"></div>
                                                    <div class="col-xs-12 col-sm-12"> 
                                                        <table id="eb_peroid" class="table table-striped table-bordered table-hover">
                                                            <thead>
                                                                <tr style="background-color: #EDF3F4;">
                                                                    <th class="center" style="background-color: #EDF3F4;"> งวดงาน </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> รายการ </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่ส่งมอบ </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่ตรวจรับ </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่อนุมัติจ่ายเงิน </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> วันที่จ่ายเงิน </th>
                                                                    <th class="center" style="background-color: #EDF3F4;"> จำนวนเงิน </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /.col -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- body -->

                <!-- footer -->
                <div class="modal-footer">
                    <button class="btn btn-primary" onclick="printElement('ebprintArea')">
                        พิมพ์
                    </button>
                    <button class="btn btn-danger"
                            data-dismiss="modal">
                        ปิด
                    </button>
                </div>
                <!-- footer -->
            </div>
            <!-- content -->
        </div>
        <!-- dialog -->
    </div>
    <!------------- Script for DataTable ----------------------->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
    <script src="assets/js/dataTables.buttons.min.js"></script>
    <script src="assets/js/buttons.flash.min.js"></script>
    <script src="assets/js/buttons.html5.min.js"></script>
    <script src="assets/js/buttons.print.min.js"></script>
    <script src="assets/js/buttons.colVis.min.js"></script>
    <script src="assets/js/dataTables.select.min.js">
    </script>
    <!------------- Script for DataTable ----------------------->
    <script>
        function printElement(obj) {
            var domClone = document.getElementById(obj).cloneNode(true);
            var $printSection = document.getElementById("printSection");
            if (!$printSection) {
                var $printSection = document.createElement("div");
                $printSection.id = "printSection";
                document.body.appendChild($printSection);
            }

            $printSection.innerHTML = "";
            $printSection.appendChild(domClone);
            window.print();
        }

        function OpenEBiddingModal(project_id) {
            $.ajax({
                type: "POST",
                url: "GetEBiddingDataModal",
                data: {project_id: project_id},
                cache: false,
                success: function (data) {

                    var emarModal = $.parseJSON(data);
                    $('#eb_project_name_lb').html(emarModal['project_name']);
                    $('#eb_draf_tor_step1_date').html(emarModal['draf_tor_step1_date']);
                    $('#eb_draf_tor_step2_date').html(emarModal['draf_tor_step2_date']);
                    $('#eb_draf_tor_step3_date').html(emarModal['draf_tor_step3_date']);
                    $('#tor_loop').append(emarModal['e_bidding_result_tor_loop']);
                    $('#eb_approve_tor_step1_date').html(emarModal['approve_tor_step1_date']);
                    $('#eb_approve_tor_step2_date').html(emarModal['approve_tor_step2_date']);
                    $('#eb_contest_announcement_step1_date').html(emarModal['contest_announcement_step1_startdate'] + " ถึง " + emarModal['contest_announcement_step1_enddate']);
                    $('#eb_open_envelope_step1_date').html(emarModal['open_envelope_step1_date']);
                    $('#eb_open_envelope_step2_date').html(emarModal['open_envelope_step2_startdate'] + " ถึง " + emarModal['open_envelope_step2_enddate']);

                    $('#eb_approve_step1_date').html(emarModal['approve_step1_startdate'] + " ถึง " + emarModal['approve_step1_enddate']);
                    $('#eb_approve_step2_date').html(emarModal['approve_step2_startdate'] + " ถึง " + emarModal['approve_step2_enddate']);
                    $('#eb_approve_step3_date').html(emarModal['approve_step3_date']);
                    $('#eb_approve_step4_date').html(emarModal['approve_step4_startdate'] + " ถึง " + emarModal['approve_step4_enddate']);
                    $('#eb_approve_step5_date').html(emarModal['approve_step5_startdate'] + " ถึง " + emarModal['approve_step5_enddate']);

                    $('#eb_sign_promise_date_tf').html(emarModal['sign_promise_date']);
                    $('#eb_promise_number_tf').html(emarModal['promise_number']);
                    $('#eb_promise_name_tf').html(emarModal['promise_name']);

                    $('#eb_draf_tor_start_tf').html(emarModal['draf_tor_start']);
                    $('#eb_draf_tor_end_tf').html(emarModal['draf_tor_end']);
                    $('#eb_approve_tor_start_tf').html(emarModal['approve_tor_start']);
                    $('#eb_approve_tor_end_tf').html(emarModal['approve_tor_end']);
                    $('#eb_contest_announcement_start_tf').html(emarModal['contest_announcement_start']);
                    $('#eb_contest_announcement_end_tf').html(emarModal['contest_announcement_end']);
                    $('#eb_open_envelope_start_tf').html(emarModal['open_envelope_start']);
                    $('#eb_open_envelope_end_tf').html(emarModal['open_envelope_end']);
                    $('#eb_approve_start_tf').html(emarModal['approve_start']);
                    $('#eb_approve_end_tf').html(emarModal['approve_end']);
                    $('#eb_sign_promise_start_tf').html(emarModal['sign_promise_start']);
                    $('#eb_sign_promise_end_tf').html(emarModal['sign_promise_end']);
                    
                    $('#eb_peroid tbody').html(emarModal['peroid']);
                    waitingDialog.hide();
                    $('#ebModal').modal({show: 'true'});
                },
                error: function (err) {
                    waitingDialog.hide();
                }
            });
        }

        function OpenEMarketModal(project_id) {
            $.ajax({
                type: "POST",
                url: "GetEmarketDataModal",
                data: {project_id: project_id},
                cache: false,
                success: function (data) {
                    var emarModal = $.parseJSON(data);
                    $('#project_name_lb').html(emarModal['project_name']);
                    $('#contest_announcement_step1_date_tf').html(emarModal['contest_announcement_step1_date']);
                    $('#contest_announcement_step2_date_tf').html(emarModal['contest_announcement_step2_date']);
                    $('#contest_announcement_step3_date_tf').html(emarModal['contest_announcement_step3_date']);
                    $('#contest_announcement_step4_date_tf').html(emarModal['contest_announcement_step4_startdate'] + " ถึง " + emarModal['contest_announcement_step4_enddate']);

                    $('#open_envelope_step1_date_tf').html(emarModal['open_envelope_step1_date']);
                    $('#open_envelope_step2_date_tf').html(emarModal['open_envelope_step2_startdate'] + " ถึง " + emarModal['open_envelope_step2_enddate']);

                    $('#approve_step1_date_tf').html(emarModal['approve_step1_startdate'] + " ถึง " + emarModal['approve_step1_enddate']);
                    $('#approve_step2_date_tf').html(emarModal['approve_step2_startdate'] + " ถึง " + emarModal['approve_step2_enddate']);
                    $('#approve_step3_date_tf').html(emarModal['approve_step3_date']);
                    $('#approve_step4_date_tf').html(emarModal['approve_step4_startdate'] + " ถึง " + emarModal['approve_step4_enddate']);
                    $('#approve_step5_date_tf').html(emarModal['approve_step5_startdate'] + " ถึง " + emarModal['approve_step5_enddate']);

                    $('#sign_promise_date_tf').html(emarModal['sign_promise_date']);
                    $('#promise_number_tf').html(emarModal['promise_number']);
                    $('#promise_name_tf').html(emarModal['promise_name']);

                    $('#contest_announcement_start_tf').html(emarModal['contest_announcement_start']);
                    $('#contest_announcement_end_tf').html(emarModal['contest_announcement_end']);
                    $('#open_envelope_start_tf').html(emarModal['open_envelope_start']);
                    $('#open_envelope_end_tf').html(emarModal['open_envelope_end']);
                    $('#approve_start_tf').html(emarModal['approve_start']);
                    $('#approve_end_tf').html(emarModal['approve_end']);
                    $('#sign_promise_start_tf').html(emarModal['sign_promise_start']);
                    $('#sign_promise_end_tf').html(emarModal['sign_promise_end']);

                    $('#peroid tbody').html(emarModal['peroid']);
                    waitingDialog.hide();
                    $('#fsModal').modal({show: 'true'});

                },
                error: function (err) {
                    waitingDialog.hide();
                }
            });


        }
        $(document).ready(function () {
            var oTable1 = $('#dynamic-table').dataTable({
                "language": {
                    "search": "<b>ค้นหา:</b>",
                    "lengthMenu": "แสดง _MENU_ รายการ ต่อหน้า",
                    "info": "แสดง _START_ ถึง _END_ จาก _TOTAL_ รายการ",
                    "infoEmpty": "แสดง 0 ถึง 0 จาก 0 รายการ",
                    "zeroRecords": "ไม่มีข้อมูล",
                    "oPaginate": {
                        "sFirst": "หน้าแรก", // This is the link to the first page
                        "sPrevious": "ก่อนหน้า", // This is the link to the previous page
                        "sNext": "ถัดไป", // This is the link to the next page
                        "sLast": "หน้าสุดท้าย" // This is the link to the last page
                    }
                }
            });
        });
    </script>
</div>