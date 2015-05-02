React = require('react-native')
SideMenu = require('react-native-side-menu')
Menu = require('./components/menu')

{ View, NavigatorIOS, StyleSheet } = React

class Main extends React.Component
  render: ->
    <Menu />

styles = StyleSheet.create
  container:
    flex: 1,
    backgroundColor: '#111111'

module.exports = Main
