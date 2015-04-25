var React = require('react-native');
var {
  StyleSheet,
  Text,
  View,
  Image
} = React;

class Badge extends React.Component {
  render() {
    return <View style={styles.container}>
      <Image
        style={styles.image}
        source={{uri: this.props.userInfo.avatar_url}}
        ></Image>
      <Text style={styles.name}>{this.props.userInfo.name}</Text>
      <Text style={styles.handle}>{this.props.userInfo.login}</Text>
    </View>
  }
};

Badge.propTypes = {
  userInfo: React.PropTypes.object.isRequired
};

var styles = StyleSheet.create({
  container: {
    backgroundColor: '#48BBEC',
    paddingBottom: 10
  },
  name: {
    alignSelf: 'center',
    fontSize: 21,
    marginTop: 10,
    marginBottom: 5,
    color: 'white'
  },
  handle: {
    alignSelf: 'center',
    fontSize: 16,
    color: 'white'
  },
  image: {
    height: 125,
    width: 125,
    borderRadius: 65,
    marginTop: 10,
    alignSelf: 'center'
  }
});

module.exports = Badge;
