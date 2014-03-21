service.factory 'authenticationService', ['$http', '$location', '$cookieStore', ($http, $location, $cookieStore) ->
  {
    login: (auth) ->
      $http.post('login', auth).success (data, status) ->
        if data.error is false and status is 200
          $cookieStore.remove 'app.auth' if $cookieStore.get('app.auth')?
          $cookieStore.put 'app.auth', data.content
          $location.path '/'
    logout: ->
      $http.post 'logout'

    auth: ->
      $cookieStore.get 'app.auth'
  }
]
