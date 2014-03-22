app = angular.module 'managerApp', [
  'ui.router', 'ngResource', 'ngSanitize', 'ngCookies', 'managerApp.services', 'managerApp.directives', 'managerApp.controllers'
]

.run [
  '$rootScope', '$state', '$stateParams', ($rootScope, $state, $stateParams) ->

    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams
]

.config ($httpProvider) ->
  $httpProvider.interceptors.push ($location, $q) ->
    {

       'response': (response) ->
        response or $q.when response

      'responseError': (rejection) ->
        if rejection.status is 401
          $location.path '/login'
        $q.reject rejection

    }

.config [
  # '$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  #   $routeProvider
  #     .when '/', {
  #       templateUrl: 'app/views/dashboard.html'
  #       controller: 'dashboardController'
  #     }
  #     .when '/login', {
  #       templateUrl: 'app/views/login.html'
  #       controller: 'loginController'
  #     }
  #     .otherwise {redirectTo: '/login'}

  '$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider
      .when '/index', '/'
      .otherwise '/login'

    $stateProvider
      .state 'index', {
        url: '/'
        templateUrl: 'app/views/dashboard.html'
        controller: 'dashboardController'
      }

      .state 'login', {
        url: '/login'
        templateUrl: 'app/views/login.html'
        controller: 'loginController'
      }

]


.run ($rootScope, $location, authenticationService) ->
  $rootScope.$on '$routeChangeStart', (event, next, current) ->
    if not authenticationService.auth()?
      $location.path '/login'


controller = angular.module 'managerApp.controllers', []
