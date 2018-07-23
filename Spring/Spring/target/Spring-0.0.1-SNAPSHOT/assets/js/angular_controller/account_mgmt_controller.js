'use strict'
App.controllerProvider.register('AccountMgmtController', ['$scope', '$http', 'AccountMgmtService', function ($scope, $http, AccountMgmtService) {
        var user = function () {
            return {
            	"userId": null,
            	"firstName": null,
            	"lastName": null,
            	"email": null,
                "userName": null,
                "password": null,
                "confirmPassword": null,
                "dob": null,
                "gender": null,
                "userRoles": null
            }
        };
        
        $scope.setUserRoles = function(role){
        	return{
        		"urid":null,
        		"userId": $scope.user.userId,
        		"role": role
        	}
        }
        
        $scope.user = user();
        $scope.usersList = [];

        $scope.rolesList = [];
        
     // ------------ date picker functions ------------//
        $scope.dateOptions = {
    	    startingDay: 1,
    	    showWeeks: false
        };
        
        $scope.dobDatePicker = {
    	    opened: false
        };
        
        $scope.dobDatePickerOpen = function() {
            $scope.dobDatePicker.opened = true;
        };
     // ------------end of date picker functions ------------//
        
        $scope.submitUser = function (UserForm) {
            $scope.submitted = true;
            // check to make sure the form is completely valid
            if (UserForm.$valid) {
                $scope.submitted = false;
                
                if($scope.user.userId == null){
                	
                	AccountMgmtService.createUser($scope.user).then(
                			function(data){
                				$scope.user = user();
                                UserForm.$setPristine();
                                toastr.success(data.userName,"User created successfully.");
                                $scope.fetchAllUsers();
                			},
                			function(errResponse){
                				console.log(errResponse);
                				toastr.error($scope.user.userName, "Error while crating user..!", {timeOut:0, extendedTimeOut:0});
                			}
                		);
                	
                }else{
                	$scope.updateUser(UserForm);
                }
                $scope.active = 0;
            }
        };
        
        $scope.updateUser = function(UserForm) {
        	
        	AccountMgmtService.updateUser($scope.user, $scope.user.userId).then(
        			function(data){
        				$scope.user = user();
                        UserForm.$setPristine();
                        toastr.success(data.userName,"User updated successfully.");
                        $scope.fetchAllUsers();
        			},
        			function(errResponse){
        				toastr.error($scope.user.userName, "Error while updating user..!", {timeOut:0, extendedTimeOut:0});
        			}
        		);
        };
        
        $scope.fetchAllUsers = function () {
        	$scope.user = user();
        	AccountMgmtService.fetchAllUsers().then(
        			function(data){
        				$scope.usersList = data;
        				console.log(data);
        			},
        			function(errResponse){
        				toastr.error($scope.user.userName, "Error while fetching user..!", {timeOut:0, extendedTimeOut:0});
        			}
        		);
        };
        
        $scope.getAllRoles = function(){
        	AccountMgmtService.getAllRoles().then(
        			function(data){
        				$scope.rolesList = data;
        				console.log(data);
        			},
        			function(errResponse){
        				toastr.error($scope.user.userName, "Error while fetching roles..!", {timeOut:0, extendedTimeOut:0});
        			}
        		);
        };
        
        $scope.isUserNameExist = function(username){
        	AccountMgmtService.isUserNameExist(username).then(
        			function(data){
        				return data;
        			}
        		);
        };
        
        
        $scope.editUser = function(id){
        	for(var i=0; i < $scope.usersList.length; i++){
                if($scope.usersList[i].userId === id){
                	$scope.active = 1;
                	$scope.user = angular.copy($scope.usersList[i]);
                	angular.forEach($scope.user.userRoles, function(userRole){
                		userRole.urid = null;
                		userRole.userId= null;
                	});
                	console.log($scope.user);
                    break;
                }
            }
        };
        
        $scope.checkAssignedRoles = function(roleName){
        	var result = false;
        	angular.forEach($scope.user.userRoles, function(role){
        		if(role == roleName){
        			result = true;
        			return; // its bcoz, it works async
        		}
        	});
        	return result;
        };
        
        $scope.updateRoles = function(){
        	alert(UserForm.rolesList);
        };

        
        $scope.isUserNameExist('test');
        $scope.getAllRoles();
        $scope.fetchAllUsers();
     
}]);

