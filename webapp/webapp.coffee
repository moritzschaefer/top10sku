if Meteor.isClient
  Session.setDefault 'clicked', 'not set'
  Template.filters.events
    'click label.btn': ->
      Session.set 'clicked', 'lala'
  Template.body.helpers
    clicked: ->
      Session.get 'clicked'

if Meteor.isServer
  Meteor.startup () ->
