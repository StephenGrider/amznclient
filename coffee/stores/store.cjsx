_ = require('underscore')
uuid = require('uuid')
AsyncStorage = require('react-native').AsyncStorage
fetch = require('fetch')

{UUID_STORAGE_KEY, API_ROOT_URL} = require('./../constants')

class Store
  rootUrl: API_ROOT_URL

  constructor: ->
    AsyncStorage.getItem(UUID_STORAGE_KEY)
      .then((value) =>
        if value
          @apiKey = value
        else
          @setGuid()
      )

  doRequest: (url, options = {}) ->
    _.extend(options, headers: { GUID_TOKEN : @apiKey})
    fetch("#{@rootUrl}#{url}", options)

  setGuid: ->
    @apiKey = uuid()
    AsyncStorage.setItem(UUID_STORAGE_KEY, @apiKey)


module.exports = Store
