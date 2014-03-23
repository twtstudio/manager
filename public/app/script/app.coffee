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
  '$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider
      .when '/index', '/'
      .otherwise '/login'

    $stateProvider
      .state 'index', {
        abstract: true
        url: '/'
        resolve: {
          sidebars: ['Sidebar', (Sidebar) ->
            Sidebar.query()
          ]
        }
        templateUrl: 'app/views/dashboard.html'
        controller: 'dashboardController'
      }
      .state 'index.dashboard', {
        url: ''
        views: {
          'topnav': {
            templateUrl: 'app/views/topnav.html'
          }
          'sidebar': {
            templateUrl: 'app/views/sidebar.html'
            controller: 'sidebarController'
          }
        }

      }

      .state 'login', {
        url: '/login'
        templateUrl: 'app/views/login.html'
        controller: 'loginController'
      }

]


.run ($rootScope, $state, authenticationService) ->
  $rootScope.$on '$routeChangeStart', (event, next, current) ->
    # if not authenticationService.auth()?
    #   $state.go 'login'


controller = angular.module 'managerApp.controllers', []
