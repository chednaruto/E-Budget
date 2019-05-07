<%@page import="rd.ebudget.tools.Accessories"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="navbar" class="navbar navbar-default ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="navbar-header pull-left">
            <a href="index.jsp" class="navbar-brand">
                <small>
                    <img src="assets/images/e-budget-ico.ico" style="width: 22px;height: 22px;">
                    ระบบบริหารและติดตามการเบิกจ่ายเงินงบประมาณ : e-Budget & Tracking
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <%
                    Accessories accs = new Accessories();
                    if (accs.IsNullToEmtyString(session.getAttribute("E-Budget-Super-Admin")).equals("Y") || accs.IsNullToEmtyString(session.getAttribute("E-Budget-Admin")).equals("Y")) {
                        String query = "SELECT count(*) AS cc FROM e_budget.user u LEFT JOIN e_budget.user_permission up ON u.id = up.id and u.officeid = up.officeid WHERE up.permission_status <> 'Y'";
                        DB2Manager dbms = new DB2Manager();
                        ResultSet hrs = dbms.GetDataAsResultSet(query);
                        hrs.next();
                        int memberc = hrs.getInt("cc");
                        if (memberc > 0) {
                %>
                <li class="purple dropdown-modal">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                        <span class="badge badge-important">1</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-exclamation-triangle"></i>
                            1 Notifications
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar navbar-pink">
                                <li>
                                    <a href="index.jsp?service=UserManagement">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-xs btn-primary fa fa-user"></i>
                                                ขอสิทธิการใช้งาน
                                            </span>
                                            <span class="pull-right badge badge-info"><%=memberc%> คน</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <!--<a href="#">
                                See all notifications
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>-->
                            
                        </li>
                    </ul>
                </li>
                <%
                        }
                    }
                %>

                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
                        <span class="user-info">
                            <small>ยินดีต้อนรับ,</small>
                            <%
                                if (session.getAttribute("E-Budget") != null) {
                                    out.print(session.getAttribute("E-Budget-DISPLAYNAME"));
                                } else {
                                    out.println("Guest");
                                }
                            %>
                        </span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <%
                            if (session.getAttribute("E-Budget") != null) {
                        %>
                        <li>
                            <a href="profile.html">
                                <i class="ace-icon fa fa-user"></i>
                                ข้อมูลส่วนตัว
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#" onclick="Logout()">
                                <i class="ace-icon fa fa-power-off red"></i>
                                ออกจากระบบ
                            </a>
                        </li>
                        <%
                        } else {
                        %>
                        <li>
                            <a href="#" onclick="Login()">
                                <i class="ace-icon fa fa-power-off green"></i>
                                เข้าสู่ระบบ
                            </a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.navbar-container -->
</div>