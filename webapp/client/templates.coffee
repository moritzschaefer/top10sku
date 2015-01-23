Session.setDefault 'clicked', 'not set'
Template.filters.events
  'click label.btn': ->
    Session.set 'clicked', 'lala'
Template.dataTable.helpers
  clicked: ->
    Session.get 'clicked'
  data: ->
    [{data1: 'data1', data2: 'data2', data3: 'data3', data4: 'data4', data5: 'data5'}, {data1: 'data1', data2: 'data2', data3: 'data3', data4: 'data4', data5: 'data5'}, {data1: 'data1', data2: 'data2', data3: 'data3', data4: 'data4', data5: 'data5'}]
