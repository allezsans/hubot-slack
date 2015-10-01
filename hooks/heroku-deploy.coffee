# herokuのdeploy完了を自分で通知するScript
# herokuのhookを使う
module.exports = (robot) ->
	crypto = require("crypto")

	robot.router.post "/hubot/hooks", (req, res) ->
		robot.messageRoom "development", "[deploy] done - #{req.body.app}(#{req.body.release})"
		res.send "ok"
