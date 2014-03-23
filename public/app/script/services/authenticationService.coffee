service.factory 'authenticationService', ['$http', '$state', '$cookieStore', ($http, $state, $cookieStore) ->
  {
    login: (auth) ->
      $http.post('login', auth).success (data, status) ->
        if data.error is false and status is 200
          $cookieStore.remove 'app.auth' if $cookieStore.get('app.auth')?
          $cookieStore.put 'app.auth', data.content
          $state.go 'index.dashboard'
    logout: ->
      $http.post 'logout'

    auth: ->
      $cookieStore.get 'app.auth'
  }
]
