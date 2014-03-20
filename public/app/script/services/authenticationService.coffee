  service.factory 'authenticationService', ['$http', ($http) ->
    {
      login: (user) ->
        $http.post 'login', user

      logout: ->
        $http.post 'logout'
    }
  ]
