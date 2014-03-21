controller
  .controller 'loginController', ['$scope', 'authenticationService', 'CSRF_TOKEN', ($scope, authenticationService, CSRF_TOKEN) ->
    $scope.user = {
      username: ''
      password: ''
    }

    $scope.login = ->
      auth = {
        username: $scope.user.username
        password: $scope.user.password
        csrf_token: CSRF_TOKEN
      }
      authenticationService.login auth

  ]
