extends State

var dialogue : Control

func _ready():
	yield(owner, "ready")
	dialogue = owner as Control
	assert(dialogue != null)
	
func enter(_msg := {}) -> void:
	dialogue.opponent.opponent = dialogue.player
	dialogue.player.opponent = dialogue.opponent
	dialogue.player.direction_modifier = 1
	dialogue.opponent.direction_modifier = 1

func _on_ButtonRewind_button_down():
	if state_machine.state != self :
		return
	dialogue.player.direction_modifier = -3
	dialogue.opponent.direction_modifier = -3

func _on_ButtonRewind_button_up():
	if state_machine.state != self :
		return
	if dialogue.is_paused :
		dialogue.player.direction_modifier = 0
		dialogue.opponent.direction_modifier = 0
	else :
		dialogue.player.direction_modifier = 1
		dialogue.opponent.direction_modifier = 1

func _on_ButtonPause_toggled(button_pressed):
	if state_machine.state != self :
		return
	if button_pressed :
		dialogue.is_paused = true
		dialogue.player.direction_modifier = 0
		dialogue.opponent.direction_modifier = 0
	else :
		dialogue.is_paused = false
		dialogue.player.direction_modifier = 1
		dialogue.opponent.direction_modifier = 1

func _on_pause_timeline():
	if state_machine.state != self :
		return
	dialogue.player.direction_modifier = 0
	dialogue.opponent.direction_modifier = 0

func _on_play_timeline():
	if state_machine.state != self :
		return
	if dialogue.is_paused :
		dialogue.player.direction_modifier = 0
		dialogue.opponent.direction_modifier = 0
	else :
		dialogue.player.direction_modifier = 1
		dialogue.opponent.direction_modifier = 1
