{EventEmitter}  = require 'events'
SlideShow       = require 'slideshow'
debug           = require('debug')('meshblu-connector-powerpoint:index')

class Connector extends EventEmitter
  constructor: ->

  isOnline: (callback) =>
    callback null, running: true

  close: (callback) =>
    debug 'on close'
    callback()

  onConfig: (device={}) =>
    { @options } = device
    debug 'on config', @options

  getPpt: =>
    return @slideshow
    
  start: (device, callback) =>
    debug 'started'
    @onConfig device
    @slideshow = new SlideShow("powerpoint")
    @slideshow.boot()
    callback()

module.exports = Connector
