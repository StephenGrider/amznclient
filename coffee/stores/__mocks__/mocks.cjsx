jest.setMock 'uuid',
  uuidMock = jest.genMockFunction().mockReturnValue('a new uuid')
