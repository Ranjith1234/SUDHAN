<%-- 
    Document   : blank
    Created on : 8 Mar, 2016, 5:05:29 PM
    Author     : rajkumar.s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!-- Page Body -->
<div class="row">


    <div class="col-md-12">
        <div class="widget">
            <div class="widget-header bordered-bottom bordered-blue">
                <span class="widget-caption">Basic Form</span>
            </div>
            <div class="widget-body">
                <!--                Carousel-->
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <div id="registration-form" style="padding:50px 100px;">
                                <form role="form">
                                    <div class="form-title">
                                        User Information
                                    </div>
                                    <div class="form-group">
                                        <span class="input-icon icon-right">
                                            <input type="text" class="form-control" id="userameInput" placeholder="Username">
                                            <i class="glyphicon glyphicon-user circular"></i>
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <span class="input-icon icon-right">
                                            <input type="text" class="form-control" id="emailInput" placeholder="Email Address">
                                            <i class="fa fa-envelope-o circular"></i>
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <span class="input-icon icon-right">
                                            <input type="text" class="form-control" id="passwordInput" placeholder="Password">
                                            <i class="fa fa-lock circular"></i>
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <span class="input-icon icon-right">
                                            <input type="text" class="form-control" id="confirmPasswordInput" placeholder="Confirm Password">
                                            <i class="fa fa-lock circular"></i>
                                        </span>
                                    </div>
                                    <div class="form-title">
                                        Personal Information
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <span class="input-icon icon-right">
                                                    <input type="text" class="form-control" placeholder="Name">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <span class="input-icon icon-right">
                                                    <input type="text" class="form-control" placeholder="Family">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <span class="input-icon icon-right">
                                                    <input type="text" class="form-control" placeholder="Phone">
                                                    <i class="glyphicon glyphicon-earphone"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <span class="input-icon icon-right">
                                                    <input type="text" class="form-control" placeholder="Mobile">
                                                    <i class="glyphicon glyphicon-phone"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="wide">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <span class="input-icon icon-right">
                                                    <input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" placeholder="Birth Date">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <span class="input-icon icon-right">
                                                    <input type="text" class="form-control" placeholder="Birth Place">
                                                    <i class="fa fa-globe"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" class="colored-blue">
                                                <span class="text">Auto Sign In After Registration</span>
                                            </label>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-blue">Register</button>
                                </form>
                            </div>
                        </div>

                        <div class="item">
                            <div class="col-lg-6 col-sm-6 col-xs-12 col-lg-offset-3 col-sms-offset-3">
                                    <div class="widget">
                                        <div class="widget-header bordered-bottom bordered-lightred">
                                            <span class="widget-caption">Horizontal Form</span>
                                        </div>
                                        <div class="widget-body">
                                            <div id="horizontal-form">
                                                <form class="form-horizontal" role="form">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">Email</label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                                            <p class="help-block">Example block-level help text here.</p>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">Password</label>
                                                        <div class="col-sm-10">
                                                            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox">
                                                                    <span class="text">Remember me next time.</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" class="btn btn-default">Sign in</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>

                        <div class="item">
                            <div class="col-lg-6 col-sm-6 col-xs-12 col-lg-offset-3 col-sms-offset-3">
                                    <div class="widget">
                                        <div class="widget-header bordered-bottom bordered-lightred">
                                            <span class="widget-caption">Horizontal Form</span>
                                        </div>
                                        <div class="widget-body">
                                            <div id="horizontal-form">
                                                <form class="form-horizontal" role="form">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">Email</label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                                            <p class="help-block">Example block-level help text here.</p>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">Password</label>
                                                        <div class="col-sm-10">
                                                            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox">
                                                                    <span class="text">Remember me next time.</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" class="btn btn-default">Sign in</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>

                        <div class="item">
                            <div class="col-lg-6 col-sm-6 col-xs-12 col-lg-offset-3 col-sms-offset-3">
                                    <div class="widget">
                                        <div class="widget-header bordered-bottom bordered-lightred">
                                            <span class="widget-caption">Horizontal Form</span>
                                        </div>
                                        <div class="widget-body">
                                            <div id="horizontal-form">
                                                <form class="form-horizontal" role="form">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">Email</label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                                            <p class="help-block">Example block-level help text here.</p>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputPassword3" class="col-sm-2 control-label no-padding-right">Password</label>
                                                        <div class="col-sm-10">
                                                            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox">
                                                                    <span class="text">Remember me next time.</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" class="btn btn-default">Sign in</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>


            </div>
        </div>
    </div>

</div>
<!-- /Page Body -->
<script>
    $('.header-title h1').text("Your Page Title");
</script>