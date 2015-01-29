# Description:
#   定時実行のサンプル

cron = require('cron').CronJob
moment = require 'moment-timezone'

module.exports = (robot) ->
  new cron '0 * * * * 1-5', () ->
    rnd = Math.floor(Math.random() * 720) + 1
    if rnd < 3
      places = [ 'jp', 'taiwan', 'hawaii', 'thailand'] #, 'binan' 
      place = places[Math.floor(Math.random() * places.length)]
      hhmm = moment.tz('Asia/Tokyo').format 'HHmm'
      img = "http://www.bijint.com/" + place + "/tokei_images/" + hhmm + ".jpg"
      robot.send {room: '#bot_test'}, img
  ,null, true, 'Asia/Tokyo'

