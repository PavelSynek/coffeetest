// Generated by CoffeeScript 1.10.0
(function() {
  var helloWorld, request;

  helloWorld = require('../index');

  request = require('supertest');

  describe('Hello world app', function() {
    return it('Returns right thing', function() {
      return request(helloWorld.app).get('/').query('query=test').expect(200).expect(function(res) {
        return res.body === 'Hello World! query from url: test';
      });
    });
  });

}).call(this);
