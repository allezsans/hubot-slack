# Description:
# ignore not permitted messages.

permitted_rooms = process.env.HUBOT_PERMITTED_ROOMS?.split(',') || []
permitted_users = process.env.HUBOT_PERMITTED_USERS?.split(',') || []

permitted = (room) ->
	room in permitted_rooms || room in permitted_users

module.exports = (robot) ->

	receive_org = robot.receive
	robot.receive = (msg)->
	user = msg.user?.name?.trim().toLowerCase()
	room = msg.room?.trim().toLowerCase()

	if permitted room          # allow permitted room or user (direct message)
		receive_org.bind(robot)(msg)
	else
		console.log "ignored messge, from #{user} at #{room}"
