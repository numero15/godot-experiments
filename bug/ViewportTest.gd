extends ViewportContainer
onready var player = get_node("Viewport/Node2D/Player")

	

func _on_Control_gui_input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		player.set_target(get_parent().rect_position, get_parent().rect_size)

	
