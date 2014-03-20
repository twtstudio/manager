angular.module 'managerApp.controllers', []
  .controller 'loginController', [
    '$scope', ($scope)->
      $scope.user = {
        username: ''
        password: ''
      }

      $scope.login = ->
        alert 'login'

  ]
