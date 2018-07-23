<%-- 
    Document   : index
    Created on : 1 Mar, 2016, 10:03:41 AM
    Author     : rajkumar.s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html ng-app="myApp">
    <!-- Head -->
    <head>
        <meta name="_csrf" content="${_csrf.token}"/>
        <!-- default header name is X-CSRF-TOKEN -->
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <title>Dashboard</title>-->
        <title ng-bind="title"></title>
        <meta name="description" content="Dashboard" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="<c:url value="/assets/img/favicon.png"/>" type="image/x-icon">


        <!--Basic Styles-->
        <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" />
        <link id="bootstrap-rtl-link" href="#" rel="stylesheet" />
        <link href="<c:url value="/assets/css/font-awesome.min.css"/>" rel="stylesheet" />
        <link href="<c:url value="/assets/css/weather-icons.min.css"/>" rel="stylesheet" />

        <!--Fonts-->
        <link href="<c:url value="/assets/css/google-fonts.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/assets/css/google-fonts-1.css"/>" rel='stylesheet' type='text/css'>
        <!--Beyond styles-->
        <link id="beyond-link" href="<c:url value="/assets/css/beyond.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/assets/css/demo.min.css"/>" rel="stylesheet" />
        <link href="<c:url value="/assets/css/typicons.min.css"/>" rel="stylesheet" />
        <link href="<c:url value="/assets/css/animate.min.css"/>" rel="stylesheet" />
        <link id="skin-link" href="#" rel="stylesheet" type="text/css" />

        <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
        <script src="<c:url value="/assets/js/skins.min.js"/>"></script>
        <link href="<c:url value="/assets/css/pace.css"/>" rel="stylesheet" type="text/css"/>
        
        <link href="<c:url value="/assets/css/common.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/assets/js/toastr/toastr.css"/>" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <!-- /Head -->
    <!-- Body -->
    <body >
        <sec:authentication var="user" property="principal" />
        <c:set var="username" value="${user.username}"/>

        <!-- Loading Container -->
        <div class="pace"></div>
        <!--  /Loading Container -->
        <!-- Navbar -->
        <div class="navbar">
            <div class="navbar-inner">
                <div class="navbar-container">
                    <!-- Navbar Barnd -->
                    <div class="navbar-header pull-left">
                        <a href="#" class="navbar-brand">
                            <small>
                                <img src="<c:url value="/assets/img/logo.png"/>" alt="" />
                            </small>
                        </a>
                    </div>
                    <!-- /Navbar Barnd -->
                    <!-- Sidebar Collapse -->
                    <div class="sidebar-collapse" id="sidebar-collapse">
                        <i class="collapse-icon fa fa-bars"></i>
                    </div>
                    <!-- /Sidebar Collapse -->
                    <!-- Account Area and Settings --->
                    <div class="navbar-header pull-right">
                        <div class="navbar-account">
                            <ul class="account-area">

                                <li>
                                    <a class="wave in" id="chat-link" title="Chat" href="#">
                                        <i class="icon glyphicon glyphicon-comment"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="login-area dropdown-toggle" data-toggle="dropdown">
                                        <div class="avatar" title="View your public profile">
                                            <img src="<c:url value="/assets/img/avatars/adam-jansen.jpg"/>">
                                        </div>
                                        <section>
                                            <h2><span class="profile"><span>David Stevenson</span></span></h2>
                                        </section>
                                    </a>
                                    <!--Login Area Dropdown-->
                                    <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                        <li class="username"><a>${username}</a></li>
                                        <li class="email"><a>David.Stevenson@live.com</a></li>
                                        <!--Avatar Area-->
                                        <li>
                                            <div class="avatar-area">
                                                <img src="<c:url value="/assets/img/avatars/adam-jansen.jpg"/>" class="avatar">
                                                <span class="caption">Change Photo</span>
                                            </div>
                                        </li>
                                        <!--Avatar Area-->
                                        <li class="edit">
                                            <a href="profile.html" class="pull-left">Profile</a>
                                            <a href="#" class="pull-right">Setting</a>
                                        </li>
                                        <!--Theme Selector Area-->
                                        <li class="theme-area">
                                            <ul class="colorpicker" id="skin-changer">
                                                <li><a class="colorpick-btn" href="#" style="background-color:#5DB2FF;" rel="<c:url value="/assets/css/skins/blue.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#2dc3e8;" rel="<c:url value="/assets/css/skins/azure.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#03B3B2;" rel="<c:url value="/assets/css/skins/teal.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#53a93f;" rel="<c:url value="/assets/css/skins/green.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#FF8F32;" rel="<c:url value="/assets/css/skins/orange.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#cc324b;" rel="<c:url value="/assets/css/skins/pink.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#AC193D;" rel="<c:url value="/assets/css/skins/darkred.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#8C0095;" rel="<c:url value="/assets/css/skins/purple.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#0072C6;" rel="<c:url value="/assets/css/skins/darkblue.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#585858;" rel="<c:url value="/assets/css/skins/gray.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#474544;" rel="<c:url value="/assets/css/skins/black.min.css"/>"></a></li>
                                                <li><a class="colorpick-btn" href="#" style="background-color:#001940;" rel="<c:url value="/assets/css/skins/deepblue.min.css"/>"></a></li>
                                            </ul>
                                        </li>
                                        <!--/Theme Selector Area-->
                                        <li class="dropdown-footer">
                                            <a href="logout.do">
                                                Sign out
                                            </a>
                                        </li>
                                    </ul>
                                    <!--/Login Area Dropdown-->
                                </li>
                                <!-- /Account Area -->
                                <!--Note: notice that setting div must start right after account area list.
                                no space must be between these elements-->
                                <!-- Settings -->
                            </ul><div class="setting">
                                <a id="btn-setting" title="Setting" href="#">
                                    <i class="icon glyphicon glyphicon-cog"></i>
                                </a>
                            </div><div class="setting-container">
                                <label>
                                    <input type="checkbox" id="checkbox_fixednavbar">
                                    <span class="text">Fixed Navbar</span>
                                </label>
                                <label>
                                    <input type="checkbox" id="checkbox_fixedsidebar">
                                    <span class="text">Fixed SideBar</span>
                                </label>
                                <label>
                                    <input type="checkbox" id="checkbox_fixedbreadcrumbs">
                                    <span class="text">Fixed BreadCrumbs</span>
                                </label>
                                <label>
                                    <input type="checkbox" id="checkbox_fixedheader">
                                    <span class="text">Fixed Header</span>
                                </label>
                            </div>
                            <!-- Settings -->
                        </div>
                    </div>
                    <!-- /Account Area and Settings -->
                </div>
            </div>
        </div>
        <!-- /Navbar -->
        <!-- Main Container -->
        <div class="main-container container-fluid">
            <!-- Page Container -->
            <div class="page-container">

                <!-- Page Sidebar -->
                <div class="page-sidebar" id="sidebar">

                </div>
                <!-- /Page Sidebar -->
                <!-- Chat Bar -->
                <div id="chatbar" class="page-chatbar">
                    <div class="chatbar-contacts">
                        <div class="contacts-search">
                            <input type="text" class="searchinput" placeholder="Search Contacts" />
                            <i class="searchicon fa fa-search"></i>
                            <div class="searchhelper">Search Your Contacts and Chat History</div>
                        </div>

						<ul class="contacts-list">
						</ul>
                    </div>
                    <div class="chatbar-messages" style="display: none;">

                    </div>
                </div>
                <!-- /Chat Bar -->
                <!-- Page Content --> 
                <div class="page-content">
                    <!-- Page Breadcrumb -->
                    <div class="page-breadcrumbs">
                        <ul class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>
                                <a href="#">Home</a>
                            </li>
                            <li class="active"><a href="#">{{title}}</a></li>
                        </ul>
                    </div>
                    <!-- /Page Breadcrumb -->
                    <!-- Page Header -->
                    <div class="page-header position-relative">
                        <div class="header-title">
                            <h1>
                                Dashboard
                            </h1>
                        </div>
                        <!--Header Buttons-->
                        <div class="header-buttons">
                            <a class="sidebar-toggler" href="#">
                                <i class="fa fa-arrows-h"></i>
                            </a>
                            <a class="refresh" id="refresh-toggler" href="#">
                                <i class="glyphicon glyphicon-refresh"></i>
                            </a>
                            <a class="fullscreen" id="fullscreen-toggler" href="#">
                                <i class="glyphicon glyphicon-fullscreen"></i>
                            </a>
                        </div>
                        <!--Header Buttons End-->
                    </div>
                    <!-- /Page Header -->
                    <!-- Page Body -->
                    <div class="page-body ng-cloak" id="main-container">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div id="results"></div>
                        </div>
                        <div ng-view></div>
                    </div>
                    <!-- /Page Body -->
                </div>
                <!-- /Page Content -->

            </div>
            <!-- /Page Container -->
            <!-- Main Container -->

        </div>

        <!--Basic Scripts-->
        <script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
        <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/assets/js/slimscroll/jquery.slimscroll.min.js"/>"></script>
        <script src="<c:url value="/assets/js/angular/angular.min.js"/>"></script>
        <script src="<c:url value="/assets/js/angular/angular-route.min.js"/>"></script>
        <script src="<c:url value="/assets/js/toastr/toastr.min.js"/>"></script>
        
        <script src="<c:url value="/assets/js/angular-ui-bootstrap/ui-bootstrap-tpls-2.5.0.js"/>"></script>
		<script src="<c:url value="/assets/js/angular-ui-bootstrap/angular-ui-utils.min.js"/>"></script>
        <script	src="<c:url value="/assets/js/angular/checklist-model.js"/>" type="text/javascript"></script>
        
        <script src="<c:url value="/assets/js/app.js"/>" type="text/javascript"></script>
		
		
		<script src="<c:url value="/assets/js/angular_service/common_service.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/assets/js/angular_service/user_service.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/assets/js/angular_controller/user_controller.js"/>" type="text/javascript"></script>


        <!-- Chat Socket IO -->
