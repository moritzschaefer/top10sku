Template.overview.helpers
  filterDateRange: ->
    if Session.get('filters')
      Session.get('filters').dateRange.value

