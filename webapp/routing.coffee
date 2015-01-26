Router.configure
  layoutTemplate: 'mainLayout'
  notFoundTemplate: 'notFound'
  loadingTemplate: 'loading'


Router.route '/', ->
  this.redirect 'overview'

Router.route '/categories', ->
  this.redirect 'overview'

Router.route '/overview', ->
  this.render 'overview',
    data: {collection: Categories}

Router.route '/subCategories/:_id',
  action: ->
    this.render '/subCategories',
      data:
        collection: SubCategories
        parent_id: this.params._id
  name: 'subCategories.show'

