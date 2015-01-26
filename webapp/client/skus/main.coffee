Template.skus.helpers
  filterDateRange: ->
    Session.get 'filter-date-range'

  data: ->
    # use Session-filter values to obtain the necessary data from the backend
    tmp = SKUs.find().fetch() # TODO filter for parent=parent_id here
    # add top argument for enumeration
    i = 1
    _.map tmp, (v) ->
      v.top = i
      i += 1
      v
