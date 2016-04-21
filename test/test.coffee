helloWorld = require('../index.coffee')
request = require('supertest');

describe 'Hello world app', ->
  it 'Returns right thing', ->
    request(helloWorld.app)
    .get('/')
    .query('query=test')
    .expect(200)
    .expect (res) ->
      res.body == 'Hello World! query from url: test'