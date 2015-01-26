Template.dataTable.helpers
  data: ->
    # use Session-filter values to obtain the necessary data from the backend
    tmp = this.collection.find().fetch()
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

