  service.factory 'authenticationService', ['$http', ($http) ->
    {
      login: (user) ->
        $http.post 'login', user
        	.success (data, status) ->
        		console.log data

      logout: ->
        $http.post 'logout'
    }
  ]
