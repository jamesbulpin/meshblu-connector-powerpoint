http = require 'http'
debug = require('debug')('meshblu-connector-powerpoint:job')

class StartSlideshow
  constructor: ({@connector}) ->
    throw new Error 'StartSlideshow requires connector' unless @connector?

  do: ({data}, callback) =>

    debug 'start slideshow'
    slideshow = @connector.getPpt()
    slideshow.start()
    
    metadata =
      code: 200
      status: http.STATUS_CODES[200]

    callback null, {metadata, data}

  _userError: (code, message) =>
    error = new Error message
    error.code = code
    return error

module.exports = StartSlideshow
