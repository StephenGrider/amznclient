var React = require('react-native');
var {
  StyleSheet,
  Text,
  View,
  Image,
  TouchableHighlight
} = React;


class Dashboard extends React.Component {
  render() {
    return <View style={styles.container}>
      <Image
        source={{uri: this.props.userInfo.avatar_url}}
        style={styles.image}>
      </Image>

      <TouchableHighlight
        onPress={this.goToProfile.bind(this)}
        underlayColor='#88D4F5'
        style={this.makeBackground(0)}>
        <Text style={styles.buttonText}> View Profile </Text>
      </TouchableHighlight>

      <TouchableHighlight
        onPress={this.goToRepos.bind(this)}
        underlayColor='#88D4F5'
        style={this.makeBackground(1)}>
        <Text style={styles.buttonText}> View Repos </Text>
      </TouchableHighlight>

      <TouchableHighlight
        onPress={this.goToNotes.bind(this)}
        underlayColor='#88D4F5'
        style={this.makeBackground(2)}>
        <Text style={styles.buttonText}> View Notes </Text>
      </TouchableHighlight>
    </View>
  }
  goToProfile() {

  }
  goToRepos() {

  }
  goToNotes() {

  }
  makeBackground(button) {
    var obj = {
      flexDirection: 'row',
      alignSelf: 'stretch',
      justifyContent: 'center',
      flex: 1
    };

    if(button === 0){
      obj.backgroundColor = '#48BBEC';
    } else if (button === 1) {
      obj.backgroundColor = '#E77AAE';
    } else {
      obj.backgroundColor = '#7588F4';
    }

    return obj
  }
}

var styles = StyleSheet.create({
  container: {
    marginTop: 65,
    flex: 1
  },
  image: {
    height: 350,
  },
  buttonText: {
    fontSize: 24,
    color: 'white',
    alignSelf: 'center'
  }
});

module.exports = Dashboard
