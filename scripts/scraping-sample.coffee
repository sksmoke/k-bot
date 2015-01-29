# Description:
#   スクレイピングのサンプル
#
# Commands:
#   hubot yahoo topics

client = require 'cheerio-httpcli'

YAHOO_URL = 'http://www.yahoo.co.jp/'

module.exports = (robot) ->
  robot.respond /yahoo topics$/, (msg) ->
    client.fetch YAHOO_URL, (err, $, res) ->
      resmsg = ''
      $('.topicsindex ul.emphasis li a').each () ->
        resmsg += '\n' if resmsg.length > 0
        resmsg += $(this).text()
      msg.send resmsg

