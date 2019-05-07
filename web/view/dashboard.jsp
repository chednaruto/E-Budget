<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.EBudgetTools"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories(); %>
<div class="main-content-inner">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">Home</a>
            </li>
            <li class="active">Dashboard</li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                Dashboard
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    overview &amp; stats
                </small>
            </h1>
        </div><!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">

                <div class="row">
                    <div class="col-sm-12">
                        <div class="widget-box transparent" id="recent-box">
                            <div class="widget-header">
                                <h4 class="widget-title lighter smaller">
                                    <i class="ace-icon fa fa-rss orange"></i> Dashboard
                                </h4>

                                <div class="widget-toolbar no-border">
                                    <ul class="nav nav-tabs" id="recent-tab">
                                        <li class="active">
                                            <a data-toggle="tab" href="#task-tab">งบประมาณแยกหมวด</a>
                                        </li>

                                        <li style="display: none;">
                                            <a data-toggle="tab" href="#member-tab">Members</a>
                                        </li>

                                        <li style="display: none;">
                                            <a data-toggle="tab" href="#comment-tab">Comments</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main padding-4">
                                    <div class="tab-content padding-8">
                                        <div id="task-tab" class="tab-pane active">
                                            <div class="col-sm-6">
                                                <div id="chart-container"></div>
                                            </div>
                                            <div class="col-sm-6">
                                                <table id="" class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="center"> ประเภทงบประมาณ </th>
                                                            <th class="center"> หมวดงบประมาณ </th>
                                                            <th class="center" > ยอดเงิน </th>
                                                        </tr>
                                                    </thead>  
                                                    <tbody>

                                                        <%                                         
                                                            DB2Manager dbms = new DB2Manager();
                                                            String query = "SELECT  bt.budget_type_id,bt.budget_type_name,"
                                                                    + "SUM(rb.budget_total) AS budget_total "
                                                                    + "FROM e_budget.receive_budget rb "
                                                                    + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                                                                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                                                    + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                                                                    + "GROUP BY bt.budget_type_id,bt.budget_type_name";
                                                            ResultSet rsbt = dbms.GetDataAsResultSet(query);
                                                            while (rsbt.next()) {
                                                                out.print("<tr class='green'>");
                                                                out.print("<td class='left' colspan='2'> " + rsbt.getString("budget_type_name") + " </td>");
                                                                out.print("<td style='text-align: right;'>"+acc.NumberFormat(rsbt.getDouble("budget_total"),"#,###.##")+"</td>");
                                                                out.print("</tr>");
                                                                query = "SELECT "
                                                                        + "bc.budget_category_id,bc.budget_category_name,"
                                                                        + "SUM(rb.budget_total) AS budget_total "
                                                                        + "FROM e_budget.receive_budget rb "
                                                                        + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                                                                        + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                                                                        + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                                                                        + "WHERE bc.budget_type_id = "+ rsbt.getString("budget_type_id")
                                                                        + " GROUP BY bc.budget_category_id,bc.budget_category_name " ;
                                                                ResultSet rsbc = dbms.GetDataAsResultSet(query);
                                                                while (rsbc.next()) {
                                                                    out.print("<tr>");
                                                                    out.print("<td class='left'></td>");
                                                                    out.print("<td class='left'> " + rsbc.getString("budget_category_name") + " </td>");
                                                                    out.print("<td style='text-align: right;'>"+acc.NumberFormat(rsbc.getDouble("budget_total"), "#,###.##")+"</td>");
                                                                    out.print("</tr>");
                                                                    
                                                                }
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="member-tab" class="tab-pane">
                                            <h4 class="smaller lighter green">
                                                <i class="ace-icon fa fa-signal"></i>
                                                งบประมาณแยกหมวด
                                            </h4>
                                            <div class="col-sm-6">
                                                <div id="chart-container"></div>
                                            </div>
                                        </div><!-- /.#member-tab -->

                                        <div id="comment-tab" class="tab-pane">
                                            <h4 class="smaller lighter green">
                                                <i class="ace-icon fa fa-signal"></i>
                                                งบประมาณแยกหมวด
                                            </h4>
                                            <div class="col-sm-6">
                                                <div id="chart-container"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div><!-- /.widget-box -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div>
<script type="text/javascript" src="assets/fusionchart/js/fusioncharts.js"></script>
<script type="text/javascript" src="assets/fusionchart/js/themes/fusioncharts.theme.fusion.js"></script>

<style type="text/css">
    g[class^='raphael-group-'][class$='-creditgroup'] {
        display:none !important;
    }
</style>
<script type="text/javascript">


    FusionCharts.ready(function () {

        const dataSource = {
            "chart": {
                //"caption": "",
                "bgColor": "647881",
                "bgAlpha": "40",
                //"subcaption": "ปี 2562",
                "bgColor": "none",
                "showplotborder": "1",
                "plotfillalpha": "40",
                "hoverfillcolor": "#CCCCCC",
                "numberprefix": "",
                "plottooltext": "ยอดเงิน <b>$label</b> จำนวน <b>$value</b> บาท, คิดเป็น $percentValue",
                "theme": "fusion"
            },
            "category": [
                {
    <%
                        EBudgetTools et = new EBudgetTools();
                        out.print(et.GetDashboardReceiveBudget());
    %>
                }
            ]
        };
        var myChart = new FusionCharts({
            type: "multilevelpie",
            renderAt: "chart-container",
            width: "100%",
            height: "400",
            dataFormat: "json",
            dataSource
        }).render();

    });
</script>