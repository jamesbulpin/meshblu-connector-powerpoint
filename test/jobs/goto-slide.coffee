{job} = require '../../jobs/goto-slide'
debug = require('debug')('meshblu-connector-powerpoint:test')

class MockSlideshow
  goto: (sn) =>
    debug 'mock goto', sn
  next: =>
    debug 'mock next'
  prev: =>
    debug 'mock prev'
  first: =>
    debug 'mock first'
  last: =>
    debug 'mock last'

class MockConnector
  getPpt: =>
    return new MockSlideshow

describe 'GotoSlide', ->
  context 'when given a valid message', ->
    beforeEach (done) ->
      @connector = new MockConnector
      message =
        data:
          slide: '1'
      @sut = new job {@connector}
      @sut.do message, (@error) =>
        done()

    it 'should not error', ->
      expect(@error).not.to.exist

  context 'when given an invalid message', ->
    beforeEach (done) ->
      @connector = new MockConnector
      message = {}
      @sut = new job {@connector}
      @sut.do message, (@error) =>
        done()

    it 'should error', ->
      expect(@error).to.exist
