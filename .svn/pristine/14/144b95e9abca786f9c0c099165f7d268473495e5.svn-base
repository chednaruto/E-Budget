<%@page import="rd.ebudget.tools.SpecificColorStatus"%>
<%@page import="rd.ebudget.tools.SelectionColorStatus"%>
<%@page import="rd.ebudget.tools.EBiddingColorStatus"%>
<%@page import="rd.ebudget.tools.EMarketColorStatus"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.EBudgetTools"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories(); %>
<div class="main-content-inner">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">Home</a>
            </li>
            <li class="active">Dashboard</li>
        </ul><!-- /.breadcrumb -->
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                Dashboard
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    overview
                </small>
            </h1>
        </div><!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">
                <div class="row" style="display: none;">
                    <div class="col-sm-12">
                        <div class="btn-group">
                            <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle" aria-expanded="false">
                                ประเภทงบประมาณ
                                <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                            </button>

                            <ul class="dropdown-menu">
                                <%
                                    EBudgetTools et = new EBudgetTools();
                                    DB2Manager dbms = new DB2Manager();
                                    String query = "SELECT * FROM e_budget.budget_type";
                                    ResultSet bgt = dbms.GetDataAsResultSet(query);
                                    while (bgt.next()) {
                                        out.print("<li><a href=''>" + bgt.getString("budget_type_name") + "</a></li>");
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="space-10"></div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="col-sm-4 infobox-container" style="margin-top: 80px;">
                            <div class="infobox infobox-green">
                                <div class="infobox-chart">
                                    <span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"><canvas width="44" height="33" style="display: inline-block; width: 44px; height: 33px; vertical-align: top;"></canvas></span>
                                </div>

                                <div class="infobox-data">
                                    <span class="infobox-data-number" style="font-size: 17px;"><%=acc.NumberFormat(et.GetDash2ReceiveBugetwidget(), "#,###.##")%></span>
                                    <div class="infobox-content">ยอดรับงบประมาณ (บาท)</div>
                                </div>
                            </div>
                            <div class="infobox infobox-red">
                                <div class="infobox-progress">
                                    <div class="easy-pie-chart percentage" data-percent="<%=acc.NumberFormat(et.GetDash2PaymentBudgetwidget() * 100 / et.GetDash2ReceiveBugetwidget(), "###")%>" data-size="46">
                                        <span class="percent"><%=acc.NumberFormat(et.GetDash2PaymentBudgetwidget() * 100 / et.GetDash2ReceiveBugetwidget(), "###")%></span>%
                                    </div>
                                </div>
                                <div class="infobox-data">
                                    <span class="infobox-data-number" style="font-size: 17px;"><%=acc.NumberFormat(et.GetDash2PaymentBudgetwidget(), "#,###.##")%></span>
                                    <div class="infobox-content">เบิกจ่ายงบประมาณ (บาท)</div>
                                </div>
                            </div>
                            <div class="space-6"></div>

                            <div class="infobox infobox-blue2">
                                <div class="infobox-progress">
                                    <div class="easy-pie-chart percentage" data-percent="<%=acc.NumberFormat((et.GetDash2ReceiveBugetwidget() - et.GetDash2PaymentBudgetwidget()) * 100 / et.GetDash2ReceiveBugetwidget(), "#,###")%>" data-size="46">
                                        <span class="percent"><%=acc.NumberFormat((et.GetDash2ReceiveBugetwidget() - et.GetDash2PaymentBudgetwidget()) * 100 / et.GetDash2ReceiveBugetwidget(), "#,###")%></span>%
                                    </div>
                                </div>
                                <div class="infobox-data">
                                    <span class="infobox-data-number" style="font-size: 17px;"><%=acc.NumberFormat(et.GetDash2ReceiveBugetwidget() - et.GetDash2PaymentBudgetwidget(), "#,###.##")%></span>
                                    <div class="infobox-content">งบประมาณคงเหลือ (บาท)</div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-8">
                            <div class="widget-box" style="height: 300px;border: none;">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <div id="chart-data"></div>
                                    </div><!-- /.widget-main -->
                                </div><!-- /.widget-body -->
                            </div><!-- /.widget-box -->
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="widget-box" style="height: 300px;border: none;">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <div id="chart-payment"></div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div><!-- /.widget-box -->
                    </div>
                    <div class="col-sm-4">
                        <div class="widget-box" style="height: 300px;border: none;">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <div id="piechart-placeholder"></div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div><!-- /.widget-box -->
                    </div>
                </div>
                <!-- E-Marketing -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-block alert-success center">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                            <img src="assets/images/green.png" style="width: 24px;height: 24px;margin-right: 5px;">ดำเนินการเสร็จสิ้นเป็นไปตามแผน
                            <img src="assets/images/blue.png" style="width: 24px;height: 24px;margin-right: 5px;margin-left: 5px;"><label class="blue">ดำเนินการเสร็จสิ้นช้ากว่าแผนที่กำหนด</label>
                            <img src="assets/images/yellow.png" style="width: 24px;height: 24px;margin-right: 5px;margin-left: 5px;"><label class="blue">ดำเนินการยังไม่เสร็จสิ้น</label>
                            <img src="assets/images/red.png" style="width: 24px;height: 24px;margin-right: 5px;margin-left: 5px;"><label class="blue">ยังไม่ดำเนินการ</label>
                        </div>
                        <div class="widget-box transparent">
                            <div class="widget-header widget-header-flat">
                                <h4 class="widget-title lighter">
                                    <i class="ace-icon fa fa-signal"></i>
                                    วิธีตลาดอิเล็กทรอนิกส์ (e - market)
                                </h4>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main padding-4">
                                    <div>
                                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="center" colspan="4">ขั้นตอนจัดซื้อจัดจ้าง</th>
                                                    <th class="center" colspan="4">การเบิกจ่ายงบประมาณ</th>
                                                </tr>
                                                <tr>
                                                    <th class="center">ประกาศประกวด/ประกาศจัดซื้อจัดจ้าง</th>
                                                    <th class="center"> เปิดซอง </th>
                                                    <th class="center"> อนุมัติผลการจัดซื้อจัดจ้าง </th>
                                                    <th class="center"> ลงนามในสัญญา </th>
                                                    <th class="center"> งวดงานทั้งหมด </th>
                                                    <th class="center"> งวดงานที่เบิกจ่าย </th>
                                                    <th class="center"> ยอดเงินทั้งหมด </th>
                                                    <th class="center"> ยอดเงินที่เบิกจ่าย </th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%
                                                    query = "SELECT * FROM e_budget.project p inner join e_budget.office of ON p.officeid = of.officeid WHERE p.purchase_sub_type_id = 1";
                                                    ResultSet pr = dbms.GetDataAsResultSet(query);
                                                    int i = 1;
                                                    while (pr.next()) {
                                                %>
                                                <tr>
                                                    <td class="left" colspan="8"><a href="#" onclick="OpenEMarketModal('<%=pr.getString("project_id")%>')"><% out.print(i + ") " + pr.getString("project_name") + " (" + pr.getString("officename") + ")");%></a></td>
                                                </tr>
                                                <%
                                                        EMarketColorStatus emcs = new EMarketColorStatus();
                                                        out.print("<tr>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getContestStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getOpenEnvelopeColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getApproveColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getSignPromiseColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentPlan(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentResult(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetPlan(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetResult(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("</tr>");
                                                        i++;
                                                    }
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div>
                    </div>
                </div>
                <!-- E-Bidding -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="widget-box transparent">
                            <div class="widget-header widget-header-flat">
                                <h4 class="widget-title lighter">
                                    <i class="ace-icon fa fa-signal"></i>
                                    วิธีประกวดราคาอิเล็กทรอนิกส์ (e - bidding)
                                </h4>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main padding-4">
                                    <div>
                                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="center" colspan="6">ขั้นตอนจัดซื้อจัดจ้าง</th>
                                                    <th class="center" colspan="4">การเบิกจ่ายงบประมาณ</th>
                                                </tr>
                                                <tr>
                                                    <th class="center">จัดทำร่าง TOR</th>
                                                    <th class="center"> อนุมัติร่าง ฯ </th>
                                                    <th class="center"> ประกาศประกวด/ประกาศจัดซื้อจัดจ้าง </th>
                                                    <th class="center"> เปิดซอง </th>
                                                    <th class="center"> อนุมัติผลการจัดซื้อจัดจ้าง </th>
                                                    <th class="center"> ลงนามในสัญญา </th>
                                                    <th class="center"> งวดงานทั้งหมด </th>
                                                    <th class="center"> งวดงานที่เบิกจ่าย </th>
                                                    <th class="center"> ยอดเงินทั้งหมด </th>
                                                    <th class="center"> ยอดเงินที่เบิกจ่าย </th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%
                                                    query = "SELECT * FROM e_budget.project p inner join e_budget.office of ON p.officeid = of.officeid WHERE p.purchase_sub_type_id = 2";
                                                    pr = dbms.GetDataAsResultSet(query);
                                                    i = 1;
                                                    while (pr.next()) {
                                                %>
                                                <tr>
                                                    <td class="left" colspan="10"><a href="#" onclick="OpenEBiddingModal('<%=pr.getString("project_id")%>')"><% out.print(i + ") " + pr.getString("project_name") + " (" + pr.getString("officename") + ")");%></a></td>
                                                </tr>
                                                <%
                                                        EBiddingColorStatus emcs = new EBiddingColorStatus();
                                                        out.print("<tr>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getDrafTORStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getApproveTORStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getContestStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getOpenEnvelopeStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getApproveStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getSignPromiseColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentPlan(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentResult(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetPlan(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetResult(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("</tr>");
                                                        i++;
                                                    }
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div>
                    </div>
                </div>
                <!-- SELECTION METHOD -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="widget-box transparent">
                            <div class="widget-header widget-header-flat">
                                <h4 class="widget-title lighter">
                                    <i class="ace-icon fa fa-signal"></i>
                                    วิธีคัดเลือก
                                </h4>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main padding-4">
                                    <div>
                                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="center" colspan="4">ขั้นตอนจัดซื้อจัดจ้าง</th>
                                                    <th class="center" colspan="4">การเบิกจ่ายงบประมาณ</th>
                                                </tr>
                                                <tr>
                                                    <th class="center">ประกาศเชิญชวน</th>
                                                    <th class="center"> คณะกรรมการพิจารณา  </th>
                                                    <th class="center"> อนุมัติผลการจัดซื้อจัดจ้าง (รอลงนามสัญญา) </th>
                                                    <th class="center"> ลงนามในสัญญา </th>
                                                    <th class="center"> งวดงานทั้งหมด </th>
                                                    <th class="center"> งวดงานที่เบิกจ่าย </th>
                                                    <th class="center"> ยอดเงินทั้งหมด </th>
                                                    <th class="center"> ยอดเงินที่เบิกจ่าย </th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%
                                                    query = "SELECT * FROM e_budget.project p inner join e_budget.office of ON p.officeid = of.officeid WHERE p.purchase_sub_type_id = 3";
                                                    pr = dbms.GetDataAsResultSet(query);
                                                    i = 1;
                                                    while (pr.next()) {
                                                %>
                                                <tr>
                                                    <td class="left" colspan="8"><% out.print(i + ") " + pr.getString("project_name") + " (" + pr.getString("officename") + ")");%></td>
                                                </tr>
                                                <%
                                                        SelectionColorStatus emcs = new SelectionColorStatus();
                                                        out.print("<tr>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getInvitationStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getBoardReviewStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getApproveStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getSignPromiseStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentPlan(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentResult(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetPlan(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetResult(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("</tr>");
                                                        i++;
                                                    }
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div>
                    </div>
                </div>
                <!-- SPECIFIC METHOD -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="widget-box transparent">
                            <div class="widget-header widget-header-flat">
                                <h4 class="widget-title lighter">
                                    <i class="ace-icon fa fa-signal"></i>
                                    วิธีเฉพาะเจาะจง
                                </h4>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main padding-4">
                                    <div>
                                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="center" colspan="4">ขั้นตอนจัดซื้อจัดจ้าง</th>
                                                    <th class="center" colspan="4">การเบิกจ่ายงบประมาณ</th>
                                                </tr>
                                                <tr>
                                                    <th class="center"> ประกาศเชิญชวน </th>
                                                    <th class="center"> คณะกรรมการพิจารณา  </th>
                                                    <th class="center"> อนุมัติผลการจัดซื้อจัดจ้าง (รอลงนามสัญญา) </th>
                                                    <th class="center"> ลงนามในสัญญา </th>
                                                    <th class="center"> งวดงานทั้งหมด </th>
                                                    <th class="center"> งวดงานที่เบิกจ่าย </th>
                                                    <th class="center"> ยอดเงินทั้งหมด </th>
                                                    <th class="center"> ยอดเงินที่เบิกจ่าย </th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%
                                                    query = "SELECT * FROM e_budget.project p inner join e_budget.office of ON p.officeid = of.officeid WHERE p.purchase_sub_type_id = 4";
                                                    pr = dbms.GetDataAsResultSet(query);
                                                    i = 1;
                                                    while (pr.next()) {
                                                %>
                                                <tr>
                                                    <td class="left" colspan="8"><% out.print(i + ") " + pr.getString("project_name") + " (" + pr.getString("officename") + ")");%></td>
                                                </tr>
                                                <%
                                                        SpecificColorStatus emcs = new SpecificColorStatus();
                                                        out.print("<tr>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getInvitationStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getBoardReviewStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getApproveStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'><img src='assets/images/" + emcs.getSignPromiseStatusColor(pr.getString("project_id")) + ".png' style='width:24px;height:24px;'></td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentPlan(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + emcs.getTermOfPaymentResult(pr.getString("project_id")) + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetPlan(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("<td class='center'>" + acc.NumberFormat(emcs.getPaymentBudgetResult(pr.getString("project_id")), "#,###.##") + "</td>");
                                                        out.print("</tr>");
                                                        i++;
                                                    }
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
</style>
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
<script src="assets/js/jquery-ui.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/jquery.easypiechart.min.js"></script>
<script src="assets/js/jquery.sparkline.index.min.js"></script>
<script src="assets/js/jquery.flot.min.js"></script>
<script src="assets/js/jquery.flot.pie.min.js"></script>
<script src="assets/js/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="assets/fusionchart/js/fusioncharts.js"></script>
<script type="text/javascript" src="assets/fusionchart/js/themes/fusioncharts.theme.fusion.js">

</script>
<style type="text/css">
    g[class^='raphael-group-'][class$='-creditgroup'] {
        display:none !important;
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

<script type="text/javascript">

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
    jQuery(function ($) {

        $('.easy-pie-chart.percentage').each(function () {
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size / 10),
                animate: ace.vars['old_ie'] ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function () {
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                    {
                        tagValuesAttribute: 'data-values',
                        type: 'bar',
                        barColor: barColor,
                        chartRangeMin: $(this).data('min') || 0
                    });
        });
        //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
        //but sometimes it brings up errors with normal resize event handlers
        $.resize.throttleWindow = false;
    })

    const dataSource = {
        "chart": {
            "caption": "งบประมาณรายภาค",
            "subcaption": " 1 ตุลาคม 2561 ถึง ปัจจุบัน ",
            "showToolTip": "1",
            "plottooltext": "$label <b>$dataValue</b> $seriesName",
            "theme": "fusion",
        },
        "categories": [
            {
                "category": [
                    {
                        "label": "กรม"
                    },
                    {
                        "label": "ภาค 1"
                    },
                    {
                        "label": "ภาค 2"
                    },
                    {
                        "label": "ภาค 3"
                    },
                    {
                        "label": "ภาค 4"
                    },
                    {
                        "label": "ภาค 5"
                    },
                    {
                        "label": "ภาค 6"
                    },
                    {
                        "label": "ภาค 7"
                    },
                    {
                        "label": "ภาค 8"
                    },
                    {
                        "label": "ภาค 9"
                    },
                    {
                        "label": "ภาค 10"
                    },
                    {
                        "label": "ภาค 11"
                    },
                    {
                        "label": "ภาค 12"
                    }
                ]
            }
        ],
        "dataset": <%=et.GetDash2Dash12()%>
    };
    const dataSourceC = {
        "chart": {
            "caption": "การเบิกจ่ายงบประมาณเทียบงบประมาณทั้งหมด",
            "subcaption": "(1 ตุลาคม 2561 ถึง ปัจจุบัน)",
            "plottooltext": " $label $seriesName = <b>$dataValue</b>",
            "yaxisname": "จำนวนงบประมาณ",
            "showsum": "0",
            "showToolTip": "1",
            "theme": "fusion"
        },
        "categories": [
            {
                "category": [
                    {
                        "label": "กรม"
                    },
                    {
                        "label": "ภาค 1"
                    },
                    {
                        "label": "ภาค 2"
                    },
                    {
                        "label": "ภาค 3"
                    },
                    {
                        "label": "ภาค 4"
                    },
                    {
                        "label": "ภาค 5"
                    },
                    {
                        "label": "ภาค 6"
                    },
                    {
                        "label": "ภาค 7"
                    },
                    {
                        "label": "ภาค 8"
                    },
                    {
                        "label": "ภาค 9"
                    },
                    {
                        "label": "ภาค 10"
                    },
                    {
                        "label": "ภาค 11"
                    },
                    {
                        "label": "ภาค 12"
                    }
                ]
            }
        ],
        "dataset": [{
    <%= et.GetDash2Dash22().split("\\|")[0]%>
            },
            {
                "seriesname": "งบประมาณทั้งหมด",
                "plottooltext": "งบประมาณทั้งหมด $label = <b>$dataValue</b>",
                "renderas": "Line",
                "data": [
    <%= et.GetDash2Dash22().split("\\|")[1]%>
                ]
            }
        ]
    };

    FusionCharts.ready(function () {
        var myChart = new FusionCharts({
            type: "stackedcolumn2d",
            renderAt: "chart-data",
            width: "100%",
            height: "88%",
            dataFormat: "json",
            dataSource
        }).render();
        var myChart2 = new FusionCharts({
            type: "stackedcolumn2dline",
            renderAt: "chart-payment",
            width: "100%",
            height: "88%",
            dataFormat: "json",
            dataSource: dataSourceC
        }).render();

    });
</script>