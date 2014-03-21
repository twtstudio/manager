controller
  .controller 'loginController', ['$scope', 'authenticationService', ($scope, authenticationService) ->
    $scope.user = {
      username: ''
      password: ''
    }

    $scope.login = ->
      authenticationService.login $scope.user

  ]