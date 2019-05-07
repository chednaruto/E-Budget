<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories(); %>
<%
    String project_name = "";
    String query = "Select * from e_budget.project WHERE project_id = '" + request.getParameter("project_id") + "'";
    DB2Manager dbms = new DB2Manager();
    ResultSet rs = dbms.GetDataAsResultSet(query);
    if (rs.next()) {
        project_name = rs.getString("project_name");
    }
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
            <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">หน้าหลัก</a></li>
            <li><a href="index.jsp?service=ProjectManager"> ข้อมูลโครงการ </a></li>
            <li> ข้อมูลตัวชี้วัดโครงการ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ตัวชี้วัดตาม : <%=project_name%> </small></h1>
                </div>
                <div class="row">
                    <div class="col-xs-12 center">
                        <button class="btn btn-success btn-white" style="float:right;" onclick="Goto('ProjectKPIAdding&project_id=<%=request.getParameter("project_id")%>')"><i class="ace-icon fa fa-plus"></i> เพิ่มตัวชี้วัด </button>
                    </div>
                </div>
                <div class="space-6"></div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center" style="width: 150px;" rowspan="2"> เมนู </th>
                                <th class="center" rowspan="2"> ชื่อตัวชี้วัด </th>
                                <th class="center" rowspan="2"> ผลการดำเนินงานที่ผ่านมา (ถ้ามี) </th>
                                <th class="center" rowspan="2"> ค่าเป้าหมาย </th>
                                <th class="center" colspan="5"> เกณฑ์การให้คะแนน </th>
                            </tr
                            <tr>
                                <th class="center">1</th>
                                <th class="center">2</th>
                                <th class="center">3</th>
                                <th class="center">4</th>
                                <th class="center">5</th>
                            </tr>
                        </thead>  
                        <tbody>
                            <%
                                query = "select * from e_budget.project_kpi where project_id= '" + request.getParameter("project_id") + "'";
                                rs = dbms.GetDataAsResultSet(query);
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
                                            <li> <a href="index.jsp?service=ProjectKPIAdding&project_id=<%=request.getParameter("project_id")%>&project_kpi_id=<%=rs.getString("project_kpi_id")%>"> <i class="fa fa-pencil-square-o blue"></i> แก้ไขกิจกรรม </a> </li>
                                            <li class="divider"></li>
                                            <li><a onclick="Delete(<%=rs.getString("project_kpi_id")%>);"> <i class="ace-icon fa fa-trash red"></i> ลบกิจกรรม </a> </li>
                                        </ul>
                                    </div>
                                </td>
                                <td class="left"><%=rs.getString("project_kpi_name")%></td>
                                <td class="left"><%=rs.getString("project_kpi_past_performance")%></td>
                                <td class="center"><%=rs.getString("project_kpi_goal_value")%></td>
                                <td class="center"><%=rs.getString("project_kpi_point_one")%></td>
                                <td class="center"><%=rs.getString("project_kpi_point_two")%></td>
                                <td class="center"><%=rs.getString("project_kpi_point_three")%></td>
                                <td class="center"><%=rs.getString("project_kpi_point_four")%></td>
                                <td class="center"><%=rs.getString("project_kpi_point_five")%></td>
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
                                                function Delete(project_kpi_id) {
                                                    var project_id = '<%=request.getParameter("project_id")%> '
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
                                                                    var project_kpi = {
                                                                        project_kpi_id: project_kpi_id,
                                                                        METHOD: "DELETE"
                                                                    };
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: "ProjectKPIServlet",
                                                                        data: {project_kpi: project_kpi},
                                                                        cache: false,
                                                                        success: function (data) {
                                                                            waitingDialog.hide();
                                                                            if (data=="TRUE") {
                                                                                Goto('ProjectKPIList&project_id='+project_id);
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