var React = require('react-native');
var Badge = require('./badge');
var Separator = require('./separator');
var {
  StyleSheet,
  Text,
  View,
  ScrollView
} = React;

class Profile extends React.Component {
  render() {
    var userInfo = this.props.userInfo;
    var topics = ['company', 'location', 'followers', 'email', 'public_repos'].map((topic, index) => {
      if(!userInfo[topic]){
        return <View key={index} />
      } else {
        return <View key={index}>
          <View style={styles.rowContainer}>
            <Text style={styles.rowTitle}>{this.getRowTitle(topic)}</Text>
            <Text style={styles.rowContent}>{userInfo[topic]}</Text>
          </View>
          <Separator />
        </View>
      }
    });

    return <ScrollView style={styles.container}>
      <Badge userInfo={this.props.userInfo} />
      {topics}
    </ScrollView>
  }
  getRowTitle(topic) {
    topic = topic.replace('_', ' ').toUpperCase();
    return topic[0].toUpperCase() + topic.slice(1);
  }
};

var styles = StyleSheet.create({
  container: {
    flex: 1
  },
  buttonText: {
    fontSize: 18,
    color: 'white',
    alignSelf: 'center'
  },
  rowContainer: {
    padding: 10
  },
  rowTitle: {
    color: '#48BBEC',
    fontSize: 16
  },
  rowContent: {
    fontSize: 19
  }
});

module.exports = Profile
