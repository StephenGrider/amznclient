React = require('react-native')
{ TouchableHighlight, StyleSheet, Text, View } = React

module.exports = List = React.createClass
  _onPressForward: ->
    @props.navigator.push
      title: 'Profile'
      component: List

  _onPressBack: ->
    @props.navigator.popToTop()

  render: ->
    <View style={styles.container}>
      <Text style={styles.text}>
        hi there
      </Text>
      <TouchableHighlight
        onPress={@_onPressForward}
        style={styles.text}>
        <Text>Foward!</Text>
      </TouchableHighlight>

      <TouchableHighlight
        onPress={@_onPressBack}
        style={styles.text}>
        <Text>Go all the way back</Text>
      </TouchableHighlight>
    </View>

styles = StyleSheet.create
  container:
    flex: 1
  text:
    marginTop: 100
    alignSelf: 'center'
