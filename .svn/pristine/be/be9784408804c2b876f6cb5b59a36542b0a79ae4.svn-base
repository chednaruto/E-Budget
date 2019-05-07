<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.budget.BudgetType"%>
<%@page import="rd.ebudget.object.lookup.Gov.RdGoal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
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
            <li> รายการจัดสรรงบประมาณ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <%
                        String budget_category_name = "";
                        String budget_type_name = "";
                        String disbursement_category_name = "";
                        if (!acc.IsNullToEmtyString(request.getParameter("disbursement_category_id")).isEmpty()) {
                            String query = "select * "
                                    + "from e_budget.disbursement_category dc "
                                    + "left join e_budget.budget_category bc ON dc.budget_category_id=bc.budget_category_id "
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
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายการจัดสรรงบประมาณ >> ประเภทงบประมาณ : <%=budget_type_name%> >> หมวดงบประมาณ : <%=budget_category_name%> >> หมวดรายจ่าย : <%=disbursement_category_name%> </small></h1>
                </div>
                <div class="space-6"></div>
                <div class="row">
                    <div class="col-sm-12 infobox-container">
                        <%
                            double balance = 0;
                            double used = 0;
                            String query = "SELECT bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,"
                                    + "SUM(CASE WHEN t.tb_source IN('receive_budget','receive_tranfer_budget','receive_change_budget') THEN t.budget_total ELSE 0 END) receive_total,"
                                    + "SUM(CASE WHEN t.tb_source IN('tranfer_budget','change_budget','allocate_budget','payment_budget') THEN t.budget_total ELSE 0 END) used_total,dc.disbursement_category_id,dc.disbursement_category_name "
                                    + "FROM ( "
                                    + " 	select 'receive_budget' as tb_source,"
                                    + "    	TIMESTAMP(rb.budget_receive_date,'00:00:00') As transaction_datetime,"
                                    + "    	'' AS detail,"
                                    + "    	rb.budget_total,"
                                    + "         rb.disbursement_category_id "
                                    + "    	from e_budget.receive_budget rb "
                                    + "    	where rb.officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                    + "    	UNION "
                                    + "    	select 'tranfer_budget' AS tb_source,"
                                    + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                                    + "    	of.officename AS detail,"
                                    + "    	tb.budget_total,"
                                    + "         tb.disbursement_category_id "
                                    + "    	from e_budget.tranfer_budget tb "
                                    + "    	left join e_budget.office of ON tb.to_officeid = of.officeid "
                                    + "    	where tb.from_officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                    + "    	UNION "
                                    + "    	select 'receive_tranfer_budget' AS tb_source,"
                                    + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                                    + "    	of.officename as detail,"
                                    + "    	tb.budget_total,"
                                    + "         tb.disbursement_category_id "
                                    + " 	from e_budget.tranfer_budget tb "
                                    + "    	left join e_budget.office of ON tb.from_officeid = officeid "
                                    + "    	where tb.to_officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                    + "   	UNION"
                                    + "    	select 'change_budget' AS tb_source,"
                                    + "    	cb.change_budget_datetime AS transaction_datetime,"
                                    + "    	bc.disbursement_category_name AS detail,"
                                    + "    	cb.budget_total,"
                                    + "         cb.from_disbursement_category_id as disbursement_category_id "
                                    + " 	from e_budget.change_budget cb "
                                    + "   	LEFT JOIN e_budget.disbursement_category bc On cb.to_disbursement_category_id = disbursement_category_id "
                                    + "    	WHERE cb.officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                    + "         UNION "
                                    + "    	select 'receive_change_budget' as tb_source,"
                                    + "    	cb.change_budget_datetime as transaction_datetime,"
                                    + "    	bc.disbursement_category_name as detail,"
                                    + "    	cb.budget_total,"
                                    + "         cb.to_disbursement_category_id as disbursement_category_id "
                                    + "         from e_budget.change_budget cb "
                                    + "    	left join e_budget.disbursement_category bc ON cb.from_disbursement_category_id = bc.disbursement_category_id "
                                    + "   	where cb.officeid= '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                    + "    	UNION "
                                    + "    	SELECT 'allocate_budget' AS tb_source,"
                                    + "         ab.allocate_budget_datetime AS transaction_datetime,"
                                    + "         p.project_name AS detail,"
                                    + "    	ab.allocate_budget_total AS  budget_total,"
                                    + "         disbursement_category_id "
                                    + "         FROM e_budget.allocate_budget ab LEFT JOIN e_budget.project p ON ab.project_id = p.project_id "
                                    + "         WHERE ab.officeid= '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                    + "     UNION "
                                    + "     select 'payment_budget' AS tb_source, "
                                    + "     pb.payment_budget_datetime as transaction_datetime,"
                                    + "     d.disbursement_name AS detail,"
                                    + "     pb.payment_budget_total AS budget_total,"
                                    + "     pb.disbursement_category_id "
                                    + "     from e_budget.payment_budget pb "
                                    + "     left join e_budget.disbursement d ON pb.disbursement_id = d.disbursement_id "
                                    + "     where pb.officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                    + ") as t  "
                                    + "left join e_budget.disbursement_category dc ON t.disbursement_category_id = dc.disbursement_category_id "
                                    + "left join e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                    + "left join e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                                    + "WHERE t.disbursement_category_id=" + request.getParameter("disbursement_category_id") + " "
                                    + "group by bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,dc.disbursement_category_id,dc.disbursement_category_name";
                            DB2Manager dbms = new DB2Manager();
                            ResultSet rs = dbms.GetDataAsResultSet(query);
                            rs.next();
                            balance = rs.getDouble("receive_total") - rs.getDouble("used_total");
                            used = rs.getDouble("used_total");
                            dbms.closeConnection();
                        %>

                        <div class="infobox infobox-blue">
                            <div class="infobox-progress">
                                <div class="easy-pie-chart percentage" data-percent="<%=acc.NumberFormat(used * 100 / (balance + used), "#,###.##")%>" data-size="46">
                                    <span class="percent"><%=acc.NumberFormat(used * 100 / (balance + used), "#,###.##")%></span>
                                </div>
                            </div>

                            <div class="infobox-data">
                                <span class="infobox-text"> จัดสรรงบประมาณ </span>

                                <div class="infobox-content">
                                    <%=acc.NumberFormat(used, "#,###.##")%> บาท
                                </div>
                            </div>
                        </div>
                        <div class="infobox infobox-green">
                            <div class="infobox-progress">
                                <div class="easy-pie-chart percentage" data-percent="<%=acc.NumberFormat(balance * 100 / (balance + used), "#,###.00")%>" data-size="46">
                                    <span class="percent"><%=acc.NumberFormat(balance * 100 / (balance + used), "#,###.##")%></span>
                                </div>
                            </div>

                            <div class="infobox-data">
                                <span class="infobox-text"> งบประมาณคงเหลือ </span>

                                <div class="infobox-content">
                                    <%=acc.NumberFormat(balance, "#,###.##")%> บาท
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vspace-12-sm"></div>
                </div><!-- /.row -->

                <div class="hr hr32 hr-dotted"></div>
                <%
                    String allocate_status = "";
                    String tranfer_status = "";
                    String payment_status = "";
                    String change_status = "";
                    query = "SELECT btc.* FROM e_budget.budget_category bc LEFT JOIN e_budget.budget_type_controll btc ON bc.budget_type_id= btc.budget_type_id WHERE bc.budget_category_id=" + request.getParameter("budget_category_id");
                    rs = dbms.GetDataAsResultSet(query);
                    if (rs.next()) {
                        if (request.getSession().getAttribute("E-Budget-OFFICEID").equals("00005000")) {
                            allocate_status = rs.getString("lv01_allocate_status").equals("Y") ? "" : "style='display: none;'";
                            tranfer_status = rs.getString("lv01_tranfer_status").equals("Y") ? "" : "style='display: none;'";
                            payment_status = rs.getString("lv01_payment_status").equals("Y") ? "" : "style='display: none;'";
                            change_status = rs.getString("lv01_change_status").equals("Y") ? "" : "style='display: none;'";
                        } else {
                            allocate_status = rs.getString("lv02_allocate_status").equals("Y") ? "" : "style='display: none;'";
                            tranfer_status = rs.getString("lv02_tranfer_status").equals("Y") ? "" : "style='display: none;'";
                            payment_status = rs.getString("lv02_payment_status").equals("Y") ? "" : "style='display: none;'";
                            change_status = rs.getString("lv02_change_status").equals("Y") ? "" : "style='display: none;'";
                        }
                    }


                %>
                <div class="row">
                    <div class="col-xs-12"> 
                        <div class="btn-group"style="float: left;">
                            <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle btn-sm" aria-expanded="true">
                                <i class="ace-icon fa fa-list"></i> เลือกรายการเมนู
                                <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li <%=allocate_status%>> 
                                    <a href="index.jsp?service=BudgetAllocateAdding&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>"> 
                                        <i class="fa fa-pencil-square-o blue"></i> จัดสรรงบประมาณ </a> 
                                </li>
                                <li <%=tranfer_status%>> 
                                    <a href="index.jsp?service=TranferBudget&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>"> 
                                        <i class="fa fa-pencil-square-o blue"></i> โอนงบประมาณ </a> 
                                </li>

                                <li <%=change_status%> > 
                                    <a href="index.jsp?service=ChangeBudget&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>"> 
                                        <i class="fa fa-pencil-square-o blue"></i> ขอเปลี่ยนแปลงงบประมาณ </a> 
                                </li>
                                <li <%=payment_status%>> 
                                    <a href="index.jsp?service=PaymentBudgetNoProject&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>"> 
                                        <i class="fa fa-pencil-square-o blue"></i> เบิกจ่ายงบประมาณ </a> 
                                </li>
                                <!--<li class="divider"></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center" style="width: 10%;"> เมนู </th>
                                <th class="center"> วันที่ </th>
                                <th class="center"> ประเภทรายการ </th>
                                <th class="center"> ยอดงบประมาณ </th>
                                <th class="center"> งบประมาณคงเหลือ </th>
                            </tr>
                        </thead>  
                        <tbody>
                            <%

                                query = "SELECT * FROM ("
                                        + " 	select 'receive_budget' as tb_source,"
                                        + "     0 AS transaction_id,"
                                        + "    	TIMESTAMP(rb.budget_receive_date,'00:00:00') As transaction_datetime,"
                                        + "    	'' AS detail,"
                                        + "    	rb.budget_total,"
                                        + "	rb.disbursement_category_id "
                                        + "    	from e_budget.receive_budget rb "
                                        + "    	where rb.officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                        + "    	UNION "
                                        + "    	select 'tranfer_budget' AS tb_source,"
                                        + "     tb.tranfer_budget_id AS transaction_id,"
                                        + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                                        + "    	of.officename AS detail,"
                                        + "    	tb.budget_total,"
                                        + "	tb.disbursement_category_id "
                                        + "    	from e_budget.tranfer_budget tb "
                                        + "    	left join e_budget.office of ON tb.to_officeid = of.officeid "
                                        + "    	where tb.from_officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                        + "    	UNION "
                                        + "    	select 'receive_tranfer_budget' AS tb_source,"
                                        + "     0 AS transaction_id,"
                                        + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                                        + "    	of.officename as detail,"
                                        + "    	tb.budget_total,"
                                        + "	tb.disbursement_category_id "
                                        + " 	from e_budget.tranfer_budget tb "
                                        + "    	left join e_budget.office of ON tb.from_officeid = officeid "
                                        + "    	where tb.to_officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                        + "   	UNION"
                                        + "    	select 'change_budget' AS tb_source,"
                                        + "     cb.change_budget_id AS transaction_id,"
                                        + "    	cb.change_budget_datetime AS transaction_datetime,"
                                        + "    	bc.disbursement_category_name AS detail,"
                                        + "    	cb.budget_total,"
                                        + "     cb.from_disbursement_category_id as disbursement_category_id "
                                        + " 	from e_budget.change_budget cb "
                                        + "   	LEFT JOIN e_budget.disbursement_category bc On cb.to_disbursement_category_id = disbursement_category_id "
                                        + "    	WHERE cb.officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                        + "     UNION "
                                        + "    	select 'receive_change_budget' as tb_source,"
                                        + "     0 AS transaction_id,"
                                        + "    	cb.change_budget_datetime as transaction_datetime,"
                                        + "    	bc.disbursement_category_name as detail,"
                                        + "    	cb.budget_total,"
                                        + "	cb.to_disbursement_category_id as disbursement_category_id "
                                        + "	from e_budget.change_budget cb "
                                        + "    	left join e_budget.disbursement_category bc ON cb.from_disbursement_category_id = bc.disbursement_category_id "
                                        + "   	where cb.officeid= '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                        + "    	UNION "
                                        + "    	SELECT 'allocate_budget' AS tb_source,"
                                        + "     ab.allocate_budget_id AS transaction_id,"
                                        + "     ab.allocate_budget_datetime AS transaction_datetime,"
                                        + "     p.project_name AS detail,"
                                        + "    	ab.allocate_budget_total AS  budget_total,"
                                        + "     disbursement_category_id "
                                        + "	FROM e_budget.allocate_budget ab LEFT JOIN e_budget.project p ON ab.project_id = p.project_id "
                                        + "     WHERE ab.officeid= '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                        + "     UNION "
                                        + "     select 'payment_budget' AS tb_source, "
                                        + "     pb.payment_budget_id AS transaction_id,"
                                        + "     pb.payment_budget_datetime as transaction_datetime,"
                                        + "     d.disbursement_name AS detail,"
                                        + "     pb.payment_budget_total AS budget_total,"
                                        + "     pb.disbursement_category_id "
                                        + "     from e_budget.payment_budget pb "
                                        + "     left join e_budget.disbursement d ON pb.disbursement_id = d.disbursement_id "
                                        + "     where pb.officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' "
                                        + ") as t WHERE t.disbursement_category_id=" + request.getParameter("disbursement_category_id") + " ORDER BY transaction_datetime ASC";
                                dbms = new DB2Manager();
                                rs = dbms.GetDataAsResultSet(query);
                                double budget_total_ds = 0;
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", new Locale("en", "EN"));
                                Date date = new Date();
                                String date_now = dateFormat.format(date);
                                while (rs.next()) {
                                    if (rs.getString("tb_source").equals("tranfer_budget")) {
                                        budget_total_ds -= rs.getDouble("budget_total");
                            %>
                            <tr class="red">
                                <td class='center'>
                                    <%
                                        //if (rs.getString("transaction_datetime").contains(date_now)) {
%>
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle btn-sm" aria-expanded="true">
                                            <i class="ace-icon fa fa-list"></i> เมนู
                                            <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li> 
                                                <a href="index.jsp?service=TranferBudget&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>&tranfer_budget_id=<%=rs.getString("transaction_id")%>" onclick=""> 
                                                    <i class="fa fa-edit red"></i> แก้ไขการโอนงบประมาณ</a> 
                                            </li>
                                            <li> 
                                                <a href="#" onclick="DelTranfer(<%=rs.getString("transaction_id")%>)"> 
                                                    <i class="fa fa-trash-o red"></i> ลบรายการโอนงบประมาณ </a> 
                                            </li>
                                        </ul>
                                    </div>
                                    <%
                                        //}
%>
                                </td>
                                <td class="center"><%=acc.GetThaiDateTime(rs.getString("transaction_datetime"))%></td>
                                <td class="left">โอนงบประมาณ ไปยัง <%=rs.getString("detail")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                <td class="right green" style="text-align: right;"><%=acc.NumberFormat(budget_total_ds, "#,###.##")%></td>
                            </tr>
                            <%
                            } else if (rs.getString("tb_source").equals("change_budget")) {
                                budget_total_ds -= rs.getDouble("budget_total");
                            %>
                            <tr class="red">
                                <td class='center'>
                                    <%
                                        //if (rs.getString("transaction_datetime").contains(date_now)) {
%>
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle btn-sm" aria-expanded="true">
                                            <i class="ace-icon fa fa-list"></i> เมนู
                                            <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                        </button>
                                        <ul class="dropdown-menu">

                                            <li> 
                                                <a href="index.jsp?service=ChangeBudget&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>&change_budget_id=<%=rs.getString("transaction_id")%>" onclick=""> 
                                                    <i class="fa fa-edit red"></i> แก้ไขการขอเปลี่ยนแปลงงบประมาณ</a> 
                                            </li>
                                            <li> 
                                                <a href="#" onclick="DelChangeBudget(<%=rs.getString("transaction_id")%>)"> 
                                                    <i class="fa fa-trash-o red"></i> ลบรายการขอเปลี่ยนแปลงงบประมาณ </a> 
                                            </li>

                                        </ul>
                                    </div>
                                    <%
                                        //}
%>
                                </td>
                                <td class="center"><%=acc.GetThaiDateTime(rs.getString("transaction_datetime"))%></td>
                                <td class="left">เปลี่ยนแปลงงบประมาณเป็น <%=rs.getString("detail")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                <td class="right green" style="text-align: right;"><%=acc.NumberFormat(budget_total_ds, "#,###.##")%></td>
                            </tr>
                            <%
                            } else if (rs.getString("tb_source").equals("receive_budget")) {
                                budget_total_ds += rs.getDouble("budget_total");
                            %>
                            <tr class="green">
                                <td class='center'></td>
                                <td class="center"><%=acc.GetThaiDateTime(rs.getString("transaction_datetime"))%></td>
                                <td class="left">รับงบประมาณ <%=rs.getString("detail")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                <td class="right green" style="text-align: right;"><%=acc.NumberFormat(budget_total_ds, "#,###.##")%></td>
                            </tr>
                            <%
                            } else if (rs.getString("tb_source").equals("receive_tranfer_budget")) {
                                budget_total_ds += rs.getDouble("budget_total");
                            %>
                            <tr class="green">
                                <td class='center'></td>
                                <td class="center"><%=acc.GetThaiDateTime(rs.getString("transaction_datetime"))%></td>
                                <td class="left">รับงบประมาณที่โอนจาก <%=rs.getString("detail")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                <td class="right green" style="text-align: right;"><%=acc.NumberFormat(budget_total_ds, "#,###.##")%></td>
                            </tr>
                            <%
                            } else if (rs.getString("tb_source").equals("receive_change_budget")) {
                                budget_total_ds += rs.getDouble("budget_total");
                            %>
                            <tr class="green">
                                <td class='center'></td>
                                <td class="center"><%=acc.GetThaiDateTime(rs.getString("transaction_datetime"))%></td>
                                <td class="left">รับงบประมาณจากการเปลี่ยนแปลงงบประมาณ <%=rs.getString("detail")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                <td class="right green" style="text-align: right;"><%=acc.NumberFormat(budget_total_ds, "#,###.##")%></td>
                            </tr>
                            <%
                            } else if (rs.getString("tb_source").equals("allocate_budget")) {
                                budget_total_ds -= rs.getDouble("budget_total");
                            %>
                            <tr class="red">
                                <td class='center'>
                                    <%
                                        //if (rs.getString("transaction_datetime").contains(date_now)) {
%>
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle btn-sm" aria-expanded="true">
                                            <i class="ace-icon fa fa-list"></i> เมนู
                                            <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li> 
                                                <a href="index.jsp?service=BudgetAllocateAdding&budget_category_id=<%= request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>&allocate_budget_id=<%=rs.getString("transaction_id")%>" onclick=""> 
                                                    <i class="fa fa-edit red"></i> แก้ไขการจัดสรร </a> 
                                            </li>
                                            <li> 
                                                <a href="#" onclick="DelAllocate(<%=rs.getString("transaction_id")%>)"> 
                                                    <i class="fa fa-trash-o red"></i> ลบรายการจัดสรร </a> 
                                            </li>
                                        </ul>
                                    </div>
                                    <%
                                        //}
%>
                                </td>
                                <td class="center"><%=acc.GetThaiDateTime(rs.getString("transaction_datetime"))%></td>
                                <td class="left">จัดสรรให้ <%=rs.getString("detail")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                <td class="right green" style="text-align: right;"><%=acc.NumberFormat(budget_total_ds, "#,###.##")%></td>
                            </tr>

                            <%
                                //dispay payment project
                                query = "SELECT tr.term_of_payment_result_payment_date,disbursement_name,tr.term_of_payment_result_budget "
                                        + "FROM e_budget.term_of_payment_result tr "
                                        + "left join e_budget.disbursement d ON tr.disbursement_id = d.disbursement_id "
                                        + "left join e_budget.allocate_budget ab ON tr.project_id = ab.project_id "
                                        + "WHERE ab.allocate_budget_id = " + rs.getString("transaction_id");
                                ResultSet rsx = dbms.GetDataAsResultSet(query);
                                while (rsx.next()) {
                            %>
                            <tr class="blue">
                                <td class='center'></td>
                                <td class="center"><%=acc.GetThaiDate(rsx.getString("term_of_payment_result_payment_date"))%></td>
                                <td class="left">เบิ่กจ่ายรายการ <%=rsx.getString("disbursement_name")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rsx.getDouble("term_of_payment_result_budget"), "#,###.##")%></td>
                                <td class="right blue" style="text-align: right;"></td>
                            </tr>
                            <%
                                }
                            } else if (rs.getString("tb_source").equals("payment_budget")) {
                                budget_total_ds -= rs.getDouble("budget_total");
                            %>
                            <tr class="red">
                                <td class='center'>
                                    <%
                                        //if (rs.getString("transaction_datetime").contains(date_now)) {
%>
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle btn-sm" aria-expanded="true">
                                            <i class="ace-icon fa fa-list"></i> เมนู
                                            <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li> 
                                                <a href="index.jsp?service=PaymentBudgetNoProject&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>&payment_budget_id=<%=rs.getString("transaction_id")%>" onclick=""> 
                                                    <i class="fa fa-edit red"></i> แก้ไขรายการเบิกจ่าย </a> 
                                            </li>
                                            <li> 
                                                <a href="#" onclick="DeletePayment(<%=rs.getString("transaction_id")%>)"> 
                                                    <i class="fa fa-trash-o red"></i> ลบรายการเบิกจ่าย </a> 
                                            </li>
                                        </ul>
                                    </div>
                                    <%
                                        //}
%>
                                </td>
                                <td class="center"><%=acc.GetThaiDateTime(rs.getString("transaction_datetime"))%></td>
                                <td class="left">เบิกจ่าย <%=rs.getString("detail")%></td>
                                <td class="right" style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                <td class="right green" style="text-align: right;"><%=acc.NumberFormat(budget_total_ds, "#,###.##")%></td>
                            </tr>
                            <%
                                    }
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
    <!------------- Script for DataTable ----------------------->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
    <script src="assets/js/dataTables.buttons.min.js"></script>
    <script src="assets/js/buttons.flash.min.js"></script>
    <script src="assets/js/buttons.html5.min.js"></script>
    <script src="assets/js/buttons.print.min.js"></script>
    <script src="assets/js/buttons.colVis.min.js"></script>
    <script src="assets/js/dataTables.select.min.js"></script>
    <!------------- Script for DataTable ----------------------->
    <script>
                                                    function DeletePayment(payment_budget_id) {
                                                        $.confirm({
                                                            title: '',
                                                            content: '<b>คุณต้องการลบข้อมูลใช่หรือไม่</b>',
                                                            animation: 'news',
                                                            closeAnimation: 'news',
                                                            buttons: {
                                                                somethingElse: {
                                                                    text: 'ตกลง',
                                                                    btnClass: 'btn-success',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {
                                                                        var payment_budget = {
                                                                            payment_budget_id: payment_budget_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "PaymentBudgetServlet",
                                                                            data: {payment_budget: payment_budget},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data == "TRUE") {
                                                                                    Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>');
                                                                                }
                                                                            },
                                                                            error: function (err) {}
                                                                        });
                                                                    }
                                                                },
                                                                cancleElse: {
                                                                    text: 'ยกเลิก',
                                                                    btnClass: 'btn-danger',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {

                                                                    }
                                                                }
                                                            }
                                                        });
                                                    }
                                                    function DelChangeBudget(change_budget_id) {
                                                        $.confirm({
                                                            title: '',
                                                            content: '<b>คุณต้องการลบข้อมูลใช่หรือไม่</b>',
                                                            animation: 'news',
                                                            closeAnimation: 'news',
                                                            buttons: {
                                                                somethingElse: {
                                                                    text: 'ตกลง',
                                                                    btnClass: 'btn-success',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {
                                                                        var change_budget = {
                                                                            change_budget_id: change_budget_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "ChangeBudgetServlet",
                                                                            data: {change_budget: change_budget},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data == "TRUE") {
                                                                                    Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>');
                                                                                }
                                                                            },
                                                                            error: function (err) {}
                                                                        });
                                                                    }
                                                                },
                                                                cancleElse: {
                                                                    text: 'ยกเลิก',
                                                                    btnClass: 'btn-danger',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {

                                                                    }
                                                                }
                                                            }
                                                        });
                                                    }
                                                    function DelTranfer(tranfer_budget_id) {
                                                        $.confirm({
                                                            title: '',
                                                            content: '<b>คุณต้องการลบข้อมูลใช่หรือไม่</b>',
                                                            animation: 'news',
                                                            closeAnimation: 'news',
                                                            buttons: {
                                                                somethingElse: {
                                                                    text: 'ตกลง',
                                                                    btnClass: 'btn-success',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {
                                                                        var tranfer_budget = {
                                                                            tranfer_budget_id: tranfer_budget_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "TranferBudgetServlet",
                                                                            data: {tranfer_budget: tranfer_budget},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data == "TRUE") {
                                                                                    Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>');
                                                                                }
                                                                            },
                                                                            error: function (err) {}
                                                                        });
                                                                    }
                                                                },
                                                                cancleElse: {
                                                                    text: 'ยกเลิก',
                                                                    btnClass: 'btn-danger',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {

                                                                    }
                                                                }
                                                            }
                                                        });
                                                    }
                                                    function DelAllocate(allocate_budget_id) {
                                                        $.confirm({
                                                            title: '',
                                                            content: '<b>คุณต้องการลบข้อมูลใช่หรือไม่</b>',
                                                            animation: 'news',
                                                            closeAnimation: 'news',
                                                            buttons: {
                                                                somethingElse: {
                                                                    text: 'ตกลง',
                                                                    btnClass: 'btn-success',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {
                                                                        var allocate_budget = {
                                                                            allocate_budget_id: allocate_budget_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "AllocateBudgetServlet",
                                                                            data: {allocate_budget: allocate_budget},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data == "TRUE") {
                                                                                    Goto('BudgetAllocateList&budget_category_id=<%=request.getParameter("budget_category_id")%>&disbursement_category_id=<%=request.getParameter("disbursement_category_id")%>');
                                                                                }
                                                                            },
                                                                            error: function (err) {}
                                                                        });
                                                                    }
                                                                },
                                                                cancleElse: {
                                                                    text: 'ยกเลิก',
                                                                    btnClass: 'btn-danger',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {

                                                                    }
                                                                }
                                                            }
                                                        });
                                                    }
                                                    $(document).ready(function () {

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
                                                        var table =$('#dynamic-table').dataTable({
                                                            "ordering": false,
                                                            "pageLength": 100,
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
                                                        table.fnPageChange( 'last' );
                                                    });
                                                    function DEL(receive_budget_id) {
                                                        $.confirm({
                                                            title: '',
                                                            content: '<b>คุณต้องการลบข้อมูลใช่หรือไม่</b>',
                                                            animation: 'news',
                                                            closeAnimation: 'news',
                                                            buttons: {
                                                                somethingElse: {
                                                                    text: 'ตกลง',
                                                                    btnClass: 'btn-success',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {
                                                                        var receive_budget = {
                                                                            receive_budget_id: receive_budget_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "BudgetReceiveServlet",
                                                                            data: {receive_budget: receive_budget},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data == "TRUE") {
                                                                                    Goto('ReceiveBudget');
                                                                                }
                                                                            },
                                                                            error: function (err) {}
                                                                        });
                                                                    }
                                                                },
                                                                cancleElse: {
                                                                    text: 'ยกเลิก',
                                                                    btnClass: 'btn-danger',
                                                                    keys: ['enter', 'shift'],
                                                                    action: function () {

                                                                    }
                                                                }
                                                            }
                                                        });
                                                    }
    </script>
</div>
