angular.module('sportsStore').controller "HomeIndexCtrl" , ($scope, $routeParams, $location,TaskList,Task,paginationService,$log) ->
  #$scope.lists = [{title: "first "}, {title: "second"}]
  $scope.init = ->
    @listService = new TaskList(serverErrorHandler)
    $scope.lists = @listService.all()
    #$scope.items = @listService.all()
    $scope.currentPage = 1
    $scope.pageSize = 3
    notifyCall("Welcome to Angular Rails Sample application","you are on the listings page now","info")
  
  
  $scope.$watch "currentPage", (page) ->
    paginationService.setCurrentPage page
    return

  $scope.setCurrentPage = (val) ->  
    #paginationService.setCurrentPage(val);
    $scope.currentPage = val
    return



  $scope.createList = (name) ->
    @listService.create title: name , (list) ->
      #$location.url("/task_lists/#{list.id}")
      $scope.lists.unshift(list) 
      $scope.listTitle = "" 
      notifyCall(list.title, "List is created successfully", "success")
  
  $scope.deleteList = (list,index) ->
  	@listService.delete list , (returnval) ->
  		console.log(returnval) 
  	$scope.lists.splice(index,1)


  $scope.listEdited = (list) ->
    @listService.update(list, title: list.title)
    notifyCall(list.title, "List is updated as "+ list.title, "success")


  $scope.deleteTask = (list,task,index) ->
    @taskService = new Task(list.id,serverErrorHandler) 
    @taskService.delete list,task, (return_val) ->
      console.log("deleted")
    $scope.tasks.splice(index,1)

  $scope.taskEdited = (list,task) ->
    @taskService = new Task(list.id,serverErrorHandler)
    @taskService.update(list,task, title: task.title)
    notifyCall(task.title, "Task is updated as "+ task.title, "success")

  $scope.showlisttasks = (list,index) ->
    @taskService = new Task(list.id,serverErrorHandler)
    $scope.tasks = @taskService.all()
    $scope.list = list
    $("#task-list-view").removeClass("col-lg-10").addClass("col-lg-5")
    $("#tasks-view").removeClass("hide")

  $scope.createTask = (name,list) -> 
    @taskService = new Task(list.id,serverErrorHandler) 
    $scope.list = list
    $scope.tasks = @taskService.all() 
    @taskService.create title: name, (task) ->
      #$scope.tasks = task
      $scope.tasks.unshift(task) 
      $("#task-list-view").removeClass("col-lg-10").addClass("col-lg-5")
      $("#tasks-view").removeClass("hide")
      $('.taskpopover').popover('hide')

  serverErrorHandler = ->
    "There was a server error, please reload the page and try again." 

  

  notifyCall = (title, text,type) ->
    new PNotify
      title: title
      text: text
      type: type
      styling: 'bootstrap3'

  