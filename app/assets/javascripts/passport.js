'use strict';
var pyramidApp = angular.module('pyramidAppAdmin', ['ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'Devise']);
pyramidApp.config(['$routeProvider', '$locationProvider',function ($routeProvider, $locationProvider) {
		  $locationProvider.html5Mode(true);
		  $routeProvider
		    .when('/admin_app/connections',
		      { templateUrl: "<%= asset_path('connections.html') %>",
		        controller: "ConnectionsCtrl" })
		    .when('/admin_app/user_control',
		      { templateUrl: "<%= asset_path('user_control.html') %>",
		        controller: "UserConCtrl" })
		    .otherwise({ redirectTo: '/admin_app/' });
	}]);
pyramidApp.factory('Users', ['$resource', function($resource) {
  return $resource('/admin_app/users/:id.json', null, {
  });
}]);
pyramidApp.factory('Connections', ['$resource', function($resource) {
  return $resource('/admin_app/ssh_connections/:id.json', null, {
  });
}]);
pyramidApp.factory('Tasks', ['$resource', function($resource) {
  return $resource('/admin_app/tasks/:id.json', null, {
  });
}]);
pyramidApp.factory('Templates', ['$resource', function($resource) {
  return $resource('/admin_app/templates/:id.json', null, {
  });
}]);
pyramidApp.factory('SshCon', ['$resource', function($resource) {
  return $resource('/admin_app/connections/ssh_actions/:name/:password');
}]);
pyramidApp.factory('GetInf', ['$resource', function($resource) {
  return $resource('/admin_app/getinf/:name/:password/:command');
}]);
pyramidApp.factory('GetOutputs', ['$resource', function($resource) {
  return $resource('/admin_app/getOutputs/:name/:password/:task_name');
}]);
// pyramidApp.factory('RunCommand', ['$resource', function($resource) {
//   return $resource('/run_command/:name/:type_dell');
// }]);