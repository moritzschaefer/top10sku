Meteor.publish 'SKUs', (subCategoryId, weeks) ->

  timeField = 'last'+weeks
  sortMap = {}
  sortMap[timeField+'.grs_revenue'] = -1

  filterMap = {}
  filterMap['sub_category_id'] = new Meteor.Collection.ObjectID(subCategoryId)
  filterMap[timeField+'.grs_revenue'] = {'$exists': true}
  #country: {$in: countries}

  SKUs.find filterMap ,
    sort: sortMap
    limit: 10

Meteor.publish 'categories', ->
  Categories.find()
