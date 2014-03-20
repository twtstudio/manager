angular.module 'managerApp.directives', []
  .directive 'appName', [
    'configFactory', (configFactory) ->
      (scope, element, attributes) ->
        element.text configFactory.name
  ]
  .directive 'appVersion', [
    'configFactory', (configFactory) ->
      (scope, element, attributes) ->
        element.text configFactory.version
  ]
