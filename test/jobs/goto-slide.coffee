{job} = require '../../jobs/goto-slide'

describe 'GotoSlide', ->
  context 'when given a valid message', ->
    beforeEach (done) ->
      @connector = {}
      message =
        data:
          slidenumber: '1'
      @sut = new job {@connector}
      @sut.do message, (@error) =>
        done()

    it 'should not error', ->
      expect(@error).not.to.exist

  context 'when given an invalid message', ->
    beforeEach (done) ->
      @connector = {}
      message = {}
      @sut = new job {@connector}
      @sut.do message, (@error) =>
        done()

    it 'should error', ->
      expect(@error).to.exist
