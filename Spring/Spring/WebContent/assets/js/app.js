'use strict';
var $routeProviderReference;

var App = angular.module('myApp', ['ngRoute','ui.bootstrap','ui.utils','checklist-model']);

App.config(['$routeProvider',
    '$controllerProvider',
    '$compileProvider',
    '$filterProvider',
    '$provide',
    function ($routeProvider, $controllerProvider, $compileProvider, $filterProvider, $provide) {

        App.controllerProvider = $controllerProvider;
        App.compileProvider = $compileProvider;
        App.routeProvider = $routeProvider;
        App.filterProvider = $filterProvider;
        App.provide = $provide;
        $routeProviderReference = $routeProvider;
    }]);

App.run(function ($rootScope, $routeParams, $http, $route, Utility) {
    $http.get('routeJson.do').success(function (routes) {
        for (var i = 0; i < routes.length; i++) {
            var currentRoute = routes[i];
            $routeProviderReference
                    .when(currentRoute.name, {
                        templateUrl: currentRoute.templateUrl,
                        title: currentRoute.title
                    });

        }
        
        $routeProviderReference.otherwise(
                {redirectTo: 'dashboard.do'});
        
        $route.reload();

        $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
            if (current.hasOwnProperty('$$route')) {
                $rootScope.title = current.$$route.title;
            }
            if (angular.isDefined(current.$$route)) {
                $rootScope.title = Utility.parseTitle(current.$$route.title, $routeParams);
            }
        });
    });
});


App.service('Utility', function () {
    this.parseTitle = function (title, params) {
        return title;
    };
});
App.directive('datepicker', function () {
    return function (scope, element, attrs) {
        element.datepicker({
            format: 'dd/mm/yyyy'
        }).on('changeDate', function (e) {
            var modelPath = $(this).attr('ng-model');
            putObject(modelPath, scope, $(this).val());
            //scope[modelPath] = $(this).val();
            scope.$apply();
        });
    };
});

function putObject(path, object, value) {
    var modelPath = path.split(".");

    function fill(object, elements, depth, value) {
        var hasNext = ((depth + 1) < elements.length);
        if (depth < elements.length && hasNext) {
            if (!object.hasOwnProperty(modelPath[depth])) {
                object[modelPath[depth]] = {};
            }
            fill(object[modelPath[depth]], elements, ++depth, value);
        } else {
            object[modelPath[depth]] = value;
        }
    }
    fill(object, modelPath, 0, value);
}

function commonresult(msg, type) {
    var myclass = "alert-success";
    if ($.trim(type) === "error") {
        myclass = "alert-danger";
    } else if ($.trim(type) === "warning"){
    	myclass = "alert-warning";
    } else {
    	myclass = "alert-success";
    }
    $("#results").hide();
    var res = '<div class="alert ' + myclass + ' fade in"><button class="close" data-dismiss="alert">';
    res += '× </button><i class="fa-fw fa fa-check"></i>';
    res += $.trim(msg) + '</div>';
    $("#results").html(res);
    $("#results").fadeIn(500);
    $("#results").delay('7000').fadeOut(1000);
}


 /*
 
            App.controller(currentRoute.controller,[function(){
           	 var self = this;
           }]);

 App.controller('newcustomercontroller', function ($scope) {
 $scope.check = "checking";
 });
 */