<!--         <script src="http://192.168.4.41:3000/socket.io/socket.io.js"></script> -->
        <script>
            /* Do not enable this csrf comment
             * var token = $("meta[name='_csrf']").attr("content");
             var header = $("meta[name='_csrf_header']").attr("content");
             $(document).ajaxSend(function (e, xhr, options) {
             xhr.setRequestHeader(header, token);
             });*/
            // Chat code
           /*
             var socket = io.connect('http://192.168.4.41:3000');
             
            
             var user = "${username}";
             socket.emit('nickname',user);
             
             socket.on('update-people', function(people){
             var html = '', html1='';
             $.each(people, function(index, client) {
        	     var username = client.name;
        	     var clientId = client.clientId;
             
  
             var contact = '';
             var chatmsg = '';
             
             if(username !== user){
             contact = '<li class="contact" contact-name="'+username+'" client-id="'+clientId+'">'
             +'<div class="contact-avatar"><img src="/springDemo/assets/img/avatars/divyia.jpg"></div>'
             +'<div class="contact-info">'
             +'<div class="contact-name">'+username+'</div>'
             +'<div class="contact-status"><div class="online"></div><div class="status">online</div></div>'
             +'<div class="last-chat-time">last week</div>'
             +'</div></li>';
             
             chatmsg = '<div class="chatbar-div" client-id="'+clientId+'" msg-to="'+username+'"><div class="messages-contact" >'
             +'<div class="contact-avatar"><img src="/springDemo/assets/img/avatars/divyia.jpg"></div>'
             +'<div class="contact-info">'
             +'<div class="contact-name">'+username+'</div>'
             +'<div class="contact-status"><div class="online"></div><div class="status">online</div></div>'
             +'<div class="last-chat-time">a moment ago</div>'
             +'<div class="back">'
             +'<i class="fa fa-arrow-circle-left"></i>'
             +'</div>'
             +'</div>'
             +'</div>'
             +'<ul class="messages-list" style="overflow: hidden; width: auto; height: 393px;">'
             +'<li class="message">'
             +'<div class="message-info">'
             +'<div class="bullet"></div>'
             +'<div class="contact-name">Me</div>'
             +'<div class="message-time">10:14 AM, Today</div>'
             +'</div>'
             +'<div class="message-body">'
             +'Hi, Hope all is good. Are we meeting today?'
             +'</div>'
             +'</li>'
             +'<li class="message reply">'
             +'<div class="message-info">'
             +'<div class="bullet"></div>'
             +'<div class="contact-name">Divyia</div>'
             +'<div class="message-time">10:15 AM, Today</div>'
             +'</div>'
             +'<div class="message-body">'
             +'Hi, Hope all is good. Are we meeting today?'
             +'</div>'
             +'</li>'
             
             +'</ul>'
             +'<div class="send-message">'
             +'<span class="input-icon icon-right">'
             +'<textarea rows="4" class="form-control msgtext" msg-from="'+user+'" msg-to="'+username+'"  client-id="'+clientId+'" placeholder="Type your message"></textarea>'
             +'<i class="fa fa-camera themeprimary"></i>'
             +'</span>'
             +'</div></div>';
             
             }
             html += contact;
             html1 += chatmsg;
             });
             $('.contacts-list').html(html);
             $('.chatbar-messages').html(html1);
             
             $('.page-chatbar .chatbar-contacts .contact').click(function(e) { 
             var toUser = $(this).attr("contact-name");
             $('.page-chatbar .chatbar-contacts').hide();
             $('.page-chatbar .chatbar-messages').show();
             $('.page-chatbar .chatbar-messages .chatbar-div').hide();
             $('.page-chatbar .chatbar-messages .chatbar-div[msg-to="'+toUser+'"]').show();
             });
             
             $('.page-chatbar .chatbar-messages .back').click(function (e) {
             $('.page-chatbar .chatbar-contacts').show();
             $('.page-chatbar .chatbar-messages').hide();
             });
             
             $('.msgtext').keyup(function(e){
             var keyCode = e.which || e.keyCode;
             
             if(keyCode === 13){
             var from = $(this).attr('msg-from');
             var to = $(this).attr('msg-to');
             var toClient = $(this).attr('client-id');
             //alert(toClient);
             var msg = $(this).val();
             if(msg.trim() !== ''){
             socket.emit('send message',{msg: msg, toUser: toClient});
             $(this).val('');
             var mymsg = '<li class="message">'
             +'<div class="message-info">'
             +'<div class="bullet"></div>'
             +'<div class="contact-name">Me</div>'
             +'<div class="message-time">10:15 AM, Today</div>'
             +'</div>'
             +'<div class="message-body">'
             +msg
             +'</div>'
             +'</li>';
             
             $('.chatbar-div[msg-to="'+to+'"] .messages-list').append(mymsg);
             }
             }
             });
             
             setSlimScroll();
             
             });
             
             socket.on('new message', function(data){
             var msg = '<li class="message reply">'
             +'<div class="message-info">'
             +'<div class="bullet"></div>'
             +'<div class="contact-name">'+data.from+'</div>'
             +'<div class="message-time">10:15 AM, Today</div>'
             +'</div>'
             +'<div class="message-body">'
             +data.msg
             +'</div>'
             +'</li>';
             $('.chatbar-div[msg-to="'+data.from+'"] .messages-list').append(msg);
             });
             */
            // =================== chat code end =========================//

            function setSlimScroll() {
                var position = (readCookie("rtl-support") || location.pathname == "/index-rtl-fa.html" || location.pathname == "index-rtl-ar.html") ? 'right' : 'left';
                $('.chatbar-messages .messages-list').slimscroll({
                    position: position,
                    size: '4px',
                    color: themeprimary,
                    height: $(window).height() - 250,
                });
                $('.chatbar-contacts .contacts-list').slimscroll({
                    position: position,
                    size: '4px',
                    color: themeprimary,
                    height: $(window).height() - 86,
                });
            }

        </script>

        <!--Beyond Scripts-->
        <script src="<c:url value="/assets/js/beyond.js"/>"></script>
        <script src="<c:url value="/assets/js/common.js"/>" type="text/javascript"></script>
        <!--Page Related Scripts-->
        <!--Sparkline Charts Needed Scripts-->
        <script src="<c:url value="/assets/js/charts/sparkline/jquery.sparkline.js"/>"></script>
        <script src="<c:url value="/assets/js/charts/sparkline/sparkline-init.js"/>"></script>

        <!--Easy Pie Charts Needed Scripts-->
        <script src="<c:url value="/assets/js/charts/easypiechart/jquery.easypiechart.js"/>"></script>
        <script src="<c:url value="/assets/js/charts/easypiechart/easypiechart-init.js"/>"></script>

        <!--Flot Charts Needed Scripts-->
        <script src="<c:url value="/assets/js/charts/flot/jquery.flot.js"/>"></script>
        <script src="<c:url value="/assets/js/charts/flot/jquery.flot.resize.js"/>"></script>
        <script src="<c:url value="/assets/js/charts/flot/jquery.flot.pie.js"/>"></script>
        <script src="<c:url value="/assets/js/charts/flot/jquery.flot.tooltip.js"/>"></script>
        <script src="<c:url value="/assets/js/charts/flot/jquery.flot.orderBars.js"/>"></script>

        <!--Bootstrap Date Picker-->
