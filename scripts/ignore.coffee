# Description:
# ignore not permitted messages.
fs = require 'fs'
rooms_list = fs.readFileSync 'setting/permitted-rooms-list', 'utf8'
users_list = fs.readFileSync 'setting/permitted-users-list', 'utf8'

permitted_rooms = rooms_list?.split(/\r\n|\r|\n/) || []
permitted_users = users_list?.split(/\r\n|\r|\n/) || []
console.log "roomslist is #{permitted_rooms}"

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
