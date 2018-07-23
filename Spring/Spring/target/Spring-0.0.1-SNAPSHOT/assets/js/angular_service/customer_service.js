'use strict'
 
App.provide.factory('CustomerService',['$http', '$q', function($http, $q){
    return {
        fetchAllCustomers: function(){
            
            return $http.get('customer.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while fetching customer');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        createCustomer: function(customer){
            
            return $http.post('customer.do', customer)
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while creating customer');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        updateCustomer: function(customer, id){
            return $http.put(id+'/customer.do', customer)
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while updating customer');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        deleteCustomer: function(id){
            return $http.delete(id+'/customer.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while deleting customer');
                            return $q.reject(errResponse);
                        }
                    );
        }
        
    };    
}]);
