Router.configure
  layoutTemplate: 'mainLayout'
  notFoundTemplate: 'notFound'
  loadingTemplate: 'loading'


Router.route '/', ->
  this.redirect 'overview'

Router.route '/categories', ->
  this.redirect 'overview'

Router.route '/overview', ->
  this.render 'overview'

Router.route '/subCategories',
  action: ->
    this.render 'subCategories',
  name: 'subCategories.showAll'

Router.route '/subCategories/:_id',
  action: ->
    this.render 'subCategories',
      data:
        category_id: this.params._id
  name: 'subCategories.show'

Router.route '/skus/:_id',
  action: ->
    this.render 'skus',
      data:
        sub_category_id: this.params._id
  name: 'skus.show'

