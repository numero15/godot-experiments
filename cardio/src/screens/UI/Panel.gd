extends Control

#https://www.youtube.com/watch?v=naJ6hz6onTc
#https://www.youtube.com/watch?v=L5QjuFe5Gys&t=101s

var drag_position = null
var mousse_offset = null
var window_size
signal move_to_top

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
		emit_signal("move_to_top",self)

func _on_ResizeHandle_gui_input(event):
	if event is InputEventMouseButton :
		if event.pressed :
			#start dragging
			mousse_offset = get_global_mouse_position()
		else :
			#end dragging
			mousse_offset = null
			
	if event is InputEventMouseMotion and mousse_offset :
		rect_size.y = get_global_mouse_position().y - rect_global_position.y
		rect_size.x = get_global_mouse_position().x - rect_global_position.x
		if rect_size.y<rect_min_size.y :
			rect_size.y=rect_min_size.y
		if rect_size.x<rect_min_size.x :
			rect_size.x=rect_min_size.x
	

