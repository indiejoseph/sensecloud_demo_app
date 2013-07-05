'use strict'

angular.module('temperatureApp', [])
	.config ($routeProvider, $httpProvider) ->
		$routeProvider
			.when '/',
				templateUrl: 'views/main.html'
				controller: 'MainCtrl'
			.otherwise
				redirectTo: '/'

		### Remove X-Requested-With headers ###
		delete $httpProvider.defaults.headers.common["X-Requested-With"]
