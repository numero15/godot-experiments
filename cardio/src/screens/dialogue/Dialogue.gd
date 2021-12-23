extends VBoxContainer

onready var opponent = get_node("Opponents/TimeLineOpponent")
onready var player = get_node("Opponents/TimeLinePlayer")
onready var pause_timeline = get_node("UI/ButtonPause")
var is_paused = false

func _on_ButtonRewind_button_down():
	player.direction_modifier = -3
	opponent.direction_modifier = -3

func _on_ButtonRewind_button_up():
	if is_paused :
		player.direction_modifier = 0
		opponent.direction_modifier = 0
	else :
		player.direction_modifier = 1
		opponent.direction_modifier = 1

func _on_ButtonPause_toggled(button_pressed):
	if button_pressed :
		is_paused = true
		player.direction_modifier = 0
		opponent.direction_modifier = 0
	else :
		is_paused = false
		player.direction_modifier = 1
		opponent.direction_modifier = 1

func _on_pause_timeline():	
	player.direction_modifier = 0
	opponent.direction_modifier = 0

func _on_play_timeline():
	if is_paused :
		player.direction_modifier = 0
		opponent.direction_modifier = 0
	else :
		player.direction_modifier = 1
		opponent.direction_modifier = 1
