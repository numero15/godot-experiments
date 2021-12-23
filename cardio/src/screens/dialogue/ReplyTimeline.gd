extends Control

var reply_draggable = preload("res://src/screens/dialogue/ReplyDraggable.tscn")
var  duration setget setDuration
var  mirrored setget setMirrored
var cell_size = 32
var data = null setget setData
var has_hit = false
var direction
onready var effect_area = get_node("AreaEffect")
onready var collision_shape = get_node("AreaCollision/CollisionShape2D")
onready var collision_area = get_node("AreaCollision")

func setDuration(_d):
	duration = _d
	rect_size.x = duration * cell_size-5
	collision_shape.shape.extents.x = rect_size.x/2-4
	collision_area.position.x =rect_size.x/2

func setData(_d):
	data = _d
	setDuration( data.duration)
	
func setMirrored(_b):
	mirrored = _b
	effect_area.position.x = rect_size.x -8 if mirrored else 8
	
func move(_dist):
	rect_position.x += _dist
	
func _on_drag_gui_input(event):
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
			drag_data.data =data
			top_control.add_child(drag_data)
			queue_free()

func _on_AreaCollision_area_entered(area):
	var _reply = area.get_parent()
	if area.collision_layer == 8:
		if _reply.rect_position.x >= rect_position.x and direction == 1 :
			rect_position.x = _reply.rect_position.x - rect_size.x - 5
		if _reply.rect_position.x <= rect_position.x and direction == -1 :
			rect_position.x = _reply.rect_position.x + _reply.rect_size.x + 5
			
