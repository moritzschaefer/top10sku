Session.setDefault 'clicked', 'not set'

# filters
Template.filters.helpers
  countries: ->
    # TODO: use mongo configuration
    [{name: 'AU'}, {name: 'ID'}, {name: 'ALL', default: true}]
  brandTypes: ->
    [{name: 'all', default: true}, {name: 'branded'}, {name: 'private'}]
  salesTypes: ->
    [{name: 'Net Sale', value: 'net', default: true}, {name: 'Gross Sale', value: 'gross'}]
  dateRanges: ->
    [{name: '1'}, {name: '2'}, {name: '4', default: true}]

Template.filters.rendered = ->
  # TODO set session variables based on helpers.
  #Session.set 'filter-date-range'


Template.filters.events
  # TODO: use data context instead of elements! then use this instead of event
  'click label.btn': (event, template) ->
    console.log this
    Session.set 'filter-'+ event.target.children[0].attributes['name']['value'], event.target.children[0].attributes['value']['value']

  # 'click label.btn:has(input[name="brand-type"])': (event, template)->
  #   Session.set 'filterBrandType', event.target.children[0].attributes['value']['value']
  # 'click label.btn:has(input[name="country"])': (event, template)->
  #   Session.set 'filterCountry', event.target.children[0].attributes['value']['value']
  # 'click label.btn:has(input[name="sales-type"])': (event, template)->
  #   Session.set 'filterSalesType', event.target.children[0].attributes['value']['value']
  # 'click label.btn:has(input[name="date-range"])': (event, template)->
  #   Session.set 'filterDateRange', event.target.children[0].attributes['value']['value']
