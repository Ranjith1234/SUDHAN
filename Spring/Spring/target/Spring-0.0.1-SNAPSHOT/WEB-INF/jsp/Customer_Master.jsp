
<%-- 
    Document   : Customer Master
    Created on : 14 Mar, 2016, 4:46:59 PM
    Author     : admin
--%>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Page Body -->

<div class="row" ng-controller="customerController">

	<div class="col-md-12 col-sm-12 col-xs-12"></div>

	<uib-tabset active="active"> <uib-tab index="0"
		select="fetchAllCustomers()"> <uib-tab-heading>
	<i class="fa fa-vcard-o fa-lg"></i> Customers </uib-tab-heading>
<div class="table-responsive">
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>#</th>
				<th>Customer Name</th>
				<th>Address</th>
				<th>TIN</th>
				<th>CST No.</th>
				<th>CST Date</th>
				<th>Phone</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="customer in customersList">
				<td><span ng-bind="customer.customerId"></span></td>
				<td><span ng-bind="customer.customerName"></span></td>
				<td><span ng-bind="customer.address"></span></td>
				<td><span ng-bind="customer.tin"></span></td>
				<td><span ng-bind="customer.cstno"></span></td>
				<td><span ng-bind="customer.cstdate | date:'dd/MM/yyyy' "></span></td>
				<td><span ng-bind="customer.phone"></span></td>
				<td><button type="button"
						ng-click="editCustomer(customer.customerId)"
						class="btn btn-success btn-xs">Edit</button></td>
			</tr>
		</tbody>
	</table>
	</div>
	</uib-tab> <uib-tab index="1"> <uib-tab-heading> <i
		class="fa" ng-class="(cust.customerId) ? 'fa-edit' : 'fa-user-plus'"></i> {{(cust.customerId!=null)?"Edit":"New"}} Customer </uib-tab-heading>

	<form name="CMForm" role="form" autocomplete="off" id="CMForm" method="post"
		ng-submit="submitCustomer(CMForm)" class="form-horizontal" novalidate>
		<input type="hidden" ng-modle="cust.customerId" />
		<div class="form-title">Customer Informations</div>
		<div class="col-md-12">
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : CMForm.customerName.$invalid && (!CMForm.customerName.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>Customer
						Name*</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="customerName"
						id="customerName" placeholder="Customer Name"
						ng-model="cust.customerName" required /> <small
						ng-show="CMForm.customerName.$invalid && (!CMForm.customerName.$pristine || submitted)"
						class="help-block">Customer Name is required.</small>
				</div>
			</div>
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : CMForm.address.$invalid && (!CMForm.address.$pristine || submitted)}">
				<label class="col-md-5 control-label"><strong>Address*</strong></label>
				<div class="col-md-7">
					<textarea class="form-control" name="address" id="address"
						placeholder="Address" ng-model="cust.address" required /></textarea>
					<small
						ng-show="CMForm.address.$invalid && (!CMForm.address.$pristine || submitted)"
						class="help-block">Customer Address is required.</small>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : CMForm.city.$invalid && (!CMForm.city.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>
						City*</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="city" id="city"
						placeholder="City" ng-model="cust.city" required /> <small
						ng-show="CMForm.city.$invalid && (!CMForm.city.$pristine || submitted)"
						class="help-block">Customer City is required.</small>
				</div>
			</div>
			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>
						Postal Code</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="postalCode"
						id="postalCode" ng-model="cust.postalCode"
						placeholder="Postal Code" />
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : CMForm.country.$invalid && (!CMForm.country.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>
						Country* </strong></label>
				<div class="col-md-7">
					<select class="form-control" name="country" id="country" 
						ng-options="country.countryId as country.countryName for country in countries"
						ng-change="getStates()"
						ng-model="cust.country" placeholder="Country" required>
						<option value="">-Select-</option>
<%-- 						<c:forEach items="${countryList}" var="country"> --%>
<%-- 							<option value='${country.countryId}'>${country.countryName}</option> --%>
<%-- 						</c:forEach> --%>
					</select> <small
						ng-show="CMForm.country.$invalid && (!CMForm.country.$pristine || submitted)"
						class="help-block">Customer Country is required.</small>
				</div>
			</div>
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : CMForm.state.$invalid && (!CMForm.state.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong>
						State*</strong></label>
				<div class="col-md-7">
					<select class="form-control" name="state" id="state" 
						ng-options="state.sid as state.stateName for state in states"
						ng-model="cust.state" placeholder="State" required>
						<option value="">-Select-</option>
					</select> <small
						ng-show="CMForm.state.$invalid && (!CMForm.state.$pristine || submitted)"
						class="help-block">Customer State is required.</small>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="form-group col-md-6"
				ng-class="{ 'has-error' : CMForm.TIN.$invalid && (!CMForm.TIN.$pristine || submitted) }">
				<label class="col-md-5 control-label"><strong> TIN*
				</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="TIN" id="TIN"
						placeholder="TIN" ng-model="cust.tin" required /> <small
						ng-show="CMForm.TIN.$invalid && (!CMForm.TIN.$pristine || submitted)"
						class="help-block">Customer TIN No. is required.</small>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>
						CSTNO </strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control capsON" name="CSTNo"
						id="CSTNo" placeholder="CSTNO" ng-model="cust.cstno" />
				</div>
			</div>

			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>CST
						Date </strong></label>

				<div class="col-md-7">
					<div class="input-group">
						<input type="text" uib-datepicker-popup="dd/MM/yyyy" class="form-control" name="CSTDate"
							is-open="cstDatePicker.opened" datepicker-options="dateOptions"
							id="CSTDate" ng-model="cust.cstdate" placeholder="DD/MM/YYYY">
						<span class="input-group-addon" ng-click="cstDatePickerOpen()"> 
						<i class="fa fa-calendar"></i>
						</span>
					</div>

				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>
						Phone No </strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control capsON" name="phone"
						id="phone" ng-model="cust.phone" placeholder="Phone No" />
				</div>
			</div>

			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong> Fax
				</strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control capsON" name="fax" id="fax"
						ng-model="cust.fax" placeholder="Fax" />
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>
						Email ID </strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control capsON" name="emailId"
						id="emailId" ng-model="cust.emailId" placeholder="Email Id" />
				</div>
			</div>

			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>
						Website </strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control capsON" name="website"
						id="website" ng-model="cust.website" placeholder="Website" />
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>
						Contact Name </strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control capsON" name="contact"
						id="contact" ng-model="cust.contact" placeholder="Contact" />
				</div>
			</div>
			<div class="form-group col-md-6">
				<label class="col-md-5 control-label"><strong>
						Contact Phone No </strong></label>
				<div class="col-md-7">
					<input type="text" class="form-control capsON" name="contactPhone"
						id="contactPhone" ng-model="cust.contactPhone"
						placeholder="Contact Phone No" />
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-offset-6 col-md-8">
				<button type="submit" class="btn btn-blue" ng-click="submitted">
					{{(cust.customerId!=null)?"Update":"Create"}}</button>
				<button type="reset" class="btn btn-warning">Reset</button>
			</div>
		</div>
	</form>

	</uib-tab> 
</uib-tabset>


</div>

<!-- /Page Body -->

<script	src="<c:url value="/assets/js/angular_service/customer_service.js"/>" type="text/javascript"></script>
<script	src="<c:url value="/assets/js/angular_controller/customer_controller.js"/>"	type="text/javascript"></script>

