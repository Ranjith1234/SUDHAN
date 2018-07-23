'use strict'
 
App.provide.factory('AccountMgmtService',['$http', '$q', function($http, $q){
    return {
        fetchAllUsers: function(){
            
            return $http.get('api/user.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while fetching user');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        createUser: function(user){
            
            return $http.post('api/user.do', user)
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while creating user');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        updateUser: function(user, id){
            return $http.put('api/'+id+'/user.do', user)
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while updating user');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        isUserNameExist: function(username){
            return $http.get('api/'+username+'/checkusername.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Username check callback error');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        deleteUser: function(id){
            return $http.delete('api/'+id+'/user.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while deleting user');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        getAllRoles: function(){
            return $http.get('api/role.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while deleting user');
                            return $q.reject(errResponse);
                        }
                    );
        }
    };    
}]);
