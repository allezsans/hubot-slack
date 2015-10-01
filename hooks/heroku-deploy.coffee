module.exports = (robot) ->
	crypto = require("crypto")

	robot.router.post "/hubot/deploy-done", (req, res) ->
		robot.messageRoom "development", "[deploy] done - #{req.body.app}(#{req.body.release})"
		res.send "ok"