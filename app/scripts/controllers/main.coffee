'use strict'

angular.module('temperatureApp')
	.controller 'MainCtrl', ($scope, $http, $timeout) ->
		$scope.temp = 0
		$scope.created = 0
		
		getData = ->
			$http(
				method: 'GET'
				url: 'http://cloud.sensebox.co:5000/api/apps/temp/datastreams'
				headers:
					'Content-Type': 'application/json'
				crossDomain: true
			)
			.success (data, status, headers, config)->
				datastreams = data.datastreams
				if(datastreams?)
					last = datastreams.pop()
					date = last.dates.created
					
					$scope.temp = last.value
					$scope.created = date

			$timeout ->
				getData()
			, 3000

		getData()