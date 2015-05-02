React = require('react-native')
SideMenu = require('react-native-side-menu')
Router = require('./components/router')

{ View, NavigatorIOS, StyleSheet } = React

module.exports = class Main extends React.Component
  render: ->
    <Router />

styles = StyleSheet.create
  container:
    flex: 1,
    backgroundColor: '#111111'
