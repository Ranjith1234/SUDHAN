<%-- 
    Document   : dashboard
    Created on : 8 Mar, 2016, 10:13:39 AM
    Author     : rajkumar.s
--%>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sec:authentication var="user" property="principal" />
<c:set var="username" value="${user.username}"/>
<!-- Page Body -->
<%-- <link href='<c:url value="/assets/css/dataTables.bootstrap.css" />' rel="stylesheet"/> --%>
<link rel='stylesheet prefetch' href='https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css'>
<script src='https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js'></script>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left bg-themesecondary">
                        <div class="databox-piechart">
                            <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="50" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.1)"><span class="white font-90">50%</span></div>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number themesecondary">28</span>
                        <div class="databox-text darkgray">NEW TASKS</div>
                        <div class="databox-stat themesecondary radius-bordered">
                            <i class="stat-icon icon-lg fa fa-tasks"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left bg-themethirdcolor">
                        <div class="databox-piechart">
                            <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="15" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.2)"><span class="white font-90">15%</span></div>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number themethirdcolor">5</span>
                        <div class="databox-text darkgray">NEW MESSAGE</div>
                        <div class="databox-stat themethirdcolor radius-bordered">
                            <i class="stat-icon  icon-lg fa fa-envelope-o"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left bg-themeprimary">
                        <div class="databox-piechart">
                            <div id="users-pie" data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="76" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.1)"><span class="white font-90">76%</span></div>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number themeprimary">92</span>
                        <div class="databox-text darkgray">NEW USERS</div>
                        <div class="databox-state bg-themeprimary">
                            <i class="fa fa-check"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left no-padding">
                        <img src="<c:url value="/assets/img/avatars/John-Smith.jpg"/>" style="width:65px; height:65px;">
                    </div>
                    <div class="databox-right padding-top-20">
                        <div class="databox-stat palegreen">
                            <i class="stat-icon icon-xlg fa fa-phone"></i>
                        </div>
                        <div class="databox-text darkgray">JOHN SMITH</div>
                        <div class="databox-text darkgray">TOP RESELLER</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row col-lg-12">
    <sec:authorize access="isAuthenticated()">
        ${user}
    </sec:authorize>
</div>

<div class="row">

    <div class="col-md-12 col-sm-12 col-xs-12" ng-controller="UserController as ctrl">
        <div class="widget">
            <div class="widget-header bordered-bottom bordered-blue">
                <span class="widget-caption"><strong>User Creation</strong></span>
                <div class="buttons-preview">
                    <button class="btn btn-info" onclick="showModal()" data-accesskey="v">
                        <i class="fa fa-search"></i>View</button>
                </div>
            </div>
            <div class="widget-body ng-cloak">
                <form id="myFrom" name="myForm" ng-submit="myForm.$valid && ctrl.submit()" class="form-horizontal bv-form" novalidate>
                <input type="hidden" ng-model="ctrl.user.id">
                    <div class="col-md-12">
                        <div ng-class="{'form-group col-md-6':true , 'has-error' : invlidUser = (myForm.uname.$dirty || myForm.$submitted )&& myForm.uname.$invalid }" >
                            <label class="col-md-5 control-label" for="uname"><strong>User Name*</strong></label>
                            <div class="col-md-7">
                                <input type="text" ng-model="ctrl.user.username" class="form-control" name="uname" id="uname" placeholder="User Name" required ng-minlength="3">
                               	<small class="help-block" ng-show="invlidUser && myForm.uname.$error.required">User name is required.</small>
                               	<small class="help-block" ng-show="invlidUser &&myForm.uname.$error.minlength">Minimum length required is 3.</small>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="col-md-5 control-label"><strong>Address*</strong></label>
                            <div class="col-md-7">
                                <textarea class="form-control" ng-model="ctrl.user.address" name="address" id="address" placeholder="Address"></textarea>
							</div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div ng-class="{'form-group col-md-6':true, 'has-error' : emailInvlid=(myForm.email.$dirty || myForm.$submitted) && myForm.email.$invalid}">
                            <label class="col-md-5 control-label"><strong> E-mail</strong></label>
                            <div class="col-md-7">
                                <input type="email" ng-model="ctrl.user.email" class="form-control" name="email" id="email" placeholder="E-mail" required>
                                <small class="help-block" ng-show="emailInvlid && myForm.email.$error.required">E-mail is required.</small>
                                <small class="help-block" ng-show="emailInvlid && myForm.email.$invalid">E-mail is invalid.</small>

                            </div>
                        </div>

                    </div>


                    <div class="form-group">
                        <div class="col-md-offset-6 col-md-8">
                            <button type="submit" class="btn btn-blue" >{{(ctrl.user.id!=null)?"Update":"Create"}}</button>
                            <button type="reset" class="btn btn-warning" >Reset Form</button>
                        </div>
                    </div>                                
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="simpledatatable">
                        <thead>
                            <tr>
                                <th>ID.</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Email</th>
                                <sec:authorize access="hasAuthority('ADMIN')">
                                <th width="20%"></th>
                                </sec:authorize>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="u in ctrl.users">
                                <td><span ng-bind="u.id"></span></td>
                                <td><span ng-bind="u.username"></span></td>
                                <td><span ng-bind="u.address"></span></td>
                                <td><span ng-bind="u.email"></span></td>
                                <sec:authorize access="hasAuthority('ADMIN')">
                                <td>
                                    <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success btn-xs">Edit</button>  
                                    <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger btn-xs">Remove</button>
                                </td>
                                </sec:authorize>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


</div>


<script>
        //-------------------------Initiates Easy Pie Chart instances in page--------------------//
        InitiateEasyPieChart.init();
   
</script>
<!-- /Page Body -->

