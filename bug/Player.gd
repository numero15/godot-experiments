extends KinematicBody2D

onready var camera = get_node("Camera2D")

export var movement_speed = 175
var velocity = Vector2()
var target = Vector2()

func _physics_process(delta):
	if target.distance_to(position) < 5:
		target = position
		velocity = Vector2.ZERO
	var collision_info = move_and_collide(velocity * delta)

func set_target(pos,size):	
#	var root_size = $"/root".size
#	#calculate black strip
#	var correction = (OS.get_window_size() - root_size)/2.0
#	#we use fixed resolution of 1600 * 900
#	var ratio = Vector2(480.0, 270.0)/root_size
#	target = (get_viewport().get_mouse_position()-correction)*(ratio)
#	target = target - get_viewport().get_parent().rect_position*ratio
#	target = target + camera.get_camera_screen_center()-Vector2(480.0, 270.0)/(2)	
#
#	velocity = (target - position).normalized() * movement_speed

	var root_size = $"/root".size
	#calculate black strip
	var correction = (OS.get_window_size() - root_size)/2.0
	#we use fixed resolution of 1600 * 900
	var ratio = Vector2(480.0, 270.0)/root_size
	target = (get_viewport().get_mouse_position()-correction)*(ratio)
	target = target - pos*(.6666)
	target = target + camera.get_camera_screen_center()-size/(2)	
	
	velocity = (target - position).normalized() * movement_speed



