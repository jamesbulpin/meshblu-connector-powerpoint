http = require 'http'
debug = require('debug')('meshblu-connector-powerpoint:job')

class GotoSlide
  constructor: ({@connector}) ->
    throw new Error 'GotoSlide requires connector' unless @connector?

  do: ({data}, callback) =>
    return callback @_userError(422, 'data.slide is required') unless data?.slide?

    debug 'goto slide', data.slide
    slideshow = @connector.getPpt()
    switch data.slide
      when 'next'
        slideshow.next()
      when 'prev'
        slideshow.prev()
      when 'first'
        slideshow.first()
      when 'last'
        slideshow.last()
      else
        slideshow.goto(parseInt(data.slide))
    
    metadata =
      code: 200
      status: http.STATUS_CODES[200]

    callback null, {metadata, data}

  _userError: (code, message) =>
    error = new Error message
    error.code = code
    return error

module.exports = GotoSlide
