Model = require('ampersand-model')
Fetch = require('ampersand-fetch')

#AmpersandJS doesn't support ES6 Classes

AmznModel = Model.extend
  sync: ->
    Fetch.apply(this, arguments)

module.exports = AmznModel
