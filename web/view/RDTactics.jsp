<%@page import="rd.ebudget.tools.DB2Manager"%>
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
            <li> กลยุทธ์ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> กลยุทธ์ </small></h1>
                </div>
                <div class="row">
                    <div class="col-xs-12 center">
                        <button class="btn btn-success btn-white" style="float:right;" onclick="Goto('RDTacticsAdd')"><i class="ace-icon fa fa-plus"></i> เพิ่มข้อมูล </button> 
                    </div>
                </div>
                <div class="space-6"></div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center"> เมนู </th>
                                <th class="center" style="width:40%;"> เป้าประสงค์ </th>
                                <th class="center" style="width:40%;"> กลยุทธ์ </th>
                                <th class="center"> สถานะ </th>
                            </tr>
                        </thead>  
                        <tbody>
                            <%
                                DB2Manager mm = new DB2Manager();
                                String query = "SELECT rg.*,rs.rd_goal_name FROM e_budget.rd_tactics rg LEFT JOIN e_budget.rd_goal rs ON rg.rd_goal_id = rs.rd_goal_id";
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
                                                <a href="#" onclick="Goto('RDTacticsAdd&rd_tactics_id=<%=acc.IsNullToEmtyString(rs.getString("rd_tactics_id"))%>')"> 
                                                    <i class="fa fa-pencil-square-o blue"></i> แก้ไขรายการ </a> 
                                            </li>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="#" onclick="DEL('<%=acc.IsNullToEmtyString(rs.getString("rd_tactics_id"))%>')"> 
                                                    <i class="ace-icon fa fa-trash red"></i> ลบรายการ </a> 
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td class="left"> <%=acc.IsNullToEmtyString(rs.getString("rd_goal_name"))%> </td>
                                <td class="left"> <%=acc.IsNullToEmtyString(rs.getString("rd_tactics_name"))%> </td>
                                <td class="center">
                                    <%
                                        if (acc.IsNullToEmtyString(rs.getString("rd_tactics_status")).equals("Y")) {
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
                                                    function DEL(rd_tactics_id) {
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
                                                                        var rd_tactics = {
                                                                            rd_tactics_id: rd_tactics_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "RDTacticsServlet",
                                                                            data: {rd_tactics: rd_tactics},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data) {
                                                                                    Goto('RDTactics');
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
