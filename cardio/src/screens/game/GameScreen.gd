extends "res://src/screens/Screen.gd"

var paused: = false setget set_paused
#onready var scene_tree = get_tree()
onready var pauseScreen : Control = get_node("PauseScreen")
onready var windows : Control = get_node("Windows")
onready var map = get_node("Windows/GameContainer/ViewportContainer/Viewport/GameMap")

func _ready():
	._ready()
	for window in windows.get_children():
		window.connect('move_to_top', self, 'move_window_to_top')

func set_paused(value:bool)->void :
	paused = value
	get_tree().paused = paused
	pauseScreen.visible = paused

func _on_PauseButton_button_up():
	self.paused = not paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.paused = not paused
#k	scene_tree.set_input_as_handled()
	
func move_window_to_top(node):
	windows.move_child(node,windows.get_child_count()-1)
	
func open_dialogue(NPC_data):
	var dialog = Dialogic.start("intro", '', "res://addons/dialogic/Nodes/DialogNode.tscn",  false, false)
	dialog.connect("timeline_end",self,"_on_dialogic_end")
	dialog.connect("dialogic_signal",self,"_on_dialogic_signal")
	add_child(dialog)
	move_child(dialog, 3)
	map.is_active = false
	
func _on_dialogic_end(data):
	map.is_active = true

func _on_dialogic_signal(data):
	if data == "debate" :
		change_scene("res://src/screens/dialogue/DialogueScreen.tscn")
