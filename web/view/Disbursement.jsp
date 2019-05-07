<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.RdGoal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
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
            <li> รายจ่าย </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายจ่าย </small></h1>
                </div>
                <div class="row">
                    <div class="col-xs-12 center">
                        <button class="btn btn-success btn-white" style="float:right;" onclick="Goto('DisbursementAdding')"><i class="ace-icon fa fa-plus"></i> เพิ่มข้อมูล </button> 
                    </div>
                </div>
                <div class="space-6"></div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center" style="width:5%;"> เมนู </th>
                                <th class="center"> ประเภทงบ ฯ </th>
                                <th class="center"> หมวดงบ ฯ </th>
                                <th class="center"> หมวดรายจ่าย </th>
                                <th class="center"> รายจ่าย </th>
                                <th class="center"> รหัสบัญชี GFMIS </th>
                                <th class="center" style="width:5%;"> สถานะ </th>
                            </tr>
                        </thead>  
                        <tbody>
                            <%
                                DB2Manager mm = new DB2Manager();
                                String query = "SELECT d.*,dc.disbursement_category_name,ga.gfmis_account_name,dc.budget_category_id,bd.budget_category_name,bt.budget_type_id,bt.budget_type_name "
                                        + "FROM e_budget.disbursement d "
                                        + "LEFT JOIN e_budget.disbursement_category dc ON d.disbursement_category_id = dc.disbursement_category_id "
                                        + "LEFT JOIN e_budget.gfmis_account ga ON d.gfmis_account_id = ga.gfmis_account_id "
                                        + "left join e_budget.budget_category bd ON bd.budget_category_id = dc.budget_category_id "
                                        + "left join e_budget.budget_type bt ON bd.budget_type_id = bt.budget_type_id";
                                ResultSet rs = mm.GetDataAsResultSet(query);
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
                                            <li> 
                                                <a href="#" onclick="Goto('DisbursementAdding&disbursement_id=<%=acc.IsNullToEmtyString(rs.getString("disbursement_id"))%>')"> 
                                                    <i class="fa fa-pencil-square-o blue"></i> แก้ไขรายการ </a> 
                                            </li>

                                            <li class="divider"></li>
                                            <li>
                                                <a href="#" onclick="DEL('<%=acc.IsNullToEmtyString(rs.getString("disbursement_id"))%>')"> 
                                                    <i class="ace-icon fa fa-trash red"></i> ลบรายการ </a> 
                                            </li>

                                        </ul>
                                    </div>
                                </td>
                                <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("budget_type_name"))%> </td>
                                <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("budget_category_name"))%>
                                <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("disbursement_category_name"))%></td>
                                <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("disbursement_name"))%></td>
                                <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("gfmis_account_id"))%></td>
                                <td class="center">
                                    <%
                                        if (acc.IsNullToEmtyString(rs.getString("disbursement_status")).equals("Y")) {
                                            out.println("<div class='btn-group'>");
                                            out.println("<button data-toggle='dropdown' class='btn btn-success btn-white dropdown-toggle btn-sm' aria-expanded='false'>");
                                            out.println("<i class='ace-icon fa fa-check green'></i> เปิดใช้งาน ");
                                            out.println("</button>");
                                            out.println("</div>");
                                        } else {
                                            out.println("<div class='btn-group'>");
                                            out.println("<button data-toggle='dropdown' class='btn btn-danger btn-white dropdown-toggle btn-sm' aria-expanded='false'>");
                                            out.println("<i class='ace-icon fa fa-times red'></i> ปิดใช้งาน ");
                                            out.println("</button>");
                                            out.println("</div>");
                                        }
                                    %>

                                </td>
                            </tr>  
                            <%      
                                }
                                rs.close();
                                mm.closeConnection();
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
    <script src="assets/js/dataTables.buttons.min.js"></script>
    <script src="assets/js/buttons.flash.min.js"></script>
    <script src="assets/js/buttons.html5.min.js"></script>
    <script src="assets/js/buttons.print.min.js"></script>
    <script src="assets/js/buttons.colVis.min.js"></script>
    <script src="assets/js/dataTables.select.min.js"></script>
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
                                                            },"pageLength": 50
                                                        });
                                                    });
                                                    function DEL(disbursement_id) {
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
                                                                        var disbursement = {
                                                                            disbursement_id: disbursement_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "DisbursementServlet",
                                                                            data: {disbursement: disbursement},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data == "TRUE") {
                                                                                    Goto('Disbursement');
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
