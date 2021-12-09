extends Control

onready var scene_tree = get_tree()
onready var pauseScreen : Control = get_node("PauseScreen")

var paused: = false setget set_paused

func set_paused(value:bool)->void :
	paused = value
	scene_tree.paused = paused
	pauseScreen.visible = paused


func _on_PauseButton_button_up():
	# self ensure that we use the setter function 
	# if not used, it will directly update variable
	# because we update the variable form the same node
	self.paused = not paused


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.paused = not paused
	scene_tree.set_input_as_handled()
