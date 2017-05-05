http = require 'http'
debug = require('debug')('meshblu-connector-powerpoint:job')

class ClosePresentation
  constructor: ({@connector}) ->
    throw new Error 'ClosePresentation requires connector' unless @connector?

  do: ({data}, callback) =>

    debug 'close presentation'
    slideshow = @connector.getPpt()
    slideshow.close()
    
    metadata =
      code: 200
      status: http.STATUS_CODES[200]

    callback null, {metadata, data}

  _userError: (code, message) =>
    error = new Error message
    error.code = code
    return error

module.exports = ClosePresentation
