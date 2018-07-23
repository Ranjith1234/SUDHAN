'use strict'
 
App.factory('UserService',['$http', '$q', function($http, $q){
    return {
        fetchAllUsers: function(){
            
            return $http.get('user.do')
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
            
            return $http.post('user.do', user)
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
            return $http.put(id+'/user.do', user)
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
        
        deleteUser: function(id){
            return $http.delete(id+'/user.do')
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
