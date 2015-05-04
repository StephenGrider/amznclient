jest.autoMockOff()
Deferred = require('deferred')
jest.autoMockOn()

jest.dontMock('underscore')

describe 'ItemStore', ->
  fetchMock = setMock = uuidMock = deferred = store = null

  beforeEach ->
    # UUID
    jest.setMock 'uuid',
      uuidMock = jest.genMockFunction().mockReturnValue('a new uuid')

    # AsyncStorage
    deferred = Deferred()
    jest.setMock 'react-native',
      AsyncStorage:
        getItem: -> deferred.promise()
        setItem: setMock = jest.genMockFunction()

    # Constants
    jest.setMock './../coffee/constants',
      API_ROOT_URL: 'api_url'
      UUID_STORAGE_KEY: 'storage key'

    StoreClass = require.requireActual './../coffee/stores/store.cjsx'
    store = new StoreClass

  describe '#constructor', ->
    describe 'assigning uuid', ->
      describe 'uuid exists', ->
        beforeEach ->
          deferred.resolve('api key')

        it 'saves a reference to the key', ->
          expect(store.apiKey).toEqual('api key')

      describe 'uuid does not exist', ->
        beforeEach ->
          deferred.resolve(null)

        it 'creates a new key', ->
          expect(uuidMock).toBeCalled()

        it 'saves a reference to the uuid', ->
          expect(store.apiKey).toEqual('a new uuid')

        it 'sets the uuid ', ->
          expect(setMock).toBeCalledWith('storage key', 'a new uuid')

  describe '#doReqest', ->
    fetchMock = null

    beforeEach ->
      fetchMock = require('fetch')

      StoreClass = require.requireActual './../coffee/stores/store.cjsx'
      store = new StoreClass

      deferred.resolve('apiKey')

      store.doRequest('/items')

    it 'calls fetch', ->
      expect(fetchMock).toBeCalled()

    it 'prepends the api root url', ->
      expect(fetchMock.mock.calls[0][0]).toBe('api_url/items')

    it 'adds on the api key as a header', ->
      expect(fetchMock.mock.calls[0][1].headers.GUID_TOKEN).toBe('apiKey')
