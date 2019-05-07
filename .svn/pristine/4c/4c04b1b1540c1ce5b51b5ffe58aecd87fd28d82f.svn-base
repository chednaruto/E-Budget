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
            <li><a href="index.jsp?service=ActiveProjectList"> ข้อมูลโครงการที่ได้รับอนุมัติ </a></li>
            <li> เบิกจ่ายงบประมาณ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายการเบิกจ่ายงบประมาณ </small></h1>
                </div>
                <div class="row">
                    <div class="col-xs-12 center">
                        <button class="btn btn-success btn-white" style="float:right;" onclick="Goto('TermOfPaymentResultAdding&project_id=<%= request.getParameter("project_id")%>')"><i class="ace-icon fa fa-plus"></i> เพิ่มรายการเบิกจ่ายงบประมาณ </button>
                    </div>
                </div>
                <div class="space-6"></div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center"> เมนู </th>
                                <th class="center"> งวด </th>
                                <th class="center"> วันที่ส่งมอบ </th>
                                <th class="center"> วันที่ตรวจรับ </th>
                                <th class="center"> วันที่อนุมัติจ่ายเงิน </th>
                                <th class="center"> วันที่จ่ายเงิน </th>
                                <th class="center"> รายจ่าย </th>
                                <th class="center"> จำนวนเงิน </th>

                            </tr>
                        </thead>  
                        <tbody>
                            <%
                                String query = "SELECT r.*,d.disbursement_name FROM e_budget.term_of_payment_result r LEFT JOIN e_budget.disbursement d ON r.disbursement_id = d.disbursement_id  WHERE r.project_id='" + request.getParameter("project_id") + "' ORDER BY r.term_of_payment_id ASC";
                                DB2Manager dbms = new DB2Manager();
                                ResultSet rs = dbms.GetDataAsResultSet(query);
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
                                            <li> <a href="index.jsp?service=TermOfPaymentResultAdding&project_id=<%=rs.getString("project_id")%>&term_of_payment_id=<%=rs.getString("term_of_payment_id")%>"> <i class="fa fa-pencil-square-o blue"></i> แก้ไขรายการ </a> </li>
                                            <li class="divider"></li>
                                            <li><a href="#" onclick="DeleteTermOfPaymentResult(<%=rs.getInt("term_of_payment_id")%>)"> <i class="ace-icon fa fa-trash red"></i> ลบรายการ </a> </li>
                                        </ul>
                                    </div>
                                </td>
                                <td class="center"><%="งวดที่ " + rs.getString("term_of_payment_id")%></td>
                                <td class="center"><%=acc.GetThaiDate(rs.getString("term_of_payment_result_deliver_date"))%></td>
                                <td class="center"><%=acc.GetThaiDate(rs.getString("term_of_payment_result_check_date"))%></td>
                                <td class="center"><%=acc.GetThaiDate(rs.getString("term_of_payment_result_approve_date"))%></td>
                                <td class="center"><%=acc.GetThaiDate(rs.getString("term_of_payment_result_payment_date"))%></td>
                                <td class="center"><%=rs.getString("disbursement_name")%></td>
                                <td class="center"><%=acc.NumberFormat(rs.getDouble("term_of_payment_result_budget"), "#,###.##")%></td>
                                
                                <%

                                    }

                                %>
                            </tr> 

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
                                                function DeleteTermOfPaymentResult(term_of_payment_id) {
                                                    var project_id = "<%=request.getParameter("project_id")%>";
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
                                                                    var term_of_payment_result = {
                                                                        project_id: project_id,
                                                                        term_of_payment_id: term_of_payment_id,
                                                                        METHOD: "DELETE"
                                                                    };
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: "TermOfPaymentResultServlet",
                                                                        data: {term_of_payment_result: term_of_payment_result},
                                                                        cache: false,
                                                                        success: function (data) {
                                                                            waitingDialog.hide();
                                                                            if (data == "TRUE") {
                                                                                Goto("TermOfPaymentResult&project_id=" + project_id);
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