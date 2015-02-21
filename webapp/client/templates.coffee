Session.setDefault 'clicked', 'not set'

# TODO move to filters.coffee
filterConfig = [
    filterValues: [{name: 'AU', value: 'au'}, {name: 'ID', value: 'id'}, {name: 'ALL', defaultActive: true, value: 'all'}]
    name: 'country'
    label: 'Country'
  ,
    filterValues: [{name: 'all', defaultActive: true, value: 'all'}, {name: 'branded', value: 'branded'}, {name: 'private', value: 'private'}]
    name: 'brandType'
    label: 'Brand Type'
  ,
    filterValues: [{name: 'Net Sale', value: 'net', defaultActive: true}, {name: 'Gross Sale', value: 'gross'}]
    name: 'salesType'
    label: 'Sales type'
  ,
    filterValues: [{name: '1', value: '1'}, {name: '2', value: '2'}, {name: '4', defaultActive: true, value: '4'}]
    name: 'dateRange'
    label: 'Date Range'
  ]


# filters
Template.filters.helpers
  filters: ->
    filterConfig

Template.filters.rendered = ->
  # check if filter variables are set already
  if !Session.get 'filters'
    # create filter object
    filters = {}
    for filter in filterConfig
      for value in filter.filterValues
        if value.defaultActive
          filters[filter.name] = value



    Session.set 'filters', filters


Template.filters.events
  # TODO: use data context instead of elements! then use this instead of event
  'click label.btn': (event, template) ->
    filters = Session.get 'filters'
    filters[event.target.children[0].attributes['name']['value']] = this

    console.log filters
    Session.set 'filters', filters

    #Session.set 'filter-'+ event.target.children[0].attributes['name']['value'], event.target.children[0].attributes['value']['value']

  # 'click label.btn:has(input[name="brand-type"])': (event, template)->
  #   Session.set 'filterBrandType', event.target.children[0].attributes['value']['value']
  # 'click label.btn:has(input[name="country"])': (event, template)->
  #   Session.set 'filterCountry', event.target.children[0].attributes['value']['value']
  # 'click label.btn:has(input[name="sales-type"])': (event, template)->
  #   Session.set 'filterSalesType', event.target.children[0].attributes['value']['value']
  # 'click label.btn:has(input[name="date-range"])': (event, template)->
  #   Session.set 'filterDateRange', event.target.children[0].attributes['value']['value']
