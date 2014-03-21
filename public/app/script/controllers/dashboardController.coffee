controller.controller 'dashboardController', [
  '$scope', 'authenticationService', '$cookieStore', '$location', ($scope, authenticationService, $cookieStore, $location) ->

    $scope.username = authenticationService.auth().username

    $scope.topNav = 'app/views/topnav.html'

    $scope.logout = ->
      authenticationService.logout()
        .success (data, status) ->
          if data.error is false and status is 200
            $cookieStore.remove 'app.auth'
            $scope.topNav = ''
            $location.path '/login'
        .error ->
]