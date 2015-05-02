React = require('react-native')
{ StyleSheet, TabBarIOS, Text, View } = React

module.exports = React.createClass
  getInitialState: ->
    selectedTab: 'redTab',
    notifCount: 0,
    presses: 0,

  showBlueTab: ->
    @setState
      selectedTab: 'blueTab'

  showHistory: ->
    @setState
      selectedTab: 'redTab'
      notifCount: @state.notifCount + 1,

  showGreenTab: ->
    @setState
      selectedTab: 'greenTab'
      presses: @state.presses + 1

  _renderContent: (color, pageText) ->
    <View style={[styles.tabContent, {backgroundColor: color}]}>
      <Text style={styles.tabText}>{pageText}</Text>
      <Text style={styles.tabText}>{@state.presses} re-renders of the More tab</Text>
    </View>

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
        badge={if @state.notifCount > 0 then @state.notifCount else undefined}
        selected={@state.selectedTab == 'redTab'}
        onPress={@showHistory}>
        {@_renderContent('#783E33', 'Red Tab')}
      </TabBarIOS.Item>

      <TabBarIOS.Item
        systemIcon="more"
        selected={@state.selectedTab == 'greenTab'}
        onPress={@showGreenTab}>
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
