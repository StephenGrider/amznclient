var React = require('react-native');
var Main = require('./js/main');

var { AppRegistry, StyleSheet } = React;

var styles = StyleSheet.create({
  container:{
    flex: 1,
    backgroundColor: '#111111'
  },
});

class amznclient extends React.Component{
  render() {
    return (
      <Main />
    );
  }
};


AppRegistry.registerComponent('amznclient', () => amznclient);
