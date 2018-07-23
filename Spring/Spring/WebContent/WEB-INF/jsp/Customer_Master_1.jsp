
<%-- 
    Document   : Customer Master
    Created on : 14 Mar, 2016, 4:46:59 PM
    Author     : admin
--%>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Page Body -->

<div class="row" ng-controller="customerController">

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="widget">
					<div class="widget-header bordered-bottom bordered-blue">
						<span class="widget-caption"><strong>Customer
								Master</strong></span>
						<div class="buttons-preview">
							<button class="btn btn-info" onclick="showModal()"
								data-accesskey='v'>
								<i class="fa fa-search"></i><u class="scut">V</u>iew
							</button>
						</div>
					</div>
					<div class="widget-body">
						<form name="CMForm" autocomplete="off" id="CMForm" method="post"
							ng-submit="submitCustomer()" class="form-horizontal" novalidate>
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
											ng-model="cust.country.countryId" placeholder="Country"
											required>
											<option value="">-Select-</option>
											<!-- 											<option value="1">India</option> -->
											<c:forEach items="${countryList}" var="country">
												<option value='${country.countryId}'>${country.countryName}</option>
											</c:forEach>
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
											ng-model="cust.state.sid" placeholder="State" required>
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
									<label class="col-md-5 control-label"><strong>
											<u class="scut">T</u>IN*
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
											<u class="scut">C</u>STNO
									</strong></label>
									<div class="col-md-7">
										<input type="text" class="form-control capsON" name="CSTNo"
											id="CSTNo" placeholder="CSTNO" ng-model="cust.cstno" />
									</div>
								</div>

								<div class="form-group col-md-6">
									<label class="col-md-5 control-label"><strong>CST<u
											class="scut">D</u>ate
									</strong></label>

									<div class="col-md-7">
										<div class="input-group">
											<input type="text" datepicker class="form-control"
												name="CSTDate" id="CSTDate" placeholder="CSTDate"
												ng-model="cust.cstdate" readonly> <span
												class="input-group-addon"> <i class="fa fa-calendar"></i>
											</span>
										</div>

									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group col-md-6">
									<label class="col-md-5 control-label"><strong>
											<u class="scut">P</u>hone No
									</strong></label>
									<div class="col-md-7">
										<input type="text" class="form-control capsON" name="phone"
											id="phone" ng-model="cust.phone" placeholder="Phone No" />
									</div>
								</div>

								<div class="form-group col-md-6">
									<label class="col-md-5 control-label"><strong>
											<u class="scut">F</u>ax
									</strong></label>
									<div class="col-md-7">
										<input type="text" class="form-control capsON" name="fax"
											id="fax" ng-model="cust.fax" placeholder="Fax" />
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group col-md-6">
									<label class="col-md-5 control-label"><strong>
											<u class="scut">E</u>mail ID
									</strong></label>
									<div class="col-md-7">
										<input type="text" class="form-control capsON" name="emailId"
											id="emailId" ng-model="cust.emailId" placeholder="Email Id" />
									</div>
								</div>

								<div class="form-group col-md-6">
									<label class="col-md-5 control-label"><strong>
											<u class="scut">W</u>ebsite
									</strong></label>
									<div class="col-md-7">
										<input type="text" class="form-control capsON" name="website"
											id="website" ng-model="cust.website" placeholder="Website" />
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group col-md-6">
									<label class="col-md-5 control-label"><strong>
											<u class="scut">C</u>ontact Name
									</strong></label>
									<div class="col-md-7">
										<input type="text" class="form-control capsON" name="contact"
											id="contact" ng-model="cust.contact" placeholder="Contact" />
									</div>
								</div>
								<div class="form-group col-md-6">
									<label class="col-md-5 control-label"><strong>
											<u class="scut">C</u>ontact Phone No
									</strong></label>
									<div class="col-md-7">
										<input type="text" class="form-control capsON"
											name="contactPhone" id="contactPhone"
											ng-model="cust.contactPhone" placeholder="Contact Phone No" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-offset-6 col-md-8">
									<button type="submit" class="btn btn-blue" ng-click="submitted"
										data-accesskey='s'>
										<u class="scut">S</u>ubmit
									</button>
								</div>
							</div>
						</form>
						<div id="test"></div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>

<!-- /Page Body -->


<script
	src="<c:url value="/assets/js/angular_controller/customer_controller.js"/>"
	type="text/javascript"></script>


