angular.module 'managerApp.controllers', []
  .controller 'loginController', ['$scope', '$location', 'authenticationService', ($scope, $location, authenticationService) ->
    $scope.user = {
      username: ''
      password: ''
    }

    $scope.login = ->
      authenticationService.login $scope.user

  ]
