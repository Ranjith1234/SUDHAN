
<%-- 
    Document   : Customer Master
    Created on : 14 Mar, 2016, 4:46:59 PM
    Author     : admin
--%>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Page Body -->

<div class="row" ng-controller="AccountMgmtController">

	<div class="col-md-12 col-sm-12 col-xs-12"></div>

	<uib-tabset active="active"> <uib-tab index="0"
		select="fetchAllUsers()"> <uib-tab-heading>
	<i class="fa fa-vcard-o fa-lg"></i> Users </uib-tab-heading>

	<div class="widget transparent">
		<div class="widget-header">
			<i class="widget-icon fa fa-check"></i> <span class="widget-caption">Default
				Widget</span>
			<div class="widget-buttons">
				<span data-toggle="config" tooltip-placement="top" uib-tooltip="Filter"> <i class="fa fa-filter"></i></span>
				<span class="icon-devider" style="border-right: 1px solid #ccc; min-width: 1px;">&nbsp;</span>
				<span data-toggle="config" tooltip-placement="top" uib-tooltip="List View"> <i class="fa fa-th-list"></i></span>  
				<span data-toggle="config" tooltip-placement="top" uib-tooltip="Box View"> <i class="fa fa-th-large"></i></span>
				<span data-toggle="config" tooltip-placement="top" uib-tooltip="Table View"> <i class="fa fa-table"></i></span>
				<span></span>
			</div>
			<!--Widget Buttons-->
		</div>
		<!--Widget Header-->
		<div class="widget-body no-padding">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Email</th>
						<th>User Name</th>
						<th>Password</th>
						<th>Birthday</th>
						<th>Gender</th>
						<th>Roles</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="user in usersList">
						<td><span ng-bind="user.userId"></span></td>
						<td><span ng-bind="user.firstName"></span> <span ng-bind="user.lastName"></span></td>
						<td><span ng-bind="user.email"></span></td>
						<td><span ng-bind="user.userName"></span></td>
						<td><span ng-bind="user.password"></span></td>
						<td><span ng-bind="user.dob | date : 'dd/MM/yyyy'"></span></td>
						<td><span ng-bind="user.gender"></span></td>
						<td><span ng-repeat="userRole in user.userRoles">{{userRole.role}} {{$last ? '' : ($index==user.userRoles.length-2) ? ' and ' : ', '}}</span></td>
						<td><button type="button" ng-click="editUser(user.userId)" class="btn btn-success btn-xs">Edit</button></td>
						
					</tr>
				</tbody>
			</table>
		</div>
		</div>
		<!--Widget Body-->
	</div>
	<!--Widget--> </uib-tab> <uib-tab index="1"> <uib-tab-heading> <i
		class="fa" ng-class="(user.userId) ? 'fa-edit' : 'fa-user-plus'"></i> {{(user.userId!=null)?"Edit":"New"}} User </uib-tab-heading>

	<form name="UserForm" role="form" autocomplete="off" id="UserForm" method="post"
		ng-submit="submitUser(UserForm)" class="form-horizontal" novalidate>
		<input type="hidden" ng-modle="user.userId" />
		<div class="form-title">User Informations</div>
		
		<div class="col-md-12">
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : UserForm.firstName.$invalid && (!UserForm.firstName.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Frist Name*</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="firstName"
						id="firstName" placeholder="First Name"
						ng-model="user.firstName" required /> <small
						ng-show="UserForm.firstName.$invalid && (!UserForm.firstName.$pristine || submitted)"
						class="help-block">First name is required.</small>
				</div>
			</div>
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : UserForm.lastName.$invalid && (!UserForm.lastName.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Last Name*</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="lastName"
						id="lastName" placeholder="Last Name"
						ng-model="user.lastName" required /> <small
						ng-show="UserForm.lastName.$invalid && (!UserForm.lastName.$pristine || submitted)"
						class="help-block">Last name is required.</small>
				</div>
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : UserForm.email.$invalid && (!UserForm.email.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Email*</strong></label>
				<div class="col-md-7">
					<input type="email" class="form-control" name="email"
						id="email" placeholder="Email"
						ng-model="user.email" required /> 
					<small ng-show="UserForm.email.$error.required && (!UserForm.email.$pristine || submitted)"
						class="help-block">Email is required.</small>
					<small ng-show="UserForm.email.$error.email && (!UserForm.email.$pristine || submitted)"
						class="help-block">Invalid email address.</small>
				</div>
			</div>
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : UserForm.userName.$invalid && (!UserForm.userName.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>User Name*</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="userName"
						id="userName" placeholder="User Name"
						ng-model="user.userName" required /> 
					<small ng-show="UserForm.userName.$invalid && (!UserForm.userName.$pristine || submitted)"
						class="help-block">User name is required.</small>
				</div>
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : UserForm.password.$invalid && (!UserForm.password.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Password*</strong></label>
				<div class="col-md-7">
					<input type="password" class="form-control" ng-model="user.password" name="password" id="password"
						placeholder="Password" required /> 
					<small
						ng-show="UserForm.password.$invalid && (!UserForm.password.$pristine || submitted)"
						class="help-block">Password is required.</small>
				</div>
			</div>
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : (!UserForm.confirmPassword.$pristine && UserForm.confirmPassword.$viewValue != UserForm.password.$viewValue) || UserForm.confirmPassword.$invalid && (!UserForm.confirmPassword.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Confirm Password*</strong></label>
				<div class="col-md-7">
					<input type="password" class="form-control" name="confirmPassword" id="confirmPassword"
						placeholder="Confirm Password" ng-model="user.confirmPassword" required /> 
					<small ng-show="UserForm.confirmPassword.$invalid && (!UserForm.confirmPassword.$pristine || submitted)"
						class="help-block">Confirm Password is required.</small>
					<small ng-show="!UserForm.confirmPassword.$pristine && UserForm.confirmPassword.$viewValue != UserForm.password.$viewValue"
						class="help-block">Confirm Password is not match with password.</small>
				</div>
			</div>
		</div>

		

		<div class="col-md-12">
			<div class="form-group col-md-6" ng-class="{ 'has-error' :  UserForm.dob.$invalid && (!UserForm.dob.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Birthday</strong></label>
				<div class="col-md-7">
					<div class="input-group">
						<input type="text" uib-datepicker-popup="dd/MM/yyyy" class="form-control" name="dob"
							is-open="dobDatePicker.opened" datepicker-options="dateOptions"
							id="dob" ng-model="user.dob" placeholder="DD/MM/YYYY">
						<span class="input-group-addon" ng-click="dobDatePickerOpen()"> 
						<i class="fa fa-calendar"></i>
						</span>
					</div>
					<small ng-show="UserForm.dob.$error.date && (!UserForm.dob.$pristine || submitted)"
						class="help-block">Invalid date format.</small>
				</div>
			</div>
			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>Gender</strong></label>
				<div class="col-md-7">
					<div class="control-group">
					    <div class="radio-inline">
					        <label>
					            <input name="gender" type="radio" value="Male" ng-model="user.gender" class="colored-blue">
					            <span class="text">Male</span>
					        </label>
					    </div>
					    <div class="radio-inline">
					        <label>
					            <input name="gender" type="radio" value="Female" ng-model="user.gender" class="colored-blue">
					            <span class="text">Female</span>
					        </label>
					    </div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="form-title">Roles & Permissions</div>
		<div class="form-group">
		<div class="col-md-12">
			<div class="form-group col-md-6 no-margin"
				ng-class="{ 'has-error' : UserForm.roleName.$invalid && (!UserForm.roleName.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Role*</strong></label>
				<div class="col-md-7"></div>
			</div>
		</div>
		<div class="row col-md-offset-2">
			<div class="checkbox col-xs-4 col-sm-2" ng-repeat="role in rolesList">
			    <label>
			        <input type="checkbox" class="colored-blue form-control" name="userRoles[]" checklist-model="user.userRoles" checklist-value="setUserRoles(role.roleName)">
			        <span class="text">{{role.roleName}}</span>
			    </label>
			</div>
		</div>
		</div>

		<div class="form-group">
			<div class="col-md-offset-6 col-md-8">
				<button type="submit" class="btn btn-blue" ng-click="submitted">
					{{(user.userId!=null)?"Update":"Create"}}</button>
				<button type="reset" class="btn btn-warning">Reset</button>
			</div>
		</div>
	</form>

	</uib-tab> 
</uib-tabset>


</div>

<!-- /Page Body -->
<script	src="<c:url value="/assets/js/angular_service/account_mgmt_service.js"/>" type="text/javascript"></script>
<script	src="<c:url value="/assets/js/angular_controller/account_mgmt_controller.js"/>"	type="text/javascript"></script>
