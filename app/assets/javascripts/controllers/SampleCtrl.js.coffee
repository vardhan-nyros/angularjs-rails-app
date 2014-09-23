angular.module('sportsStore').controller "SampleCtrl" , ($scope, $routeParams, $location,TaskList,Task,paginationService,$log) ->

  $scope.init = ->
  	$scope.title = "This is Sample Test Page"