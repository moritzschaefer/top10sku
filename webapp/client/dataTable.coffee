Template.dataTable.helpers
  data: ->
    # use Session-filter values to obtain the necessary data from the backend
    Categories.find()
