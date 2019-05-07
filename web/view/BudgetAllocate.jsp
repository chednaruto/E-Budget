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
            <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">หน้าหลัก</a></li>
            <li> รายการงบประมาณ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">

                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายการงบประมาณ </small></h1>
                </div>
                <div class="space-6"></div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center"> ประเภทงบประมาณ </th>
                                <th class="center"> หมวดงบประมาณ </th>
                                <th class="center"> หมวดรายจ่าย </th>
                                <th class="center"> ยอดงบประมาณ </th>
                                <th class="center"> ยอดจัดสรรงบประมาณ </th>
                                <th class="center"> ยอดงบประมาณคงเหลือ </th>
                            </tr>
                        </thead>  
                        <tbody>
                            <%
                                DB2Manager mm = new DB2Manager();
                                String query = "SELECT bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,"
                                        + "SUM(CASE WHEN t.tb_source IN('receive_budget','receive_tranfer_budget','receive_change_budget') THEN t.budget_total ELSE 0 END) receive_total,"
                                        + "SUM(CASE WHEN t.tb_source IN('tranfer_budget','change_budget','allocate_budget','payment_budget') THEN t.budget_total ELSE 0 END) used_total,dc.disbursement_category_id,dc.disbursement_category_name "
                                        + "FROM ( "
                                        + " 	select 'receive_budget' as tb_source,"
                                        + "    	TIMESTAMP(rb.budget_receive_date,'00:00:00') As transaction_datetime,"
                                        + "    	'' AS detail,"
                                        + "    	rb.budget_total,"
                                        + "	rb.disbursement_category_id "
                                        + "    	from e_budget.receive_budget rb "
                                        + "    	where rb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' "
                                        + "    	UNION "
                                        + "    	select 'tranfer_budget' AS tb_source,"
                                        + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                                        + "    	of.officename AS detail,"
                                        + "    	tb.budget_total,"
                                        + "	tb.disbursement_category_id "
                                        + "    	from e_budget.tranfer_budget tb "
                                        + "    	left join e_budget.office of ON tb.to_officeid = of.officeid "
                                        + "    	where tb.from_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' "
                                        + "    	UNION "
                                        + "    	select 'receive_tranfer_budget' AS tb_source,"
                                        + "    	tb.tranfer_budget_datetime AS transaction_datetime,"
                                        + "    	of.officename as detail,"
                                        + "    	tb.budget_total,"
                                        + "	tb.disbursement_category_id "
                                        + " 	from e_budget.tranfer_budget tb "
                                        + "    	left join e_budget.office of ON tb.from_officeid = officeid "
                                        + "    	where tb.to_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' "
                                        + "   	UNION"
                                        + "    	select 'change_budget' AS tb_source,"
                                        + "    	cb.change_budget_datetime AS transaction_datetime,"
                                        + "    	bc.disbursement_category_name AS detail,"
                                        + "    	cb.budget_total,"
                                        + "     cb.from_disbursement_category_id as disbursement_category_id "
                                        + " 	from e_budget.change_budget cb "
                                        + "   	LEFT JOIN e_budget.disbursement_category bc On cb.to_disbursement_category_id = disbursement_category_id "
                                        + "    	WHERE cb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' "
                                        + "     UNION "
                                        + "    	select 'receive_change_budget' as tb_source,"
                                        + "    	cb.change_budget_datetime as transaction_datetime,"
                                        + "    	bc.disbursement_category_name as detail,"
                                        + "    	cb.budget_total,"
                                        + "	cb.to_disbursement_category_id as disbursement_category_id "
                                        + "	from e_budget.change_budget cb "
                                        + "    	left join e_budget.disbursement_category bc ON cb.from_disbursement_category_id = bc.disbursement_category_id "
                                        + "   	where cb.officeid= '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' "
                                        + "    	UNION "
                                        + "    	SELECT 'allocate_budget' AS tb_source,"
                                        + "     ab.allocate_budget_datetime AS transaction_datetime,"
                                        + "     p.project_name AS detail,"
                                        + "    	ab.allocate_budget_total AS  budget_total,"
                                        + "     disbursement_category_id "
                                        + "	FROM e_budget.allocate_budget ab LEFT JOIN e_budget.project p ON ab.project_id = p.project_id "
                                        + "     WHERE ab.officeid= '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' "
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
                                        + "group by bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,dc.disbursement_category_id,dc.disbursement_category_name";
                                ResultSet rs = mm.GetDataAsResultSet(query);
                                while (rs.next()) {
                            %>
                            <tr>
                                <td class="center"><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=acc.IsNullToEmtyString(rs.getString("budget_category_id"))%>&disbursement_category_id=<%=acc.IsNullToEmtyString(rs.getString("disbursement_category_id"))%>"> <%=acc.IsNullToEmtyString(rs.getString("budget_type_name"))%></a></td>
                                <td class="center"><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=acc.IsNullToEmtyString(rs.getString("budget_category_id"))%>&disbursement_category_id=<%=acc.IsNullToEmtyString(rs.getString("disbursement_category_id"))%>"> <%=acc.IsNullToEmtyString(rs.getString("budget_category_name"))%></a></td>
                                <td class="center"><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=acc.IsNullToEmtyString(rs.getString("budget_category_id"))%>&disbursement_category_id=<%=acc.IsNullToEmtyString(rs.getString("disbursement_category_id"))%>"> <%=acc.IsNullToEmtyString(rs.getString("disbursement_category_name"))%></a></td>
                                <td style="text-align: right;"><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=acc.IsNullToEmtyString(rs.getString("budget_category_id"))%>&disbursement_category_id=<%=acc.IsNullToEmtyString(rs.getString("disbursement_category_id"))%>"> <%=acc.NumberFormat(rs.getDouble("receive_total"), "#,###.##")%></a></td>
                                <td style="text-align: right;"><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=acc.IsNullToEmtyString(rs.getString("budget_category_id"))%>&disbursement_category_id=<%=acc.IsNullToEmtyString(rs.getString("disbursement_category_id"))%>"> <%=acc.NumberFormat(rs.getDouble("used_total"), "#,###.##")%></a></td>
                                <td style="text-align: right;"><a href="index.jsp?service=BudgetAllocateList&budget_category_id=<%=acc.IsNullToEmtyString(rs.getString("budget_category_id"))%>&disbursement_category_id=<%=acc.IsNullToEmtyString(rs.getString("disbursement_category_id"))%>"> <%=acc.NumberFormat(rs.getDouble("receive_total") - rs.getDouble("used_total"), "#,###.##")%></a></td>
                            </tr>  
                            <%                                }
                                rs.close();
                                mm.closeConnection();
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
            $(document).ready(function () {
                var oTable1 = $('#dynamic-table').dataTable({
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
