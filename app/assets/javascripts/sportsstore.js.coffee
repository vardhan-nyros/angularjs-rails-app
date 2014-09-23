sportsStore = angular.module('sportsStore',['ngResource', 'ngRoute','mk.editablespan','ngTable'])


sportsStore.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken


sportsStore.config ($routeProvider,$locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', templateUrl: '/templates/homeIndex.html' , controller: 'HomeIndexCtrl'
  $routeProvider.when '/sample', templateUrl: '/templates/sample.html' , controller: 'SampleCtrl'



sportsStore.directive "showonhoverparent", ->
  link: (scope, element, attrs) ->
    element.parent().bind "mouseenter", ->
      element.show()
      return

    element.parent().bind "mouseleave", ->
      element.hide()
      return

    return  



      


sportsStore.directive "popover", ($compile) ->
  itemsTemplate = '<form id="new_task" class="ng-pristine" ><input type="text" autofocus="autofocus" ng-model="taskTitle" class="ng-valid"></input>&nbsp;&nbsp;<br/><button class="btn btn-primary btn-sm" type="button" ng-click="createTask(taskTitle,list)">create task</button></form>'


  getTemplate = (contentType) ->
    template = ""
    switch contentType
      when "items"
        template = itemsTemplate
    template


  link: (scope, element, attrs) ->
    popOverContent = undefined
    html = getTemplate("items")
    popOverContent = $compile(html)(scope)
    scope.listid = attrs.id
    options =
      content: popOverContent
      placement: "right"
      html: true
      title: "add task"

    $(element).popover options
    return




# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])


