<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Accessories acc = new Accessories();
%>
<div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>
        <ul class="breadcrumb">
            <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.jsp"> หน้าหลัก </a></li>
            <li><a href="index.jsp?service=MainReport"> รายงาน </a></li>
            <li>งบประมาณที่รับและการเบิกจ่ายจำแนกตามหมวดงบประมาณ</li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>
    <div class="page-content">
        <div class="row">
            <div>
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายงาน งบประมาณที่รับและการเบิกจ่ายจำแนกตามหมวดงบประมาณ </small></h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12"> 
                <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="center" rowspan="2"> ประเภทงบ ฯ </th>
                            <th class="center" rowspan="2"> หมวดงบ ฯ </th>
                            <th class="center" rowspan="2"> จำนวนเงิน </th>
                            <th class="center" colspan="2"> ยอดโอนงบ ฯ </th>
                            <th class="center" colspan="2"> ยอดเปลี่ยนแปลงงบ ฯ </th>
                            <th class="center" rowspan="2"> ยอดจัดสรรโครงการ </th>
                            <th class="center" rowspan="2"> เบิกจ่ายงบประมาณ </th>
                            <th class="center" rowspan="2"> คงเหลือ </th>
                        </tr>
                        <tr>
                            <th class="center"> ยอดรับ </th>
                            <th class="center"> ยอดจ่าย </th>
                            <th class="center"> ยอดรับ </th>
                            <th class="center"> ยอดจ่าย </th>
                        </tr>
                    </thead>  
                    <tbody>
                        <%
                            String query = "SELECT  t.*,rc.budget_total,rtf.budget_total receive_tranfer_budget_total,tf.budget_total AS tranfer_budget_total,pm.payment_budget_total,cb.change_budget_total,rcb.change_budget_total AS receive_change_budget_total, al.allocate_budget_total FROM (	SELECT bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name  from (		select DISTINCT dc.budget_category_id 		from e_budget.receive_budget rb 		left join e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id 		where rb.officeid = 'xxxxxxxx' 		UNION 		select DISTINCT dc.budget_category_id 		from e_budget.tranfer_budget tb 		left join e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id 		where tb.to_officeid = 'xxxxxxxx' 		UNION 		SELECT dc.budget_category_id 		FROM e_budget.change_budget cb 		LEFT JOIN e_budget.disbursement_category dc ON cb.to_disbursement_category_id = dc.disbursement_category_id 		LEFT JOIN e_budget.disbursement_category dcr ON cb.from_disbursement_category_id = dcr.disbursement_category_id 		WHERE cb.officeid = 'xxxxxxxx' AND dc.budget_category_id <> dcr.budget_category_id 		GROUP BY dc.budget_category_id 	) AS t  	LEFT JOIN e_budget.budget_category bc ON t.budget_category_id = bc.budget_category_id 	LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id 	GROUP BY bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name ) AS t LEFT JOIN( 	SELECT bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,SUM(budget_total) AS budget_total 	FROM e_budget.receive_budget rb 	LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id 	LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id 	LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id 	WHERE officeid='xxxxxxxx' 	GROUP BY bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name ) AS rc ON t.budget_category_id = rc.budget_category_id  LEFT JOIN (	SELECT dc.budget_category_id,SUM(tb.budget_total) AS budget_total 	FROM e_budget.tranfer_budget tb 	LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id	WHERE from_officeid = 'xxxxxxxx' 	GROUP BY dc.budget_category_id ) AS tf ON t.budget_category_id = tf.budget_category_id LEFT JOIN (	SELECT dc.budget_category_id,SUM(tb.budget_total) AS budget_total 	FROM e_budget.tranfer_budget tb 	LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id 	WHERE to_officeid = 'xxxxxxxx' 	GROUP BY dc.budget_category_id ) AS rtf ON t.budget_category_id = rtf.budget_category_id LEFT JOIN (	SELECT dc.budget_category_id,SUM(pb.payment_budget_total) AS payment_budget_total 	FROM e_budget.payment_budget pb 	LEFT JOIN e_budget.disbursement_category dc ON pb.disbursement_category_id = dc.disbursement_category_id 	WHERE officeid='xxxxxxxx' 	GROUP BY dc.budget_category_id ) AS pm ON t.budget_category_id = pm.budget_category_id LEFT JOIN (	SELECT dc.budget_category_id,SUM(budget_total) AS change_budget_total 	FROM e_budget.change_budget cb 	LEFT JOIN e_budget.disbursement_category dc ON cb.from_disbursement_category_id = dc.disbursement_category_id 	LEFT JOIN e_budget.disbursement_category cdc ON cb.to_disbursement_category_id = cdc.disbursement_category_id 	WHERE cb.officeid = 'xxxxxxxx' AND cdc.budget_category_id <> dc.budget_category_id 	GROUP BY dc.budget_category_id ) AS cb ON t.budget_category_id = cb.budget_category_id LEFT JOIN (	SELECT dc.budget_category_id,SUM(budget_total) AS change_budget_total 	FROM e_budget.change_budget cb 	LEFT JOIN e_budget.disbursement_category dc ON cb.to_disbursement_category_id = dc.disbursement_category_id 	LEFT JOIN e_budget.disbursement_category dcr ON cb.from_disbursement_category_id = dcr.disbursement_category_id 	WHERE cb.officeid = 'xxxxxxxx' AND dc.budget_category_id <> dcr.budget_category_id 	GROUP BY dc.budget_category_id ) AS rcb ON t.budget_category_id = rcb.budget_category_id LEFT JOIN (	SELECT dc.budget_category_id,SUM(allocate_budget_total) AS allocate_budget_total 	FROM e_budget.allocate_budget ab 	LEFT JOIN e_budget.disbursement_category dc ON ab.disbursement_category_id = dc.disbursement_category_id 	WHERE ab.officeid= 'xxxxxxxx' 	GROUP BY dc.budget_category_id ) as al ON al.budget_category_id = t.budget_category_id";
                            query = query.replaceAll("xxxxxxxx", request.getSession().getAttribute("E-Budget-OFFICEID").toString());
                            DB2Manager dbms = new DB2Manager();
                            ResultSet rs = dbms.GetDataAsResultSet(query);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="center"><%=rs.getString("budget_type_name")%></td>
                            <td class="center"><%=rs.getString("budget_category_name")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("receive_tranfer_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><a href="index.jsp?service=Report1SubTranfer&budget_category_id=<%=rs.getString("budget_category_id")%>" ><%=acc.NumberFormat(rs.getDouble("tranfer_budget_total"),"#,###.##")%></a></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("receive_change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("allocate_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><a href="index.jsp?service=Report1SubPayment&budget_category_id=<%=rs.getString("budget_category_id")%>" ><%=acc.NumberFormat(rs.getDouble("payment_budget_total"),"#,###.##")%></a></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("budget_total")+rs.getDouble("receive_tranfer_budget_total")+rs.getDouble("receive_change_budget_total")-rs.getDouble("tranfer_budget_total")-rs.getDouble("change_budget_total")-rs.getDouble("allocate_budget_total")-rs.getDouble("payment_budget_total"),"#,###.##")%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script>
            $(document).ready(function () {

                var table = $('#dynamic-table').dataTable({
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
                table.fnPageChange('last');
            });
</script>