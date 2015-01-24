Session.setDefault 'clicked', 'not set'
Template.filters.events
  # TODO: better only one event and dynamically setting the key..?
  'click label.btn:has(input[name="brand-type"])': (event, template)->
    Session.set 'filterBrandType', event.target.children[0].attributes['value']['value']
  'click label.btn:has(input[name="country"])': (event, template)->
    Session.set 'filterCountry', event.target.children[0].attributes['value']['value']
  'click label.btn:has(input[name="sales-type"])': (event, template)->
    Session.set 'filterSalesType', event.target.children[0].attributes['value']['value']
  'click label.btn:has(input[name="date-range"])': (event, template)->
    Session.set 'filterDateRange', event.target.children[0].attributes['value']['value']
Template.dataTable.helpers
  data: ->
    # use Session-filter values to obtain the necessary data from the backend
    [{data1: 'data1', data2: 'data2', data3: 'data3', data4: 'data4', data5: 'data5'}, {data1: 'data1', data2: 'data2', data3: 'data3', data4: 'data4', data5: 'data5'}, {data1: 'data1', data2: 'data2', data3: 'data3', data4: 'data4', data5: 'data5'}]
