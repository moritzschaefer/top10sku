Template.subCategories.helpers
  filterDateRange: ->
    Session.get 'filter-date-range'

  data: ->
    Array.prototype.extend = (other_array) ->
      # you should include a test to check whether other_array really is an array
      other_array.forEach (v) ->
        this.push(v)
      , this
    # use Session-filter values to obtain the necessary data from the backend
    if this.categoryId
      tmp = Categories.findOne
        _id: new Meteor.Collection.ObjectID(this.categoryId)
      .subCategories
    else
      tmp = []
      Categories.find().fetch().forEach (doc, index, cursor)->
        tmp.extend(doc.subCategories)

    # add top argument for enumeration
    i = 1
    _.map tmp, (v) ->
      v.top = i
      i += 1
      v

  revenuesPerTotal: (revenues) ->
    # todo: this is slow. cache the totalrevenues somehow..
    totalRevenues = _.reduce( Categories.find().fetch(),
      (memo, cat) ->
        parseFloat(memo) + parseFloat(cat.revenues)
      , 0)
    100 * revenues / totalRevenues
