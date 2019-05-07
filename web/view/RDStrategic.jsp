<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.RdStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
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
            <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">หน้าหลัก</a></li>
            <li> ยุทธศาสตร์กรมสรรพากร </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ยุทธศาสตร์กรมสรรพากร </small></h1>
                </div>
                <div class="row">
                    <div class="col-xs-12 center">
                        <button class="btn btn-success btn-white" style="float:right;" onclick="Goto('RDStrategicAdd')"><i class="ace-icon fa fa-plus"></i> เพิ่มข้อมูล </button> 
                    </div>
                </div>
                <div class="space-6"></div>
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center"> เมนู </th>
                                <th class="center" style="width:70%;"> ยุทธศาสตร์กรมสรรพากร </th>
                                <th class="center"> สถานะ </th>
                            </tr>
                        </thead>  
                        <tbody>
                            <!--<?php
                                                            $sql = "SELECT * FROM rd_strategic";
                                                            $rs = mysql_query($sql,$connection);
                                                            while($row = mysql_fetch_array($rs)){
                                                    ?>-->
                            <%
                                String query = "SELECT * FROM e_budget.rd_strategic";
                                DB2Manager mm = new DB2Manager();
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
                                                <a href="#" onclick="Goto('RDStrategicAdd&rd_strategic_id=<%=acc.IsNullToEmtyString(rs.getString("rd_strategic_id"))%>')"> 
                                                    <i class="fa fa-pencil-square-o blue"></i> แก้ไขรายการ </a> 
                                            </li>

                                            <%
                                                RdStrategic rsg = new RdStrategic();
                                                rsg.setRd_strategic_id(acc.IsNullToEmtyString(rs.getString("rd_strategic_id")));
                                                if (rsg.CheckingUsage(rsg)) {

                                            %>
                                            <li class="divider"></li>
                                            <li>
                                                <a href="#" onclick="DEL('<%=acc.IsNullToEmtyString(rs.getString("rd_strategic_id"))%>')"> 
                                                    <i class="ace-icon fa fa-trash red"></i> ลบรายการ 
                                                </a> 
                                            </li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </td>
                                <td class="left"> <%=acc.IsNullToEmtyString(rs.getString("rd_strategic_name"))%> </td>
                                <td class="center">
                                    <%
                                        if (acc.IsNullToEmtyString(rs.getString("rd_strategic_status")).equals("Y")) {
                                            out.println("<div class='btn-group'>");
                                            out.println("<button data-toggle='dropdown' class='btn btn-success btn-white dropdown-toggle btn-sm' aria-expanded='false'>");
                                            out.println("<i class='ace-icon fa fa-check green'></i> เปิดใช้งาน ");
                                            out.println("</button>");
                                            out.println("</div>");
                                        } else {

                                            out.println("<div class='btn-group'>");
                                            out.println("<button data-toggle='dropdown' class='btn btn-danger btn-white dropdown-toggle btn-sm' aria-expanded='false'>");
                                            out.println("<i class='ace-icon fa fa-times red'></i> ปิดใช้งาน ");
                                            out.println("</button");
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
                                                    function DEL(rd_strategic_id) {
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
                                                                        var rd_strategic = {
                                                                            rd_strategic_id: rd_strategic_id,
                                                                            METHOD: "DELETE"
                                                                        };
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "RDStrategicServlet",
                                                                            data: {rd_strategic: rd_strategic},
                                                                            cache: false,
                                                                            success: function (data) {
                                                                                waitingDialog.hide();
                                                                                if (data == "TRUE") {
                                                                                    Goto('RDStrategic');
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