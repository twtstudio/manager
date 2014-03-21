controller.controller 'mainController', [
  '$scope', 'authenticationService', '$cookieStore', ($scope, authenticationService, $cookieStore) ->

    $scope.username = authenticationService.auth().username

    $scope.topNav = 'app/views/topnav.html'

    $scope.logout = ->
      authenticationService.logout()
        .success (data, status) ->
          if data.error is false and status is 200
            $cookieStore.remove 'app.auth'
            $scope.topNav = ''
        .error ->



]