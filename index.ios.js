var React = require('react-native');
var Main = require('./js/components/main');
var {
  AppRegistry,
  StyleSheet,
  NavigatorIOS,
  Text,
  View,
} = React;

var styles = StyleSheet.create({
  container:{
    flex: 1,
    backgroundColor: '#111111'
  },
});

class amznclient extends React.Component{
  render() {
    return (
      <NavigatorIOS
        style={styles.container}
        initialRoute= {{
          title: 'Github NoteTaker',
          component: Main
        }}
      />
    );
  }
};


AppRegistry.registerComponent('amznclient', () => amznclient);
