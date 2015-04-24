var React = require('react-native');
var Api = require('../utils/api');
var Dashboard = require('../components/dashboard');
var {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableHighlight,
  ActivityIndicatorIOS
} = React;

class Main extends React.Component{
  constructor (props) {
    super(props);
    this.getInitialState()
  }
  getInitialState () {
    this.state = {
      username: '',
      isLoading: false,
      error: false
    };
  }
  handleChange (event) {
    this.setState({
      error: false,
      username: event.nativeEvent.text
    });
  }
  handlePress (event) {
    this.setState({
      isLoading: true
    });

    Api.getBio(this.state.username)
      .then((res) => {
        if(res.message === 'Not Found') {
          this.setState({
            error: 'Not Found',
            isLoading: false
          })
        } else {
          this.props.navigator.push({
            title: res.name || 'Select an Option',
            component: Dashboard,
            passProps: {userInfo: res}
          });
          this.getInitialState();
        }
      });
  }
  render () {
    var showError = (
      this.state.error? <Text style={styles.buttonText}> {this.state.error} </Text>: <View></View>
    )

    return (
      <View style={styles.mainContainer}>
        <Text style={styles.title}>Search for a Github User</Text>
        <TextInput
          style={styles.searchInput}
          value={this.state.username}
          onChange={this.handleChange.bind(this)} />
        <TouchableHighlight style={styles.button}
          onPress={this.handlePress.bind(this)}
          underlayColor="white">
          <Text style={styles.buttonText}> SEARCH </Text>
        </TouchableHighlight>
        <ActivityIndicatorIOS
          animating={this.state.isLoading}
          color="#111"
          size="large"></ActivityIndicatorIOS>
        {showError}
      </View>
    )
  }
}

var styles = StyleSheet.create({
  mainContainer: {
    flex: 1,
    padding: 30,
    marginTop: 65,
    flexDirection: 'column',
    justifyContent: 'center',
    backgroundColor: '#48BBEC'
  },
  title: {
    marginBottom: 20,
    fontSize: 25,
    textAlign: 'center',
    color: '#fff'
  },
  searchInput: {
    height: 50,
    padding: 4,
    marginRight: 5,
    fontSize: 23,
    borderWidth: 1,
    borderColor: 'white',
    borderRadius: 8,
    color: 'white'
  },
  buttonText: {
    fontSize: 18,
    color: '#111',
    alignSelf: 'center'
  },
  button: {
    height: 45,
    flexDirection: 'row',
    backgroundColor: 'white',
    borderColor: 'white',
    borderWidth: 1,
    borderRadius: 8,
    marginBottom: 10,
    marginTop: 10,
    alignSelf: 'stretch',
    justifyContent: 'center'
  },
});

module.exports = Main;
