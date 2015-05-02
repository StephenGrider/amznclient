Store = require('./store')
ee = require('eventemitter')

class Items extends Store
  itemsUrl: '/items'
  lineItemsUrl: '/line_items'

  constructor: ->
    @items = []

  fetchItems: ->
    doRequest @itemsUrl
      .then (resp) ->
        @items.push resp.json()

  likeItem: (item) ->
    doRequest "#{@lineItemsUrl}/like",
      method: 'post',
      body:
        id: item.id

  dislikeItem: (item) ->
    doRequest "#{@lineItemsUrl}/dislike",
      method: 'post',
      body:
        id: item.id



module.exports = new Items()
