Template.subCategories.helpers
  filterDateRange: ->
    Session.get 'filter-date-range'

  dummy: (inp)->
    console.log Router.current().params
    console.log inp


