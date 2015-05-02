// Generated by CoffeeScript 1.9.2
var Main, Menu, NavigatorIOS, React, SideMenu, StyleSheet, View, styles,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

SideMenu = require('react-native-side-menu');

Menu = require('./components/menu');

View = React.View, NavigatorIOS = React.NavigatorIOS, StyleSheet = React.StyleSheet;

Main = (function(superClass) {
  extend(Main, superClass);

  function Main() {
    return Main.__super__.constructor.apply(this, arguments);
  }

  Main.prototype.render = function() {
    return React.createElement(Menu, null);
  };

  return Main;

})(React.Component);

styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#111111'
  }
});

module.exports = Main;
