# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process
moment = require 'moment-timezone'

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONGPONGPONG"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    places = [ 'jp', 'taiwan', 'hawaii', 'thailand'] #, 'binan' 
    place = places[Math.floor(Math.random() * places.length)]
    hhmm = moment.tz('Asia/Tokyo').format 'HHmm'
    img = "http://www.bijint.com/" + place + "/tokei_images/" + hhmm + ".jpg"
    msg.send img
    msg.finish()

  robot.respond /DIE$/i, (msg) ->
    msg.send "Goodbye, cruel world."
    process.exit 0

