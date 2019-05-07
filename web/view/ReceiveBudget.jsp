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
            <li> รายการรับงบประมาณ </li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header">
                    <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> รายการรับงบประมาณ </small></h1>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="widget-box transparent" id="recent-box">
                            <div class="widget-header">
                                <div class="widget-toolbar no-border">
                                    <ul class="nav nav-tabs" id="recent-tab">
                                        <li class="active">
                                            <a data-toggle="tab" href="#task-tab">รายการรับงบประมาณ</a>
                                        </li>

                                        <li>
                                            <a data-toggle="tab" href="#member-tab">รายงานสรุป</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main padding-4">
                                    <div class="tab-content padding-8">
                                        <div id="task-tab" class="tab-pane active">
                                            <div class="row">
                                                <div class="col-xs-12 center">
                                                    <button class="btn btn-success btn-white" style="float:right;" onclick="Goto('ReceiveBudgetAdding')"><i class="ace-icon fa fa-plus"></i> เพิ่มข้อมูล </button> 
                                                </div>
                                            </div>
                                            <div class="space-6"></div>
                                            <div>
                                                <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="center" style="width: 10%;"> เมนู </th>
                                                            <th class="center"> ประเภทงบประมาณ </th>
                                                            <th class="center"> หมวดงบประมาณ </th>
                                                            <th class="center"> หมวดรายจ่าย </th>
                                                            <th class="center"> ยอดเงิน </th>
                                                            <th class="center"> ปีงบประมาณ </th>
                                                            <th class="center"> วันที่รับโอนงบประมาณ </th>
                                                        </tr>
                                                    </thead>  
                                                    <tbody>
                                                        <%
                                                            DB2Manager dbms = new DB2Manager();
                                                            String query = "SELECT rb.*,bc.budget_category_name,bt.budget_type_name,d.disbursement_category_name "
                                                                    + "FROM e_budget.receive_budget rb "
                                                                    + "LEFT JOIN e_budget.budget_category bc ON rb.budget_category_id = bc.budget_category_id "
                                                                    + "LEFT JOIN e_budget.budget_type bt ON rb.budget_type_id = bt.budget_type_id "
                                                                    + "LEFT JOIN e_budget.disbursement_category d ON rb.disbursement_category_id = d.disbursement_category_id "
                                                                    + "WHERE rb.officeid = '" + request.getSession().getAttribute("E-Budget-OFFICEID") + "' ";
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
                                                                        <li> 
                                                                            <a href="#" onclick="Goto('ReceiveBudgetAdding&receive_budget_id=<%=acc.IsNullToEmtyString(rs.getString("receive_budget_id"))%>')"> 
                                                                                <i class="fa fa-pencil-square-o blue"></i> แก้ไขรายการ </a> 
                                                                        </li>

                                                                        <li class="divider"></li>
                                                                        <li>
                                                                            <a href="#" onclick="DEL('<%=acc.IsNullToEmtyString(rs.getString("receive_budget_id"))%>')"> 
                                                                                <i class="ace-icon fa fa-trash red"></i> ลบรายการ </a> 
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("budget_type_name"))%></td>
                                                            <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("budget_category_name"))%></td>
                                                            <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("disbursement_category_name"))%></td>
                                                            <td style="text-align: right;"> <%=acc.NumberFormat(rs.getDouble("budget_total"), "#,###.##")%></td>
                                                            <td class="center"> <%=acc.IsNullToEmtyString(rs.getString("budget_receive_year"))%> </td>
                                                            <td class="center"> <%=acc.GetThaiDate(rs.getString("budget_receive_date"))%></td>
                                                        </tr>  
                                                        <%                                }

                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="member-tab" class="tab-pane">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <table id="" class="table table-bordered table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th class="center"> ประเภทงบประมาณ </th>
                                                                <th class="center"> หมวดงบประมาณ </th>
                                                                <th class="center"> หมวดรายจ่าย </th>
                                                                <th class="center"> ยอดเงิน </th>
                                                            </tr>
                                                        </thead>  
                                                        <tbody>

                                                            <%                                                                query = "select * from e_budget.budget_type";
                                                                ResultSet rsbt = dbms.GetDataAsResultSet(query);
                                                                while (rsbt.next()) {
                                                                    out.print("<tr class='green'>");
                                                                    out.print("<td class='left' colspan='4'> " + rsbt.getString("budget_type_name") + " </td>");
                                                                    out.print("</tr>");
                                                                    query = "SELECT * FROM e_budget.budget_category WHERE budget_type_id = " + rsbt.getString("budget_type_id");
                                                                    ResultSet rsbc = dbms.GetDataAsResultSet(query);
                                                                    while (rsbc.next()) {
                                                                        out.print("<tr>");
                                                                        out.print("<td class='left'></td>");
                                                                        out.print("<td class='left' colspan='3'> " + rsbc.getString("budget_category_name") + " </td>");
                                                                        out.print("</tr>");
                                                                        query = "select * from e_budget.disbursement_category where budget_category_id = " + rsbc.getString("budget_category_id");
                                                                        ResultSet rsdc = dbms.GetDataAsResultSet(query);
                                                                        while (rsdc.next()) {
                                                                            out.print("<tr>");
                                                                            out.print("<td class='left'></td>");
                                                                            out.print("<td class='left'></td>");
                                                                            out.print("<td class='left'> " + rsdc.getString("disbursement_category_name") + " </td>");
                                                                            query = "select SUM(budget_total) AS budget_total  from e_budget.receive_budget where disbursement_category_id = "+rsdc.getString("disbursement_category_id")+" AND officeid = '"+request.getSession().getAttribute("E-Budget-OFFICEID")+"'";
                                                                            ResultSet rstc = dbms.GetDataAsResultSet(query);
                                                                            if(rstc.next()){
                                                                                out.print("<td class='left''> " + acc.NumberFormat(rstc.getDouble("budget_total"),"#,###.##") + " </td>");
                                                                            }else{
                                                                                out.print("<td class='left'> " + acc.NumberFormat(0, "#,###.##") + " </td>");
                                                                            }
                                                                            
                                                                            out.print("</tr>");
                                                                        }
                                                                    }
                                                                }
                                                            %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div><!-- /.row -->
                                        </div><!-- /.#member-tab -->
                                    </div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div><!-- /.widget-box -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div>
        </div>
    </div>
    <!------------- Script for DataTable ----------------------->
    <script src="assets/js/jquery.dataTables.min.js">
    </script>
    <script src="assets/js/jquery.dataTables.bootstrap.min.js">
    </script>
    <script src="assets/js/dataTables.buttons.min.js">
    </script>
    <script src="assets/js/buttons.flash.min.js">
    </script>
    <script src="assets/js/buttons.html5.min.js">
    </script>
    <script src="assets/js/buttons.print.min.js">
    </script>
    <script src="assets/js/buttons.colVis.min.js">
    </script>
    <script src="assets/js/dataTables.select.min.js">
    </script>
    <!------------- Script for DataTable ----------------------->
    <script>
        
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
            }).page('last').draw('page');
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
