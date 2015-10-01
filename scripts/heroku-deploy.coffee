# herokuのdeploy完了を自分で通知するScript
# herokuのhookを使う
module.exports = (robot) ->
	crypto = require("crypto")

	robot.router.post "/deploy-notify/:room", (req, res) ->
		robot.messageRoom room, "[deploy] done - #{req.body.app}(#{req.body.release})"
		console.log "receive heroku deploy notify."
		res.send "ok"
