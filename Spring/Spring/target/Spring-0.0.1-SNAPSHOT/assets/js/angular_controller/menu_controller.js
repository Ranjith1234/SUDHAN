'use strict'

menuApp.controller('menuController',['$scope', '$http', '$q', function($scope, $http, $q){
     var self = this;
     self.menu = {
        "moduleCode":0,
        "moduleName":"",
        "moduleOrder":0,
        "pageName":"",
        "parent":null,
        "moduleIcon":"",
        "active":true,
        "subModules":[],
        "roleRights":[]
     };
     self.menus = [];
     
     self.fetchAllMenus = function(){
         $http.get('http://localhost:8084/springDemo/menu_json.do')
                    .then(
                        function(response){
                            console.log(response.data);
                            
                            //return response.data;
                        },
                        function(errResponse){
                            console.error('Error while fetching user');
                            return $q.reject(errResponse);
                        }
                    );
     };
     
     self.fetchAllMenus();
}]);

