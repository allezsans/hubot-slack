# herokuのdeploy完了を自分で通知するScript
# herokuのhookを使う
module.exports = (robot) ->
	crypto = require("crypto")

	robot.router.post "/deploy-notify/:room", (req, res) ->
		{ room } = req.params
		robot.messageRoom room, "パワーアップ(#{{req.body.release}})して帰ってきました"
		console.log "#{req.body.git_log}"
		console.log "#{req.body.head}"
		res.send "ok"
