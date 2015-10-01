# herokuのdeploy完了を自分で通知するScript
# herokuのhookを使う
module.exports = (robot) ->
	crypto = require("crypto")

	robot.router.post "/hooks/heroku-deploy", (req, res) ->
		robot.messageRoom "development", "[deploy] done - #{req.body.app}(#{req.body.release})"
		console.log "receive heroku deploy notify."
		res.send "ok"
