'use strict'

App.factory('CommonService',['$http', '$q', function($http, $q){
    return {
    	getCountries: function(){
            
            return $http.get('country.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while fetching countries');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        getStates: function(countryId){
            
            return $http.get(countryId+'/states.do')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while fetching states for country id:'+countryId);
                            return $q.reject(errResponse);
                        }
                    );
        }
        
    };    
}]);
