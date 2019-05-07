<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <a href="index.php" ><i class="ace-icon fa fa-home home-icon"></i>หน้าหลัก</a>
            </li>
        </ul>
        <label style="float:right;"><?php echo $_SESSION['OFFICENAME'] ?><label>
                </div>

                <div class="page-content">
                    <div class="page-header">
                        <h1>
                            ระบบรายงาน
                        </h1>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="dd-draghandle col-sm-12">
                                <ol class="dd-list col-sm-12">
                                    <!-- Report 1 -->
                                    <a href="index.jsp?service=Report1">
                                        <li class="dd-item dd2-item" data-id="15">
                                            <div class="dd-handle dd2-handle">
                                                <i class="normal-icon ace-icon fa fa-signal orange bigger-130"></i>

                                                <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                            </div>
                                            <div class="dd2-content"> งบประมาณที่รับและการเบิกจ่ายจำแนกตามหมวดงบประมาณ </div>
                                        </li>
                                    </a>
                                    <a href="index.jsp?service=Report2">
                                        <li class="dd-item dd2-item" data-id="15">
                                            <div class="dd-handle dd2-handle">
                                                <i class="normal-icon ace-icon fa fa-signal orange bigger-130"></i>

                                                <i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
                                            </div>
                                            <div class="dd2-content"> งบประมาณที่รับและการเบิกจ่ายจำแนกตามรายจ่าย </div>
                                        </li>
                                    </a>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.row -->
                </div>
                </div>