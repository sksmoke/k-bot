# Description:
#   Utility commands.
#
# Commands:
#   hubot unixtime <text>- Reply UnixTimeStamp to YYYY年MM月DD日HH時mm分ss秒
#   hubot urlencode <text>- Reply URL Encoded String
#   hubot urldecode <text>- Reply URL Decoded String
#   hubot 16encode <text>- Reply native to ascii
#   hubot 16decode <text>- Reply ascii to native
moment = require 'moment-timezone'
querystring = require 'querystring'

module.exports = (robot) ->
  robot.respond /UNIXTIME (.*)$/i, (msg) ->
    time = msg.match[1]
    if time.length is 10
      msg.send moment.tz(Number(time + '000'), 'Asia/Tokyo').format('YYYY年MM月DD日HH時mm分ss秒')
    else
      msg.send "10桁で入力してください。"

  robot.respond /urlencode (.*)$/i, (msg) ->
    src = msg.match[1]
    msg.send querystring.escape src

  robot.respond /urldecode (.*)$/i, (msg) ->
    src = msg.match[1]
    msg.send querystring.unescape src

  robot.respond /16encode (.*)$/i, (msg) ->
    src = msg.match[1]
    utf16charArray = src.split('').map (arg) ->
      '\\u' + arg.charCodeAt(0).toString(16)
    msg.send utf16charArray.reduce (sum, elements) ->
      sum + elements

  robot.respond /16decode (.*)$/i, (msg) ->
    src = msg.match[1]
    console.log src
    utf16charArray = src.split('\\u')
    utf16charArray.shift()
    stringArray = utf16charArray.map (arg) ->
      String.fromCharCode(parseInt(arg, 16))
    msg.send stringArray.join('')

