<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    table th {
        position: -webkit-sticky;
        position: sticky;
        top: 0;
        z-index: 5;
        background: #ddd;
    }
    
</style>
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
            <li>งบประมาณที่รับและการเบิกจ่ายจำแนกตามรายจ่าย</li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>
    <div class="page-content">
        <div class="row">
            <div>
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายงาน งบประมาณที่รับและการเบิกจ่ายจำแนกตามรายจ่าย </small></h1>
                </div>
            </div>
        </div>
        <div class="row" id="scss" style="overflow-x: scroll;">
            <div style="width: 2000px;height: 600px;"> 
                <table id="dynamic-table" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="center" rowspan="2"> ประเภทงบ ฯ </th>
                            <th class="center" rowspan="2"> หมวดงบ ฯ </th>
                            <th class="center" rowspan="2"> หมวดรายจ่าย </th>
                            <th class="center" rowspan="2"> แผนงาน </th>
                            <th class="center" rowspan="2"> รายจ่าย </th>
                            <th class="center" rowspan="2"> จำนวนเงิน </th>
                            <th class="center">รับโอนจากหน่วยงานอื่น</th>
                            <th class="center">โอนให้หน่อยงานอื่น</th>
                            <th class="center"> รับจากงบอื่น </th>
                            <th class="center"> เปลี่ยนแปลงเป็นงบอื่น </th>
                            <th class="center" rowspan="2"> ยอดจัดสรรโครงการ </th>
                            <th class="center" rowspan="2"> เบิกจ่ายงบประมาณ </th>
                            <th class="center" rowspan="2"> คงเหลือ </th>
                        </tr>
                        <tr>

                        </tr>
                    </thead>  
                    <tbody>
                        <%
                            String query = "SELECT "
                                    + "(SELECT SUM(payment_budget_total) "
                                    + "FROM e_budget.payment_budget pb "
                                    + "LEFT JOIN e_budget.disbursement d ON pb.disbursement_id = d.disbursement_id "
                                    + "LEFT JOIN e_budget.plan_type pt ON d.plan_type_id = pt.plan_type_id "
                                    + "LEFT JOIN e_budget.disbursement_category dc1 ON d.disbursement_category_id = dc1.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bc ON dc1.budget_category_id = bc.budget_category_id "
                                    + "WHERE bc.budget_type_id =  bt.budget_type_id AND pb.officeid='"+request.getSession().getAttribute("E-Budget-OFFICEID")+"') AS payment_budget_total ,"
                                    + "(SELECT SUM(rb.budget_total) AS receive_budget_total "
                                    + "FROM e_budget.receive_budget rb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id =dc.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                    + "WHERE rb.officeid='"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND bc.budget_type_id = bt.budget_type_id ) AS receive_budget_total ,"
                                    + "(SELECT sum(budget_total) As tranfer_budget_total "
                                    + "FROM e_budget.tranfer_budget tb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                    + "where tb.to_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' and bc.budget_type_id = bt.budget_type_id) AS receive_tranfer_budget_total,"
                                    + "(SELECT sum(budget_total) As tranfer_budget_total "
                                    + "FROM e_budget.tranfer_budget tb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                    + "where tb.from_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' and bc.budget_type_id = bt.budget_type_id ) AS tranfer_budget_total,"
                                    + "(SELECT SUM(budget_total) AS receive_change_budget_total "
                                    + "FROM e_budget.change_budget cb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON cb.to_disbursement_category_id = dc.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                    + "WHERE cb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND bc.budget_type_id = bt.budget_type_id) AS receive_change_budget_total,"
                                    + "(SELECT SUM(budget_total) AS change_budget_total "
                                    + "FROM e_budget.change_budget cb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON cb.from_disbursement_category_id = dc.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                    + "WHERE cb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND bc.budget_type_id = bt.budget_type_id) AS change_budget_total,"
                                    + "(SELECT SUM(allocate_budget_total) AS allocate_budget_total "
                                    + "FROM e_budget.allocate_budget ab "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON ab.disbursement_category_id = dc.disbursement_category_id "
                                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                    + "WHERE ab.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND bc.budget_type_id = bt.budget_type_id) AS allocate_budget_total,"
                                    + "bt.* FROM e_budget.budget_type bt";
                            DB2Manager dbms = new DB2Manager();
                            ResultSet rs = dbms.GetDataAsResultSet(query);
                            while (rs.next()) {
                        %>
                        <tr style="background-color: #009ceb;color: #ffffff;">
                            <td class="left" colspan="2"><%=rs.getString("budget_type_name")%></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("receive_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("receive_tranfer_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("tranfer_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("receive_change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("allocate_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rs.getDouble("payment_budget_total"),"#,###.##")%></td>
                            <td class="center"><%=acc.NumberFormat(rs.getDouble("receive_budget_total")+rs.getDouble("receive_tranfer_budget_total")+rs.getDouble("receive_change_budget_total")-rs.getDouble("tranfer_budget_total")-rs.getDouble("change_budget_total")-rs.getDouble("allocate_budget_total")-rs.getDouble("payment_budget_total"),"#,###.##")%></td>
                        </tr>
                        <%
                            query = "SELECT (SELECT SUM(payment_budget_total) "
                                    + "FROM e_budget.payment_budget pb "
                                    + "LEFT JOIN e_budget.disbursement d ON pb.disbursement_id = d.disbursement_id "
                                    + "LEFT JOIN e_budget.plan_type pt ON d.plan_type_id = pt.plan_type_id "
                                    + "LEFT JOIN e_budget.disbursement_category dc1 ON d.disbursement_category_id = dc1.disbursement_category_id "
                                    + "WHERE dc1.budget_category_id =  bc.budget_category_id AND pb.officeid='"+request.getSession().getAttribute("E-Budget-OFFICEID")+"') AS payment_budget_total,"
                                    + "(SELECT SUM(rb.budget_total) AS receive_budget_total "
                                    + "FROM e_budget.receive_budget rb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id =dc.disbursement_category_id "
                                    + "WHERE rb.officeid='"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND dc.budget_category_id = bc.budget_category_id ) AS receive_budget_total,"
                                    + "(SELECT sum(budget_total) As tranfer_budget_total "
                                    + "FROM e_budget.tranfer_budget tb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                                    + "where tb.to_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' and dc.budget_category_id = bc.budget_category_id) AS receive_tranfer_budget_total,"
                                    + "(SELECT sum(budget_total) As tranfer_budget_total "
                                    + "FROM e_budget.tranfer_budget tb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id "
                                    + "where tb.from_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' and dc.budget_category_id = bc.budget_category_id ) AS tranfer_budget_total,"
                                    + "(SELECT SUM(budget_total) AS receive_change_budget_total "
                                    + "FROM e_budget.change_budget cb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON cb.to_disbursement_category_id = dc.disbursement_category_id "
                                    + "WHERE cb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND dc.budget_category_id = bc.budget_category_id) AS receive_change_budget_total,"
                                    + "(SELECT SUM(budget_total) AS receive_change_budget_total "
                                    + "FROM e_budget.change_budget cb "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON cb.from_disbursement_category_id = dc.disbursement_category_id "
                                    + "WHERE cb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND dc.budget_category_id = bc.budget_category_id) as change_budget_total,"
                                    + "(SELECT SUM(allocate_budget_total) AS allocate_budget_total "
                                    + "FROM e_budget.allocate_budget ab "
                                    + "LEFT JOIN e_budget.disbursement_category dc ON ab.disbursement_category_id = dc.disbursement_category_id "
                                    + "WHERE ab.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND dc.budget_category_id = bc.budget_category_id ) AS allocate_budget_total,"
                                    + "bc.* FROM e_budget.budget_category bc WHERE bc.budget_type_id = " + rs.getString("budget_type_id");
                            ResultSet rsbc = dbms.GetDataAsResultSet(query);
                            while (rsbc.next()) {
                        %>
                        <tr style="background-color: #ffff00;">
                            <td style="background-color: #ffffff;"></td>
                            <td class="left"><%=rsbc.getString("budget_category_name")%></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("receive_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("receive_tranfer_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("tranfer_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("receive_change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("allocate_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("payment_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsbc.getDouble("receive_budget_total")+rsbc.getDouble("receive_tranfer_budget_total")+rsbc.getDouble("receive_change_budget_total")-rsbc.getDouble("tranfer_budget_total")-rsbc.getDouble("change_budget_total")-rsbc.getDouble("allocate_budget_total")-rsbc.getDouble("payment_budget_total"),"#,###.##")%></td>
                        </tr>

                        <%
                            query = "SELECT (SELECT SUM(payment_budget_total) "
                                    + "FROM e_budget.payment_budget pb "
                                    + "LEFT JOIN e_budget.disbursement d1 ON pb.disbursement_id = d1.disbursement_id "
                                    + "LEFT JOIN e_budget.plan_type pt ON d1.plan_type_id = pt.plan_type_id "
                                    + "WHERE pb.disbursement_category_id = d.disbursement_category_id AND pb.officeid= '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"') AS payment_budget_total,"
                                    + "(SELECT SUM(rb.budget_total) AS receive_budget_total "
                                    + "FROM e_budget.receive_budget rb "
                                    + "WHERE rb.officeid='"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND rb.disbursement_category_id = d.disbursement_category_id) AS receive_budget_total,"
                                    + "(SELECT sum(budget_total) As tranfer_budget_total "
                                    + "FROM e_budget.tranfer_budget tb "
                                    + "where tb.to_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' and tb.disbursement_category_id = d.disbursement_category_id) AS receive_tranfer_budget_total,"
                                    + "(SELECT sum(budget_total) As tranfer_budget_total "
                                    + "FROM e_budget.tranfer_budget tb "
                                    + "where tb.from_officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' and tb.disbursement_category_id = d.disbursement_category_id) AS tranfer_budget_total,"
                                    + "(SELECT SUM(budget_total) AS receive_change_budget_total "
                                    + "FROM e_budget.change_budget cb "
                                    + "WHERE cb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND cb.to_disbursement_category_id = d.disbursement_category_id) AS receive_change_budget_total,"
                                    + "(SELECT SUM(budget_total) AS change_budget_total "
                                    + "FROM e_budget.change_budget cb "
                                    + "WHERE cb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND cb.from_disbursement_category_id = d.disbursement_category_id ) AS change_budget_total,"
                                    + "(SELECT SUM(allocate_budget_total) AS allocate_budget_total "
                                    + "FROM e_budget.allocate_budget ab "
                                    + "WHERE ab.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND ab.disbursement_category_id = d.disbursement_category_id) AS allocate_budget_total,"
                                    + "d.* FROM e_budget.disbursement_category d where budget_category_id = " + rsbc.getString("budget_category_id");
                            ResultSet rsdc = dbms.GetDataAsResultSet(query);
                            while (rsdc.next()) {
                        %>
                        <tr style="background-color: #00BE67;">
                            <td style="background-color: #ffffff;"></td>
                            <td class="left" style="background-color: #ffffff;"></td>
                            <td class="left"><%=rsdc.getString("disbursement_category_name")%></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("receive_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("receive_tranfer_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("tranfer_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("receive_change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("change_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("allocate_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("payment_budget_total"),"#,###.##")%></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsdc.getDouble("receive_budget_total")+rsdc.getDouble("receive_tranfer_budget_total")+rsdc.getDouble("receive_change_budget_total")-rsdc.getDouble("tranfer_budget_total")-rsdc.getDouble("change_budget_total")-rsdc.getDouble("allocate_budget_total")-rsdc.getDouble("payment_budget_total"),"#,###.##")%></td>
                        </tr>
                        <%
                            query = "select (SELECT SUM(payment_budget_total) "
                                    + "FROM e_budget.payment_budget pb "
                                    + "LEFT JOIN e_budget.disbursement d ON pb.disbursement_id = d.disbursement_id "
                                    + "LEFT JOIN e_budget.plan_type pt ON d.plan_type_id = pt.plan_type_id "
                                    + "WHERE pt.plan_type_id = p.plan_type_id AND pb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND pb.disbursement_category_id = " + rsdc.getString("disbursement_category_id") + " ) AS payment_budget_total,"
                                    + "p.plan_type_id,p.plan_type_name from e_budget.disbursement d inner join e_budget.plan_type p ON d.plan_type_id=p.plan_type_id where d.disbursement_category_id = " + rsdc.getString("disbursement_category_id") + " group by p.plan_type_id,p.plan_type_name";
                            ResultSet rspl = dbms.GetDataAsResultSet(query);
                            while (rspl.next()) {
                        %>
                        <tr style="background-color: #cc00cc;color: #ffffff;">
                            <td style="background-color: #ffffff;"></td>
                            <td style="background-color: #ffffff;"></td>
                            <td style="background-color: #ffffff;"></td>
                            <td class="left" colspan="2"><%=rspl.getString("plan_type_name")%></td>
                            <td class="left"></td>
                            <td class="left"></td>
                            <td class="left"></td>
                            <td class="left"></td>
                            <td class="left"></td>
                            <td class="left"></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rspl.getDouble("payment_budget_total"),"#,###.##")%></td>
                            <td class="left"></td>
                        </tr>
                        <%
                            query = "SELECT d.*,"
                                    + "(SELECT SUM(payment_budget_total) "
                                    + "FROM e_budget.payment_budget pb "
                                    + "WHERE pb.officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"' AND pb.disbursement_id = d.disbursement_id) AS payment_budget_total "
                                    + "FROM e_budget.disbursement d where d.plan_type_id = " + rspl.getString("plan_type_id") + " and disbursement_category_id = " + rsdc.getString("disbursement_category_id");
                            ResultSet rsd = dbms.GetDataAsResultSet(query);
                            while (rsd.next()) {
                        %>
                        <tr>
                            <td></td>
                            <td class="left"></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td class="left"><%=rsd.getString("disbursement_name")%></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td class="center"></td>
                            <td style="text-align: right;"><%=acc.NumberFormat(rsd.getDouble("payment_budget_total"),"#,###.##")%></td>
                            <td class="center"></td>
                        </tr>
                        <%
                                            }
                                        }
                                    }
                                }
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
                /*$('#scss').scroll(function (e) {
                    $('thead').css("left", -$("tbody").scrollLeft()); //fix the thead relative to the body scrolling
                    $('thead th:nth-child(1)').css("left", $("#scss").scrollLeft()); //fix the first cell of the header
                    $('thead th:nth-child(2)').css("left", $("#scss").scrollLeft()); //fix the first cell of the header
                    $('thead th:nth-child(3)').css("left", $("#scss").scrollLeft()); //fix the first cell of the header
                    $('thead th:nth-child(4)').css("left", $("#scss").scrollLeft()); //fix the first cell of the header
                    $('thead th:nth-child(5)').css("left", $("#scss").scrollLeft()); //fix the first cell of the header
                    $('tbody td:nth-child(1)').css("left", $("#scss").scrollLeft()); //fix the first column of tdbody
                    $('tbody td:nth-child(2)').css("left", $("#scss").scrollLeft()); //fix the first column of tdbody
                    $('tbody td:nth-child(3)').css("left", $("#scss").scrollLeft()); //fix the first column of tdbody
                    $('tbody td:nth-child(4)').css("left", $("#scss").scrollLeft()); //fix the first column of tdbody
                    $('tbody td:nth-child(5)').css("left", $("#scss").scrollLeft()); //fix the first column of tdbody
                });*/
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