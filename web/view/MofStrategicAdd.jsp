<%@page import="rd.ebudget.tools.DB2Manager"%>
<%@page import="rd.ebudget.object.lookup.Gov.MofStrategic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="rd.ebudget.tools.MysqlManager"%>
<%@page import="rd.ebudget.tools.Accessories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Accessories acc = new Accessories();%>
<%
    String mode = "";
    MofStrategic ms = new MofStrategic();
    String mof_strategic_status = "";
    if (acc.IsNull(request.getParameter("mof_strategic_id"))) {
        mode = "เพิ่ม";
    } else {
        mode = "แก้ไข";
        String query = "SELECT * FROM e_budget.mof_strategic WHERE mof_strategic_id=" + request.getParameter("mof_strategic_id");
        DB2Manager mm = new DB2Manager();
        ResultSet rs = mm.GetDataAsResultSet(query);
        while (rs.next()) {
            ms = new MofStrategic();
            ms.setMof_strategic_id(rs.getString("mof_strategic_id"));
            ms.setMof_strategic_name(rs.getString("mof_strategic_name"));
            ms.setMof_strategic_status(rs.getString("mof_strategic_status"));
            if (rs.getString("mof_strategic_status").equals("Y")) {
                mof_strategic_status = "checked='checked'";
            }
        }
        rs.close();
        mm.closeConnection();

    }
%>
<div class="main-content-inner">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i><a href="index.php">หน้าหลัก</a></li>
                <li><a href="index.jsp?service=MofStrategic"> ยุทธศาสตร์กระทวงการคลัง </a></li>
                <li> <%=mode%>ข้อมูลยุทธศาสตร์กระทวงการคลัง </li>
            </ul>
            <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1><small style="color:#4D96CB!important;"><i class="ace-icon fa fa-angle-double-right"></i> ยุทธศาสตร์กระทวงการคลัง </small></h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div>
                        <div id="user-profile-1" class="user-profile row">
                            <div class="col-xs-12 col-sm-3 center">
                                <div>
                                    <span class="profile-picture">
                                        <img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="assets/images/Gov.png" style="width:256px;height:256px;"/></a>
                                    </span>
                                    <div class="space-4"></div>
                                    <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                        <div class="inline position-relative">
                                            <b href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                                                <span class="white"><%=mode%>ข้อมูลยุทธศาสตร์กระทวงการคลัง</span>
                                            </b>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-6"></div>
                                <div class="hr hr16 dotted"></div>
                            </div>
                            <div class="col-xs-12 col-sm-9">
                                <div class="space-12"></div>
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name" style="width:200px;"> ยุทธศาสตร์กระทวงการคลัง <b class="red">*</b></div>
                                        <div class="profile-info-value col-sm-12">
                                            <span>
                                                <div class="input-group col-sm-12">
                                                    <input class="form-control active" type="text" id="mof_strategic_name_tf" value="<%=acc.IsNullToEmtyString(ms.getMof_strategic_name())%>">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-info bigger-110"></i>
                                                    </span>

                                                </div>                                                
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-10"></div>
                            <div class="col-xs-9 col-sm-9" id="infomation3">
                                <div class="space-10"></div>
                                <div class="social-or-login center">
                                    <span class="bigger-110"> สถานะการใช้งาน </span>
                                </div>
                                <div class="space-10"></div>
                                <!-- #section:pages/profile.info -->
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">										
                                        <div class="profile-info-value">
                                            <span id="username">
                                                <div class="col-xs-12 center">
                                                    <label>
                                                        <input id="mof_strategic_status_tf" class="ace ace-switch ace-switch-6" type="checkbox" <%=acc.IsNullToEmtyString(mof_strategic_status)%>>
                                                        <span class="lbl">&nbsp;&nbsp;ปิดใช้งาน/เปิดใช้งาน</span>
                                                    </label>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!-- /section:pages/profile.info -->
                                <div class="space-10"></div>

                                <div class="center">
                                    <button class="btn btn-success btn-white" onclick="Add()"><i class="ace-icon fa fa-floppy-o"></i> บันทึก </button>
                                    <button class="btn btn-danger btn-white" onclick="Goto('MofStrategic')"><i class="ace-icon fa fa-times"></i> ยกเลิก </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="space-10"></div>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div>
    </div>
</div>
<script>
    function Add() {
        waitingDialog.show();
        var mof_strategic_name = $('#mof_strategic_name_tf').val();
        var mof_strategic_id = "<%=acc.IsNullToEmtyString(request.getParameter("mof_strategic_id"))%>";
        if (mof_strategic_name.trim() == "") {
            $.confirm({
                title: '', content: '<b>กรุณาบันทึกข้อมูลให้ครบถ้วน</b>', animation: 'news', closeAnimation: 'news',
                buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {}}}
            });
            waitingDialog.hide();
            return false;
        }
        var mof_strategic_status = $('#mof_strategic_status_tf').is(":checked") ? 'Y' : 'N';
        var mof_strategic = {
            mof_strategic_id: mof_strategic_id,
            mof_strategic_name: mof_strategic_name,
            mof_strategic_status: mof_strategic_status,
            METHOD: "INSERT"
        };

        $.ajax({
            type: "POST",
            url: "MofStrategicServlet",
            data: {mof_strategic: mof_strategic},
            cache: false,
            success: function (data) {
                if (data == "TRUE") {
                    $.confirm({
                        title: '', content: '<b>บันทึกข้อมูลเรียบร้อย</b>', animation: 'news', closeAnimation: 'news',
                        buttons: {somethingElse: {text: 'ตกลง', btnClass: 'btn-primary', keys: ['enter', 'shift'], action: function () {
                                    Goto('MofStrategic');
                                }}}
                    });
                }
                waitingDialog.hide();
            },
            error: function (err) {
                waitingDialog.hide();
            }
        });

    }
    
</script>