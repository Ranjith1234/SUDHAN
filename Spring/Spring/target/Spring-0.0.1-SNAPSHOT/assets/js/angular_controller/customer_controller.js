'use strict'
App.controllerProvider.register('customerController', ['$scope', '$http', 'CustomerService', 'CommonService', function ($scope, $http, CustomerService, CommonService) {
        var customer = function () {
            return {
            	"customerId": null,
                "customerName": null,
                "address": null,
                "city": null,
                "state": null,
                "postalCode": null,
                "country": null,
                "tin": null,
                "cstno": null,
                "cstdate": null,
                "phone": null,
                "fax": null,
                "emailId": null,
                "website": null,
                "contact": null,
                "contactPhone": null
            }
        };
        
        $scope.cust = customer();
        $scope.customersList = [];
        $scope.countries = [];
        $scope.states = [];
        
        // ------------ date picker functions ------------//
        $scope.dateOptions = {
    	    startingDay: 1,
    	    showWeeks: false
        };
        
        $scope.cstDatePicker = {
    	    opened: false
        };
        
        $scope.cstDatePickerOpen = function() {
            $scope.cstDatePicker.opened = true;
        };
     // ------------end of date picker functions ------------//
                
        $scope.submitCustomer = function (CMForm) {
            $scope.submitted = true;
            // check to make sure the form is completely valid
            if (CMForm.$valid) {
                $scope.submitted = false;
                
                if($scope.cust.customerId == null){
                	
                	CustomerService.createCustomer($scope.cust).then(
                			function(data){
                				$scope.cust = customer();
                                CMForm.$setPristine();
                                toastr.success(data.customerName,"Customer created successfully.");
                                $scope.fetchAllCustomers();
                			},
                			function(errResponse){
                				toastr.error($scope.cust.customerName, "Error while crating customer..!", {timeOut:0, extendedTimeOut:0});
                			}
                		);
                	
                }else{
                	$scope.updateCustomer(CMForm);
                }
                $scope.active = 0;
            }
        };
        
        $scope.updateCustomer = function(CMForm) {
        	
        	CustomerService.updateCustomer($scope.cust, $scope.cust.customerId).then(
        			function(data){
        				$scope.cust = customer();
                        CMForm.$setPristine();
                        toastr.success(data.customerName,"Customer updated successfully.");
                        $scope.fetchAllCustomers();
        			},
        			function(errResponse){
        				toastr.error($scope.cust.customerName, "Error while updating customer..!", {timeOut:0, extendedTimeOut:0});
        			}
        		);
        };
        
        $scope.fetchAllCustomers = function () {
        	$scope.cust = customer();
        	
        	CustomerService.fetchAllCustomers().then(
        			function(data){
        				$scope.customersList = data;
        			},
        			function(errResponse){
        				toastr.error($scope.cust.customerName, "Error while fetching customer..!", {timeOut:0, extendedTimeOut:0});
        			}
        		);
        };
        
        
        $scope.editCustomer = function(id){
        	for(var i=0; i < $scope.customersList.length; i++){
                if($scope.customersList[i].customerId === id){
                	$scope.active = 1;
                	$scope.cust = angular.copy($scope.customersList[i]);
                	$scope.getStates();
                    break;
                }
            }
        };
        
        $scope.getCountries = function(){
        	
        	CommonService.getCountries().then(
        			function(data){
        				$scope.countries = data;
        			},
        			function(errResponse){
        				toastr.error("Error while fetching countries..!", {timeOut:0, extendedTimeOut:0});
        			}
        		);
        };
        
        $scope.getStates = function(){
        	if($scope.cust.country){
        		var countryId = $scope.cust.country;
        		
        		CommonService.getStates(countryId).then(
            			function(data){
            				$scope.states = data;
            			},
            			function(errResponse){
            				toastr.error("Error while fetching states..!", {timeOut:0, extendedTimeOut:0});
            			}
            		);

        	}else{
        		console.log("country id is not set");
        	}
        };
        
        $scope.getCountries();
        $scope.fetchAllCustomers();
     
}]);

