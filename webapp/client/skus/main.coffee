# TODO move this to routing
Tracker.autorun ->
  Meteor.subscribe 'SKUs', Session.get('subCategoryId'), Session.get('filter-date-range')

Template.skus.helpers
  filterDateRange: ->
    Session.get 'filter-date-range'
  round: (value) ->
    Math.round value

  data: ->
    # use Session-filter values to obtain the necessary data from the backend



    tmp = SKUs.find().fetch()
    console.log tmp
    timeField = 'last'+Session.get('filter-date-range')

    # add top argument for enumeration. prepare all arguments
    i = 1
    _.map tmp, (v) ->
      v.imgSrc="http://pi3.lmcdn.ru/img233x336/"+v.picture_url # TODO move base URL to config
      v.url="http://www.lamoda.ru/p/"+v.product_sku.toLowerCase() # tolowercase is not necessary

      v.timeData = v[timeField]
      v.metadata = [
        title: 'SKU'
        value: v.product_sku
      ,
        title: 'Brand'
        value: v.brand
      ,
        title: 'Product'
        value: 'N/A'
      ,
        title: 'Buyer Name'
        value: 'N/A'
      ,
        title: 'Current Stock'
        value: v.stock
      ,
        title: 'Black price'
        value: v.blackprice
      ,
        title: 'Discout price'
        value: v.discoutprice
      ]
      v.statistics = [
        title: 'Valid Purchases'
        value: 'N/A'
      ,
        title: 'Views'
        value: v.timeData.page_views
      ,
        title: 'Cart'
        value: 'N/A'
      ,
        title: 'Visitors'
        value: v.timeData.visitors
      ,
        title: 'Impressions'
        value: v.timeData.impressions
      ]

      v.top = i
      i += 1
      v
