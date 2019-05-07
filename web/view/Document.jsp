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
            <li class="active"> คู่มือการใช้งานระบบ</li>
        </ul>
        <label style="float:right;"><% out.print(acc.IsNullToEmtyString(session.getAttribute("E-Budget-OFFICENAME")));%></label>
    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                <strong class="red">
                    <i class="ace-icon fa fa-info"></i>
                </strong>
                <strong> คู่มือการใช้งานระบบ </strong>
            </h1>

        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="dd-draghandle col-sm-12">
                    <ol class="dd-list col-sm-12">
                        <a href="Document/manual_location.pdf" target="_blank">
                            <li class="dd-item dd2-item" data-id="15">
                                <div class="dd-handle dd2-handle">
                                    <i class="normal-icon ace-icon fa fa-file orange bigger-130"></i>
                                    <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                </div>
                                <div class="dd2-content">1) การเข้าใช้ระบบงาน</div>
                            </li>
                        </a>
                        <a href="Document/manual_user_struc.pdf" target="_blank">
                            <li class="dd-item dd2-item" data-id="15">
                                <div class="dd-handle dd2-handle">
                                    <i class="normal-icon ace-icon fa fa-file orange bigger-130"></i>
                                    <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                </div>
                                <div class="dd2-content">2) การร้องขอใช้งานระบบ </div>
                            </li>
                        </a>
                        <a href="Document/manual_basic.pdf" target="_blank">
                            <li class="dd-item dd2-item" data-id="15">
                                <div class="dd-handle dd2-handle">
                                    <i class="normal-icon ace-icon fa fa-file orange bigger-130"></i>

                                    <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                </div>
                                <div class="dd2-content">3) การจัดการข้อมูลพื้นฐาน (บร.)</div>
                            </li>
                        </a>
                        <a href="Document/manual_budget.pdf" target="_blank">
                            <li class="dd-item dd2-item" data-id="15">
                                <div class="dd-handle dd2-handle">
                                    <i class="normal-icon ace-icon fa fa-file orange bigger-130"></i>

                                    <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                </div>
                                <div class="dd2-content">4) การจัดการงบประมาณ </div>
                            </li>
                        </a>
                        <a href="Document/manual_project.pdf" target="_blank">
                            <li class="dd-item dd2-item" data-id="15">
                                <div class="dd-handle dd2-handle">
                                    <i class="normal-icon ace-icon fa fa-file orange bigger-130"></i>

                                    <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                </div>
                                <div class="dd2-content">5) การบันทึกโครงการและรายละเอียดโครงการ/และรายงานสถานะการติดตาม</div>
                            </li>
                        </a>
                        <a href="docs/11.manual_user_selling_item.pdf" target="_blank">
                            <li class="dd-item dd2-item" data-id="15">
                                <div class="dd-handle dd2-handle">
                                    <i class="normal-icon ace-icon fa fa-file orange bigger-130"></i>

                                    <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                </div>
                                <div class="dd2-content">6) รายงาน</div>
                            </li>
                        </a>
                    </ol>
                </div>
            </div>
        </div><!-- /.row -->
    </div>
</div>

