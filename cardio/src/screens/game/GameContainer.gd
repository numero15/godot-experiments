extends Control

#https://www.youtube.com/watch?v=naJ6hz6onTc

var drag_position = null
var mousse_offset = null
var window_size

func _on_DragHandle_gui_input(event):
	if event is InputEventMouseButton :
		if event.pressed :
			#start dragging
			drag_position = get_global_mouse_position() - rect_global_position
		else :
			#end dragging
			drag_position = null
	if event is InputEventMouseMotion and drag_position :
		rect_global_position = get_global_mouse_position() - drag_position

func _on_ResizeHandle_gui_input(event):
	if event is InputEventMouseButton :
		if event.pressed :
			#start dragging
			mousse_offset = get_local_mouse_position()
		else :
			#end dragging
			mousse_offset = null
			
	if event is InputEventMouseMotion and mousse_offset :
		rect_size.y = get_global_mouse_position().y - rect_global_position.y
		rect_size.x = get_global_mouse_position().x - rect_global_position.x
		

