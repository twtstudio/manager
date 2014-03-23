service.factory 'Sidebar', ['$resource', ($resource) ->
  $resource '/sidebar/:sidebarId', {sidebarId: '@id'}
]