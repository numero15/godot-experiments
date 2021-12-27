extends Control
onready var viewportContainer = get_node("Control")

func _ready():
	viewportContainer.rect_size = rect_size*3
