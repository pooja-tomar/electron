assert = require 'assert'
child_process = require 'child_process'
path = require 'path'

describe 'child_process', ->
  fixtures = path.join __dirname, '..', 'fixtures'

  describe 'child_process.fork', ->
    it 'should work', (done) ->
      child = child_process.fork path.join(fixtures, 'module', 'ping.js')
      child.on 'message', (msg) ->
        assert.equal msg, 'message'
        done()
      child.send 'message'
