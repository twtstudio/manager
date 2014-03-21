service.factory 'authenticationService', ['$http', '$location', '$cookieStore', ($http, $location, $cookieStore) ->
  {
    login: (user) ->
      $http.post('login', user).success (data, status) ->
      	if data.error is false and status is 200
      		$cookieStore.remove 'app.auth' if $cookieStore.get('app.auth')?
      		$cookieStore.put 'app.auth', data.content
      		# $location.path '/dashboard'
    logout: ->
      $http.post 'logout'

    auth: ->
    	$cookieStore.get 'app.auth'
  }
]
