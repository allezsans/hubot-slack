module.exports = (robot) ->
  crypto = require("crypto")
  room_no = "development"
  setTimeout () ->
    robot.messageRoom room_no, "パワーアップして戻ってきました！"
  , 1 * 1000

  robot.router.post "/hubot/hooks", (req, res) ->
    data = req.body
    signature = req.header("X-Hub-Signature")

    pairs = signature.split("=")
    digest_method = pairs[0]
    hmac = crypto.createHmac(digest_method, process.env.GITHUB_HOOK_SECRET)
    hmac.update(JSON.stringify(data))
    hashed_data = hmac.digest("secret")
    generated_signature = [digest_method, hashed_data].join("=")

    return res.send("ng") if signature isnt generated_signature

    ref = data.ref
    if ref is "refs/heads/master"
      message = "[deploy] #{data.sender.login}: deploying #{ref} - #{data.compare}"
      robot.messageRoom room_no, message

    res.send "ok"
