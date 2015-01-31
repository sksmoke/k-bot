# Description:
#   定時実行のサンプル

cron = require('cron').CronJob
moment = require 'moment-timezone'

module.exports = (robot) ->
  new cron '0 0 */1 * * *', () ->
    hhmm = moment.tz('Asia/Tokyo').format 'HHmm'
    img = "http://www.bijint.com/jp/tokei_images/" + hhmm + ".jpg"
    robot.send {room: "bot_test"}, img
  ,null, true, 'Asia/Tokyo'

