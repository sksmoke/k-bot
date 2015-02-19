module.exports = (robot) ->
  KEY_SCORE = 'key_score'

  getScores = () ->
    return robot.brain.get(KEY_SCORE) or {}

  changeScore = (name, diff) ->
    source = getScores()
    score = source[name] or 0
    new_score = score + diff
    source[name] = new_score

    robot.brain.set KEY_SCORE, source
    return new_score

  robot.respond /list/i, (msg) ->
    source = getScores()
    console.log source
    for name, score of source
      msg.send "#{name}: #{score}"

  robot.hear /^(.+)\+\+$/i, (msg) ->
    name = msg.match[1]
    new_score = changeScore(name, 1)
    msg.send "#{name}: #{new_score}"

  robot.hear /^(.+)--$/i, (msg) ->
    name = msg.match[1]
    new_score = changeScore(name, -1)
    msg.send "#{name}: #{new_score}"

