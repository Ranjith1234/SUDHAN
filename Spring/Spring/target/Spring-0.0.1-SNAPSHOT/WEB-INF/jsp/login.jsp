<%-- 
    Document   : login
    Created on : 1 Mar, 2016, 10:32:16 AM
    Author     : rajkumar.s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <!--Head-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <meta name="description" content="login page" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="<c:url value="/assets/img/favicon.png"/>" type="image/x-icon">

        <!--Basic Styles-->
        <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet" />
        <link id="bootstrap-rtl-link" href="#" rel="stylesheet" />
        <link href="<c:url value="/assets/css/font-awesome.min.css"/>" rel="stylesheet" />

        <!--Fonts-->
        <link href="<c:url value="/assets/css/google-fonts.css"/>" rel="stylesheet" type="text/css">

        <!--Beyond styles-->
        <link id="beyond-link" href="<c:url value="/assets/css/beyond.min.css"/>" rel="stylesheet" />
        <link href="<c:url value="/assets/css/demo.min.css"/>" rel="stylesheet" />
        <link href="<c:url value="/assets/css/animate.min.css"/>" rel="stylesheet" />
        <link id="skin-link" href="#" rel="stylesheet" type="text/css" />

        <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
        <script src="<c:url value="/assets/js/skins.min.js"/>"></script>
    </head>
    <!--Head Ends-->
    <!--Body-->
    <body>
        <div class="login-container animated fadeInDown">
            <div class="loginbox bg-white">
                <div class="loginbox-title">SIGN IN</div>

                <div class="loginbox-or">
                    <div class="or-line"></div>
                    <div class="or">&nbsp;</div>
                </div>
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        <p>Invalid username and password.</p>
                    </div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">
                        <p>You have been logged out successfully.</p>
                    </div>
                </c:if>
                <c:url var="loginUrl" value="/login.do" />
                <form action="${loginUrl}" method="post" role="form">
                    <div class="loginbox-textbox">
                        <input type="text" name="username" class="form-control" placeholder="Username" />
                    </div>
                    <div class="loginbox-textbox">
                        <input type="password" name="password" class="form-control" placeholder="Password" />
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
                    <div class="loginbox-forgot">
                        <a href="#">Forgot Password?</a>
                    </div>
                    <div class="loginbox-submit">
                        <input type="submit" class="btn btn-primary btn-block" value="Login">
                    </div>
                    <!--            <div class="loginbox-signup">
                                    <a href="register.html">Sign Up With Email</a>
                                </div>-->
                </form>
            </div>
            <div class="logobox">
            </div>
        </div>

        <!--Basic Scripts-->
        <script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
        <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/assets/js/slimscroll/jquery.slimscroll.min.js"/>"></script>

        <!--Beyond Scripts-->
        <script src="<c:url value="/assets/js/beyond.js"/>"></script>


    </body>
    <!--Body Ends-->

</html>
