http = require 'http'
debug = require('debug')('meshblu-connector-powerpoint:job')

class StopSlideshow
  constructor: ({@connector}) ->
    throw new Error 'StopSlideshow requires connector' unless @connector?

  do: ({data}, callback) =>

    debug 'stop slideshow'
    slideshow = @connector.getPpt()
    slideshow.stop()
    
    metadata =
      code: 200
      status: http.STATUS_CODES[200]

    callback null, {metadata, data}

  _userError: (code, message) =>
    error = new Error message
    error.code = code
    return error

module.exports = StopSlideshow
