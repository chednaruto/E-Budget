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
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">หน้าหลัก</a>
            </li>
            <li class="active">ข้อมูลผู้พัฒนาระบบ</li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>
    <div class="page-content">
        <div class="page-header">
            <h1>
                <strong>ผู้พัฒนาระบบ</strong>
            </h1>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="center">
                    <div class="row">
                        <div class="col-xs-6 col-sm-3 pricing-box">
                            <span class="profile-picture" style="border-radius: 50%;">
                                <img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="assets/images/Narongdet.jpg"  style="width:160px;height:160px;border-radius: 50%;"/>
                            </span>
                            <div class="widget-box widget-color-dark">
                                <div><a href="#" class="btn btn-block btn-inverse"><span></span></a></div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding">
                                        <ul class="list-unstyled list-striped pricing-table">
                                            <li>
                                                <b style="margin-left:10px;"> นายณรงค์เดช เจริญศิริ </b>
                                            </li>
                                            <li>
                                                <b style="margin-left:10px;"> นักวิชาการคอมพิวเตอร์ปฏิบัติการ </b>
                                            </li>
                                            <li>
                                                <b style="margin-left:10px;"> กองเทคโนโลยีสารสนเทศ กรมสรรพากร </b>
                                            </li>
                                            <li>
                                                <i class="ace-icon fa fa fa-tty bigger-120 pink"></i> <b style="margin-left:5px;"> 1170 </b> 
                                                <i class="ace-icon fa fa-envelope bigger-120 pink" style="margin-left:15px;"></i> <b style="margin-left:5px;"> sup.it@rd.go.th </b>
                                            </li>

                                        </ul>
                                    </div>
                                    <div><a href="#" class="btn btn-block btn-inverse"><span></span></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3 pricing-box">
                            <span class="profile-picture" style="border-radius: 50%;">
                                <img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="assets/images/Teeradet.jpg" style="width:160px;height:160px;border-radius: 50%;"/>
                            </span>
                            <div class="widget-box widget-color-dark">
                                <div><a href="#" class="btn btn-block btn-inverse"><span></span></a></div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding">
                                        <ul class="list-unstyled list-striped pricing-table">
                                            <li>
                                                <b style="margin-left:10px;"> นายธีระเดช จรเสมอ </b>
                                            </li>
                                            <li>
                                                <b style="margin-left:10px;"> นักวิชาการคอมพิวเตอร์ชำนาญการ </b>
                                            </li>
                                            <li>
                                                <b style="margin-left:10px;"> กองเทคโนโลยีสารสนเทศ กรมสรรพากร </b>
                                            </li>
                                            <li>
                                                <i class="ace-icon fa fa fa-tty bigger-120 pink"></i> <b style="margin-left:5px;"> 1170 </b> 
                                                <i class="ace-icon fa fa-envelope bigger-120 pink" style="margin-left:15px;"></i> <b style="margin-left:5px;"> sup.it@rd.go.th </b>
                                            </li>

                                        </ul>
                                    </div>
                                    <div><a href="#" class="btn btn-block btn-inverse"><span></span></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="social-or-login center">
            <span class="bigger-110"></span>
        </div>
        <div class="space-20"></div>
    </div>
</div>

