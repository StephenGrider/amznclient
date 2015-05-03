Store = require('./store')
# ee = require('event-emitter')

class ItemStore extends Store
  itemsUrl: '/items'
  lineItemsUrl: '/line_items'

  constructor: ->
    super
    @items = []

  fetchItems: ->
    @doRequest @itemsUrl
      .then (resp) ->
        resp.json()
      .then (items) =>
        @items.concat(items)
      .catch (e) ->

  likeItem: (item) ->
    @doRequest "#{@lineItemsUrl}/like",
      method: 'post',
      body:
        id: item.id

  dislikeItem: (item) ->
    @doRequest "#{@lineItemsUrl}/dislike",
      method: 'post',
      body:
        id: item.id

module.exports = new ItemStore()
