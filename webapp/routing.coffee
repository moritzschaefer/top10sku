Router.configure
  layoutTemplate: 'mainLayout'
  notFoundTemplate: 'notFound'
  loadingTemplate: 'loading'

Router.map ->
  this.route 'overview', {path: ['/', '/overview']}

