var Model = require('ampersand-model');
var Fetch = require('ampersand-fetch');

// AmpersandJS doesn't support ES6 Classes
var AmznModel = Model.extend({
  sync() {
    return Fetch.apply(this, arguments);
  }
});

module.exports = AmznModel;
