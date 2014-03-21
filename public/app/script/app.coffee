app = angular.module 'managerApp', [
  'ngRoute', 'ngResource', 'ngSanitize', 'managerApp.services', 'managerApp.directives', 'managerApp.controllers'
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
        templateUrl: 'app/views/login.html'
        controller: 'loginController'
      }
      .when '/login', {
        templateUrl: 'app/views/login.html'
        controller: 'loginController'
      }
      .otherwise {redirectTo: '/login'}

    $locationProvider.html5Mode true if window.history and window.history.pushState


]
