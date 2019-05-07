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
            <li><a href="index.jsp?service=Report1"> งบประมาณที่รับและการเบิกจ่ายจำแนกตามหมวดงบประมาณ</a></li>
            <li> รายการโอนงบประมาณ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>
    <div class="page-content">
        <div class="row">
            <div>
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i>  รายการโอนงบประมาณ </small></h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12"> 
                <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="center" > ประเภทงบ ฯ </th>
                            <th class="center" > หมวดงบ ฯ </th>
                            <th class="center" > หมวดรายจ่าย </th>
                            <th class="center" > หน่วยรับโอน </th>
                            <th class="center" > ยอดโอนงบ ฯ </th>
                            <th class="center" > วันที่ </th>
                        </tr>
                    </thead>  
                    <tbody>
                        <%
                            String query = "select bt.budget_type_id,bt.budget_type_name,bc.budget_category_id,bc.budget_category_name,dc.disbursement_category_id,dc.disbursement_category_name,o.officeid,o.officename,tb.budget_total,tb.tranfer_budget_datetime from e_budget.tranfer_budget tb inner join e_budget.disbursement_category dc ON tb.disbursement_category_id = dc.disbursement_category_id and dc.budget_category_id = xx inner join e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id inner join e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id left join e_budget.office o ON tb.to_officeid = o.officeid where tb.from_officeid = 'xxxxxxxx' order by tb.tranfer_budget_datetime ASC";
                            query = query.replaceAll("xxxxxxxx", request.getSession().getAttribute("E-Budget-OFFICEID").toString());
                            query = query.replaceAll("xx", request.getParameter("budget_category_id"));
                            DB2Manager dbms = new DB2Manager();
                            ResultSet rs = dbms.GetDataAsResultSet(query);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="center"><%=rs.getString("budget_type_name")%></td>
                            <td class="center"><%=rs.getString("budget_category_name")%></td>
                            <td class="center"><%=rs.getString("disbursement_category_name")%></td>
                            <td style="text-align: left;"><%=rs.getString("officename")%></td>
                            <td style="text-align: right;"><%= acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                            <td style="text-align: center;"><%=acc.GetThaiDateTime(rs.getString("tranfer_budget_datetime"))%></td>
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