extends NinePatchRect

var reply_data
var reply_draggable = preload("res://src/screens/dialogue/ReplyDraggable.tscn")
	
func setup(data):
	reply_data = data.duplicate()
	get_node("VBoxContainer/Name").text = reply_data.reply_name

func _on_gui_input(event):
	if event is InputEventMouseButton :
		if event.button_index!=1:
			return
		if event.pressed :
			#start dragging
			var top_control:Node = self
			while top_control is Control:
				if top_control.get_parent().name =="root" :
					break
				top_control = top_control.get_parent()
				
			var drag_data = reply_draggable.instance()
			top_control.add_child(drag_data)
			drag_data.data =reply_data

