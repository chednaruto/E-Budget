<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>ระบบบริหารและติดตามการเบิกจ่ายเงินงบประมาณ : e-Budget & Tracking </title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/e-budget-ico.ico" />
        <meta name="description" content="overview &amp; stats" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
        <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
        <link rel="stylesheet" href="assets/css/jquery-confirm.css" />
        <style>
            @font-face {font-family: 'Tahoma';}
        </style>
        <style type="text/css">
            g[class^='raphael-group-'][class$='-creditgroup'] {
                display:none !important;
            }
        </style>
        <script src="assets/js/ace-extra.min.js"></script>
        <script src="assets/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript">
            if ('ontouchstart' in document.documentElement)
                document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-ui.custom.min.js"></script>
        <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>
        <script src="assets/js/jquery.sparkline.index.min.js"></script>
        <script src="assets/js/jquery.flot.min.js"></script>
        <script src="assets/js/jquery.flot.pie.min.js"></script>
        <script src="assets/js/jquery.flot.resize.min.js"></script>
        <script src="assets/js/ace-elements.min.js"></script>
        <script src="assets/js/ace.min.js"></script>
        <script src="assets/js/jquery-confirm.js"></script>
        <script type="text/javascript">
            function Goto(service) {
                location.href = "index.jsp?service=" + service;
            }
            function authen(id, officeid) {
                $.ajax({
                    type: "POST",
                    url: "LoginServlet",
                    data: {id: id, officeid: officeid},
                    cache: false,
                    success: function (data) {
                        if (data == "TRUE") {
                            location.href = "index.jsp?service=News";
                        }
                    },
                    error: function (err) {

                    }
                });
            }
        </script>
        <style>
            .jconfirm .jconfirm-box.jconfirm-animation-news{
                stransform: rotate(400deg) scale(0);
                -ms-transform: scale(0,0) rotate(400deg); 
                -webkit-transform: scale(0,0) rotate(400deg); 
                -moz-transform: scale(0,0) rotate(400deg); 
                transform: scale(0,0) rotate(400deg); 
            }
        </style>
    </head>
    <body class="skin-3">
        <%@include file="menu/HeaderMenu.jsp" %>

        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
            </script>
            <%@include file="menu/LeftMenu.jsp"%>
            <div class="main-content">
                <%                    try {
                        if (session.getAttribute("E-Budget") != null) {
                            if (request.getParameter("service") == null) {
                                pageContext.include("view/Main.jsp");
                            } else {
                                pageContext.include("view/" + request.getParameter("service") + ".jsp");
                            }
                        } else {
                            if (acc.IsEqualsInList(request.getParameter("service"), new String[]{"Document", "About", "News"})) {
                                pageContext.include("view/" + request.getParameter("service") + ".jsp");
                            } else {
                                pageContext.include("view/Main.jsp");
                            }
                        }
                    } catch (Exception ex) {
                        pageContext.include("view/Error.jsp");
                    }
                %>
            </div>
            <%@include file="menu/FootMenu.jsp" %>
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>
        <script type="text/javascript">
            var waitingDialog = waitingDialog || (function ($) {

                var $dialog = $(
                        '<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
                        '<div class="modal-dialog modal-m">' +
                        '<div class="modal-content">' +
                        '<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
                        '<div class="modal-body">' +
                        '<div class="progress progress-striped active" style="margin-bottom:0;"><div class="progress-bar" style="width: 100%"></div></div>' +
                        '</div>' +
                        '</div></div></div>');

                return {

                    show: function (message, options) {
                        // Assigning defaults
                        if (typeof options === 'undefined') {
                            options = {};
                        }
                        if (typeof message === 'undefined') {
                            message = 'กรุณารอสักครู่...';
                        }
                        var settings = $.extend({
                            dialogSize: 'm',
                            progressType: '',
                            onHide: null // This callback runs after the dialog was hidden
                        }, options);

                        // Configuring dialog
                        $dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
                        $dialog.find('.progress-bar').attr('class', 'progress-bar');
                        if (settings.progressType) {
                            $dialog.find('.progress-bar').addClass('progress-bar-' + settings.progressType);
                        }
                        $dialog.find('h3').text(message);
                        // Adding callbacks
                        if (typeof settings.onHide === 'function') {
                            $dialog.off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
                                settings.onHide.call($dialog);
                            });
                        }
                        // Opening dialog
                        $dialog.modal();
                    },
                    /**
                     * Closes dialog
                     */
                    hide: function () {
                        $dialog.modal('hide');
                    }
                };

            })(jQuery);
            function validateNumber(evt) {
                var theEvent = evt || window.event;

                // Handle paste
                if (theEvent.type === 'paste') {
                    key = event.clipboardData.getData('text/plain');
                } else {
                    // Handle key press
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                }
                var regex = /[0-9]|\./;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }
            function Login() {
                var form = $('<form></form>');
                form.attr("method", "post");
                //form.attr("action", "http://10.5.10.3/eofficeProtal/ept/login/");
                form.attr("action", "http://eoffice.rd.go.th/eofficeProtal/ept/login/");
                var sysName = $('<input></input>');
                sysName.attr("type", "hidden");
                sysName.attr("name", "sysName");
                sysName.attr("value", "E-Budget");
                form.append(sysName);
                var urlSendBlack = $('<input></input>');
                urlSendBlack.attr("type", "hidden");
                urlSendBlack.attr("name", "urlSendBlack");
                urlSendBlack.attr("value", "http://10.20.17.178:8080/E-Budget/index.jsp")
                //urlSendBlack.attr("value", "http://localhost:8084/E-Budget/index.jsp");
                form.append(urlSendBlack);
                $(form).appendTo('body').submit();
            }
            function Logout() {
                $.confirm({
                    title: '',
                    content: 'คุณต้องการออกจากระบบ!',
                    animation: 'news',
                    buttons: {
                        OK: {
                            text: 'ตกลง',
                            btnClass: 'btn-success',
                            keys: ['enter', 'shift'],
                            action: function () {
                                $.ajax({
                                    url: "Logout",
                                    cache: false,
                                    success: function (data) {
                                        location.href = "index.jsp";
                                    }
                                });
                            }
                        },
                        CANCLE: {
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
    </body>
</html>
