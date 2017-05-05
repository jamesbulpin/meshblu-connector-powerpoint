http = require 'http'
debug = require('debug')('meshblu-connector-powerpoint:job')

class OpenPresentation
  constructor: ({@connector}) ->
    throw new Error 'OpenPresentation requires connector' unless @connector?

  do: ({data}, callback) =>
    return callback @_userError(422, 'data.filename is required') unless data?.filename?

    debug 'open presentation', data.filename
    slideshow = @connector.getPpt()
    slideshow.open(data.filename)
    
    metadata =
      code: 200
      status: http.STATUS_CODES[200]

    callback null, {metadata, data}

  _userError: (code, message) =>
    error = new Error message
    error.code = code
    return error

module.exports = OpenPresentation
