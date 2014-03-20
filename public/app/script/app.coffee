app = angular.module 'managerApp', [
  'ngRoute', 'ngResource', 'ngSanitize', 'managerApp.services', 'managerApp.directives', 'managerApp.controllers'
]

app.config [
  '$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/', {
        templateUrl: 'app/views/login.html'
        controller: 'loginController'
      }
      .otherwise {redirectTo: '/'}

    $locationProvider.html5Mode true if window.history and window.history.pushState


]
