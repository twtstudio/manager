app = angular.module 'managerApp', [
  'ngRoute', 'ngResource', 'ngSanitize', 'ngCookies', 'managerApp.services', 'managerApp.directives', 'managerApp.controllers'
]

app.config ($httpProvider) ->
  $httpProvider.interceptors.push ($location, $q) ->
    {

       'response': (response) ->
        response or $q.when response

      'responseError': (rejection) ->
        if rejection.status is 401
          $location.path '/login'
        $q.reject rejection

    }

app.config [
  '$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/', {
        templateUrl: 'app/views/dashboard.html'
        controller: 'dashboardController'
      }
      .when '/login', {
        templateUrl: 'app/views/login.html'
        controller: 'loginController'
      }
      .otherwise {redirectTo: '/login'}
]


app.run ($rootScope, $location, authenticationService) ->
  $rootScope.$on '$routeChangeStart', (event, next, current) ->
    # if not authenticationService.auth()? or $location.path() isnt '/login'
    #   $location.path '/login'


controller = angular.module 'managerApp.controllers', []
