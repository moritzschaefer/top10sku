# this is just for testing and should be deleteted

Meteor.startup ->
  if Categories.find().count() == 0
    # define data
    data = [
      {
        name: 'Women'
        validPurchases: '200'
        revenues : '100000'
      },
      {
        name: 'Men'
        validPurchases: '100'
        revenues : '100000'
      },
      {
        name: 'Women'
        validPurchases: '300'
        revenues : '200000'
      },
    ]
    _.each data, (item)->
      Categories.insert
        name: item.name
        validPurchases: item.validPurchases
        revenues: item.revenues