<%--         <script src="<c:url value="/assets/js/datetime/bootstrap-datepicker.js"/>"></script> --%>
        <!--Bootstrap Time Picker-->
<%--         <script src="<c:url value="/assets/js/datetime/bootstrap-timepicker.js"/>"></script> --%>
        <!--Bootstrap Date Range Picker-->
<%--         <script src="<c:url value="/assets/js/datetime/moment.js"/>"></script> --%>
<%--         <script src="<c:url value="/assets/js/datetime/daterangepicker.js"/>"></script> --%>

        <script src="<c:url value="/assets/js/select2/select2.js"/>"></script>
        <script src="<c:url value="/assets/js/validation/bootstrapValidator.js"/>"></script>
        <script src="<c:url value="/assets/js/pace/pace.min.js"/>" type="text/javascript"></script>
        
        <!--Bootstrap Datatables-->
<%--        <script src="<c:url value="/assets/js/datatable/jquery.dataTables.min.js"/>"></script> --%>
<%-- 		<script src="<c:url value="/assets/js/datatable/dataTables.bootstrap.min.js"/>"></script> --%>
<%-- 		<script src="<c:url value="/assets/js/datatable/dataTables.tableTools.min.js"/>"></script> --%>
        
        <script>
        
            // If you want to draw your charts with Theme colors you must run initiating charts after that current skin is loaded
            $(window).bind("load", function () {

                //Chat
                $("#chat-link").click(function () {
                    $('.page-chatbar').toggleClass('open');
                    $("#chat-link").toggleClass('open');
                });
                /*Sets Themed Colors Based on Themes*/
                themeprimary = getThemeColorFromCss('themeprimary');
                themesecondary = getThemeColorFromCss('themesecondary');
                themethirdcolor = getThemeColorFromCss('themethirdcolor');
                themefourthcolor = getThemeColorFromCss('themefourthcolor');
                themefifthcolor = getThemeColorFromCss('themefifthcolor');
                //Sets The Hidden Chart Width
                $('#dashboard-bandwidth-chart')
                        .data('width', $('.box-tabbs')
                                .width() - 20);

            });
            
            toastr.options = {
	       		  "closeButton": true,
	       		  "debug": false,
	       		  "newestOnTop": true,
	       		  "progressBar": false,
	       		  "positionClass": "toast-top-right",
	       		  "preventDuplicates": true,
	       		  "onclick": null,
	       		  "showDuration": "300",
	       		  "hideDuration": "1000",
	       		  "timeOut": "6000",
	       		  "extendedTimeOut": "1000",
	       		  "showEasing": "swing",
	       		  "hideEasing": "linear",
	       		  "showMethod": "fadeIn",
	       		  "hideMethod": "fadeOut"
       		}
            toastr["success"]("Welcome..!");
        </script>

    </body>
    <!--  /Body -->

</html>
