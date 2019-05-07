<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try {
            ace.settings.loadState('sidebar')
        } catch (e) {
        }
    </script>
    <% Accessories acc = new Accessories(); %>
    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-white btn-success"><i class="ace-icon fa fa-signal"></i></button>
            <button class="btn btn-white btn-info"><i class="ace-icon fa fa-pencil"></i></button>
            <button class="btn btn-white btn-warning"><i class="ace-icon fa fa-users"></i></button>
            <button class="btn btn-white btn-danger"><i class="ace-icon fa fa-cogs"></i></button>
        </div>
        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>
            <span class="btn btn-info"></span>
            <span class="btn btn-warning"></span>
            <span class="btn btn-danger"></span>
        </div>
    </div>
    <ul class="nav nav-list">
        <%
            if (!acc.IsNull(session.getAttribute("E-Budget"))) {
        %>

        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"dashboard","Dashboard2"})) {
                out.print("class='active'");
            }%>>
            <a href="index.jsp?service=Dashboard2">
                <i class="menu-icon fa fa-tachometer green"></i>
                <span class="menu-text"> Dashboard </span>
            </a>
            <b class="arrow"></b>
        </li>
        <%
            if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Finance")).equals("Y")) {
        %>
        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"ReceiveBudget", "ReceiveBudgetAdding", "BudgetAllocate", "BudgetAllocateList", "TranferBudget", "ChangeBudget","BudgetAllocateAdding","PaymentBudgetNoProject"})) {
                out.print("class='active open'");
            }%>>
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-credit-card green"></i>
                <span class="menu-text"> จัดการงบประมาณ </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"ReceiveBudget", "ReceiveBudgetAdding"})) {
                        out.print("class='active'");
                    }%>>
                    <a href="index.jsp?service=ReceiveBudget">
                        <i class="menu-icon fa fa-caret-right"></i>รับงบประมาณ
                    </a>
                    <b class="arrow"></b>
                </li>
                <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"BudgetAllocate", "BudgetAllocateList", "TranferBudget", "ChangeBudget","BudgetAllocateAdding","PaymentBudgetNoProject"})) {
                        out.print("class='active'");
                    }%>>
                    <a href="index.jsp?service=BudgetAllocate">
                        <i class="menu-icon fa fa-caret-right"></i>จัดสรรงบประมาณ/เบิกจ่าย
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
        <%
            }
        %>
        <!---------------------------------------------------  Left Menu E-Tracking --------------------------------------------------->
        <%
            if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Project-Manager")).equals("Y") || acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Parcel")).equals("Y") || acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Finance")).equals("Y")) {
        %>
        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"ProjectManager", "ProjectAdding","ProjectActivityList","ProjectActivityAdding","ProjectKPIList","ProjectKPIAdding","ProjectRiskList","ProjectRiskAdding","ActiveProjectList","ActiveProjectAdding","ProjectPlanAdding1","ProjectPlanAdding2","ProjectPlanAdding3","ProjectPlanAdding4","ProjectPlanResultAdding1","ProjectPlanResultAdding2","ProjectPlanResultAdding3","ProjectPlanResultAdding4","ProjectPeriodsList","ProjectPeriodsAdding","TermOfPaymentResult","TermOfPaymentResultAdding"})) {
                out.print("class='active open'");
            }%>>

            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-folder green"></i>
                <span class="menu-text"> จัดการโครงการ </span>
                <b class="arrow fa fa-angle-down"></b>
            </a> 
            <b class="arrow"></b>
            <ul class="submenu">
                <%
                    if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Project-Manager")).equals("Y")) {
                %>
                <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"ProjectManager", "ProjectAdding","ProjectActivityList","ProjectActivityAdding","ProjectKPIList","ProjectKPIAdding","ProjectRiskList","ProjectRiskAdding"})) {
                        out.print("class='active'");
                    }%>>
                    <a href="index.jsp?service=ProjectManager">
                        <i class="menu-icon fa fa-caret-right"></i> ข้อมูลโครงการ 
                    </a>
                    <b class="arrow"></b>
                </li>
                <%
                    }
                    if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Parcel")).trim().equals("Y") || acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Finance")).trim().equals("Y")) {
                %>
                <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"ActiveProjectList","ActiveProjectAdding","ProjectPlanAdding1","ProjectPlanAdding2","ProjectPlanAdding3","ProjectPlanAdding4","ProjectPlanResultAdding1","ProjectPlanResultAdding2","ProjectPlanResultAdding3","ProjectPlanResultAdding4","ProjectPeriodsList","ProjectPeriodsAdding","TermOfPaymentResult","TermOfPaymentResultAdding"})) {
                        out.print("class='active'");
                    }%>>
                    <a href="index.jsp?service=ActiveProjectList">
                        <i class="menu-icon fa fa-caret-right"></i> บันทึกติดตามโครงการ
                    </a>
                    <b class="arrow"></b>
                </li>
                
                <%
                    }
                %>
            </ul>
        </li>
        <%
            }
        %>
        <!---------------------------------------------------  Left Menu E-Tracking --------------------------------------------------->
        <%
            if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Admin")).equals("Y")) {
        %>
        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"GovPolicy", "GovPolicyAdd", "MofStrategic", "MofStrategicAdd", "RDStrategic", "RDStrategicAdd", "RDGoal", "RDGoalAdd", "RDTactics", "RDTacticsAdd", "BudgetType", "BudgetTypeAdding", "BudgetCategory", "BudgetCategoryAdding", "DisbursementType", "DisbursementTypeAdding", "DisbursementCategory", "DisbursementCategoryAdding", "Disbursement", "DisbursementAdding"})) {
                out.print("class='active open'");
            }%>>
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-cogs green"></i>
                <span class="menu-text"> จัดการข้อมูลพื้นฐาน </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"BudgetType", "BudgetTypeAdding", "BudgetCategory", "BudgetCategoryAdding","DisbursementCategory","DisbursementCategoryAdding","Disbursement", "DisbursementAdding"})) {
                        out.print("class='active open'");
                    }%>>
                    <a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right"></i> งบประมาณ <b class="arrow fa fa-angle-down"></b></a>
                    <b class="arrow"></b>
                    <ul class="submenu">
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"BudgetType", "BudgetTypeAdding"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=BudgetType"><i class="menu-icon fa fa-caret-right"></i> ประเภทงบประมาณ </a>
                            <b class="arrow"></b>
                        </li>
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"BudgetCategory", "BudgetCategoryAdding"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=BudgetCategory"><i class="menu-icon fa fa-caret-right"></i> หมวดงบประมาณ </a>
                            <b class="arrow"></b>
                        </li>
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"DisbursementCategory", "DisbursementCategoryAdding"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=DisbursementCategory"><i class="menu-icon fa fa-caret-right"></i> หมวดรายจ่าย </a>
                            <b class="arrow"></b>
                        </li>
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"Disbursement", "DisbursementAdding"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=Disbursement"><i class="menu-icon fa fa-caret-right"></i> รายจ่าย </a>
                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <b class="arrow"></b>
                <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"GovPolicy", "GovPolicyAdd", "MofStrategic", "MofStrategicAdd", "RDStrategic", "RDStrategicAdd", "RDGoal", "RDGoalAdd", "RDTactics", "RDTacticsAdd"})) {
                        out.print("class='active open'");
                    }%>>
                    <a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right"></i> ความสอดคลอง <b class="arrow fa fa-angle-down"></b></a>
                    <b class="arrow"></b>
                    <ul class="submenu">
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"GovPolicy", "GovPolicyAdd"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=GovPolicy"><i class="menu-icon fa fa-caret-right"></i> นโยบายรัฐบาล </a>
                            <b class="arrow"></b>
                        </li>
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"MofStrategic", "MofStrategicAdd"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=MofStrategic"><i class="menu-icon fa fa-caret-right"></i> ยุทธศาสตร์กระทรวง </a>
                            <b class="arrow"></b>
                        </li>
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"RDStrategic", "RDStrategicAdd"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=RDStrategic"><i class="menu-icon fa fa-caret-right"></i> ยุทธศาสตร์กรม </a>
                            <b class="arrow"></b>
                        </li>
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"RDGoal", "RDGoalAdd"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=RDGoal"><i class="menu-icon fa fa-caret-right"></i> เป้าประสงค์ </a>
                            <b class="arrow"></b>
                        </li>
                        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"RDTactics", "RDTacticsAdd"})) {
                                out.print("class='active'");
                            }%>>
                            <a href="index.jsp?service=RDTactics"><i class="menu-icon fa fa-caret-right"></i> กลยุทธ์ </a>
                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <b class="arrow"></b>
            </ul>
        </li>
        <%
            }
            if (acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Admin")).equals("Y") || acc.IsNullToEmtyString(request.getSession().getAttribute("E-Budget-Super-Admin")).equals("Y")) {
        %>
        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"UserManagement", "UserAdding"})) {
                out.print("class='active'");
            }%>>
            <a href="index.jsp?service=UserManagement"><i class="menu-icon fa  fa-users green"></i><span class="menu-text"> จัดการผู้ใช้งาน </span></a>
            <b class="arrow"></b>
        </li>
        <%
            }
        %>

        <li <% if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"MainReport", "Report1","Report2"})) {
                out.print("class='active'");
            }%>>
            <a href="index.jsp?service=MainReport"><i class="menu-icon fa fa-book green"></i><span class="menu-text"> รายงาน </span></a>
            <b class="arrow"></b>
        </li>

        <%}%>
        <li <% if (request.getParameter("service") != null && request.getParameter("service").equals("Document")) {
                out.print("class='active'");
            }%>>
            <a href="index.jsp?service=Document"><i class="menu-icon fa fa-book green"></i><span class="menu-text"> คู่มือการใช้งาน </span></a>
            <b class="arrow"></b>
        </li>
        <li <% if (request.getParameter("service") != null && request.getParameter("service").equals("News")) {
                out.print("class='active'");
            }%>>
            <a href="index.jsp?service=News"><i class="menu-icon fa fa-envelope-o green"></i><span class="menu-text"> ข่าวประชาสัมพันธ์ </span></a>
            <b class="arrow"></b>
        </li>
        <li <% if (request.getParameter("service") != null && request.getParameter("service").equals("About")) {
                out.print("class='active'");
            }%>>
            <a href="index.jsp?service=About"><i class="menu-icon fa fa-exclamation-circle green"></i><span class="menu-text"> ติดต่อ </span></a>
            <b class="arrow"></b>
        </li>
        <li class="">
            <%
                if (session.getAttribute("E-Budget") == null || session.getAttribute("E-Budget") == "") {
            %>
            <a href="#" onclick="Login()">
                <i class="menu-icon fa fa-power-off green"></i>
                <span class="menu-text"> เข้าสู่ระบบ </span>
            </a>
            <b class="arrow"></b>

            <%
            } else {
            %>
            <a href="#" onclick="Logout()">
                <i class="menu-icon fa fa-power-off red"></i>
                <span class="menu-text"> ออกจากระบบ </span>
            </a>
            <b class="arrow"></b>
            <%
                }
            %>
        </li>
    </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>