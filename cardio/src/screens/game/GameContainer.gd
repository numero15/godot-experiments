extends "res://src/screens/UI/Panel.gd"

onready var viewportContainer = get_node("ViewportContainer")

func _ready():
	viewportContainer.rect_size = rect_size*3

func _on_ResizeHandle_gui_input(event):
	._on_ResizeHandle_gui_input(event)
	viewportContainer.rect_size = rect_size*3

