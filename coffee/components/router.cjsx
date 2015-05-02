React = require('react-native')
List = require('./list/list')
{ TouchableHighlight, StyleSheet, TabBarIOS, Text, View, NavigatorIOS } = React

module.exports = React.createClass
  getInitialState: ->
    setTimeout =>
      @count++
    , 1000

    selectedTab: 'redTab'
    notifCount: 0
    presses: 0
    count: 0

  showBlueTab: ->
    @setState
      selectedTab: 'blueTab'

  showHistory: ->
    @setState
      selectedTab: 'redTab'
      notifCount: @state.notifCount + 1

  showGreenTab: ->
    @setState
      selectedTab: 'greenTab'
      presses: @state.presses + 1

  _renderContent: (color, pageText) ->
    <NavigatorIOS
      style={styles.container}
      initialRoute= {{
        title: 'Github NoteTaker'
        component: List
      }}>
    </NavigatorIOS>

  render: ->
    <TabBarIOS>
      <TabBarIOS.Item
        title="Blue Tab"
        selected={@state.selectedTab == 'blueTab'}
        onPress={@showBlueTab}>
        {@_renderContent('#414A8C', 'Blue Tab')}
      </TabBarIOS.Item>

      <TabBarIOS.Item
        systemIcon="history"
        badge={ @state.notifCount if @state.notifCount > 0 }
        selected={@state.selectedTab == 'redTab'}
        onPress={@showHistory}>
        {@_renderContent('#783E33', 'Red Tab')}
      </TabBarIOS.Item>

      <TabBarIOS.Item
        systemIcon="more"
        selected={ @state.selectedTab == 'greenTab' }
        onPress={ @showGreenTab }>
        {@_renderContent('#21551C', 'Green Tab')}
      </TabBarIOS.Item>
    </TabBarIOS>

styles = StyleSheet.create
  tabContent:
    flex: 1
    alignItems: 'center'
  tabText:
    color: 'white'
    margin: 50
  container:
    flex: 1
