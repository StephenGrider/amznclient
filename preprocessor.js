var coffee = require('coffee-script');
var cjsx = require('coffee-react');

module.exports = {
  process: function(src, path) {
    if (coffee.helpers.isCoffee(path)) {
      return cjsx.compile(src, {'bare': true});
    }
    return src;
  }
};
