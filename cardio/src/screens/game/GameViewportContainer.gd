extends ViewportContainer
onready var gameMap = get_node("Viewport/GameMap")

func _on_gui_input(event):
	if event is InputEventMouseButton :
		if event.pressed :
			gameMap.move_player(get_parent().rect_position, get_parent().rect_size)
