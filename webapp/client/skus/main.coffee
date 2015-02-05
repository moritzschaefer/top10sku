Template.skus.helpers
  filterDateRange: ->
    Session.get 'filter-date-range'

  data: ->
    # use Session-filter values to obtain the necessary data from the backend
    tmp = SKUs.findr
      subCategoryId: new Meteor.Collection.ObjectID(this.subCategoryId)
    .fetch()

    # add top argument for enumeration
    i = 1
    _.map tmp, (v) ->
      v.imgSrc="http://pi3.lmcdn.ru/img233x336/"+v.picture_url # TODO move base URL to config
      v.top = i
      i += 1
      v
