'use strict'

App.controller('UserController',['$scope', '$http', 'UserService', function($scope, $http, UserService){
    var self = this;
    self.user = {id:null, username:'', email:'', address:''};
    self.users = [];
    self.test="hai this is test messge";
    self.fetchAllUsers = function(){
      UserService.fetchAllUsers()
                .then(
                    function(data){
                        
                        var dataTableConfig = {
                                "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
                                "iDisplayLength": 5,
                                "oTableTools": {
                                    "aButtons": [
                                        "copy", "csv", "xls", "pdf", "print"
                                    ],
                                    "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf"
                                },
                                "language": {
                                    "search": "",
                                    "sLengthMenu": "_MENU_",
                                    "oPaginate": {
                                        "sPrevious": "Prev",
                                        "sNext": "Next"
                                    }
                                }
                            };
                        //var oTable = $('#simpledatatable').dataTable(dataTableConfig);
                        //oTable.setData(data);
                        self.users = data;
                    },
                    function(errResponse){
                        console.error('Error while fetching users');
                    }
                );
    };
    
    self.createUser = function(user){
        UserService.createUser(user)
                .then(
                    function(){
                      self.fetchAllUsers();  
                    },
                    function(errResponse){
                        console.error('Error while creating user');
                    }
                );
    };
    
    self.updateUser = function(user, id){
        UserService.updateUser(user, id)
                .then(
                    function(){
                      self.fetchAllUsers();  
                    },
                    function(errResponse){
                        console.error('Error while updating user');
                    }
                );
    };
    
    self.deleteUser = function(id){
        UserService.deleteUser(id)
                .then(
                    function(){
                      self.fetchAllUsers();  
                    },
                    function(errResponse){
                        console.error('Error while deleting user');
                    }
                );
    };
    
    self.fetchAllUsers();
    
    self.submit = function(){
        if(self.user.id === null){
            console.log('Saving new user ', self.user);
            self.createUser(self.user);
        } else {
            self.updateUser(self.user, self.user.id);
            console.log('User updated with id ', self.user.id);
        }
        self.reset();
    };
    
    self.edit = function(id){
        console.log('Id to be edited ', id);
        for(var i=0; i < self.users.length; i++){
            if(self.users[i].id === id){
                self.user = angular.copy(self.users[i]);
                break;
            }
        }
    };
    
    self.remove = function(id){
        console.log('Id to be removed', id);
        if(self.user.id === id){
            self.reset();
        }
        self.deleteUser(id);
    };
    
    self.reset = function(){
        self.user = {id:null, username:'', email:'', address:''};
        $scope.myForm.$setPristine(); // reset Form
    };
    
}]);

//angular.bootstrap(document.getElementById("myApp_1"),['myApp']);