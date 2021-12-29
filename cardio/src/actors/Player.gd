extends KinematicBody2D

export (int) var movement_speed = 175
var velocity = Vector2.ZERO
var target = Vector2()
onready var camera = get_node("Camera2D")
var is_active = true

func _physics_process(delta):
	if not is_active :
		return
	
#	var inputVector = Vector2.ZERO
#	inputVector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
#	inputVector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
#	inputVector = inputVector.normalized()
#	velocity = inputVector*movement_speed
#	velocity = move_and_slide(velocity)

	if target.distance_to(position) < 5:
		target = position
		velocity = Vector2.ZERO

	var collision_info = move_and_collide(velocity * delta)


func set_target(pos,size):	
	var root_size = $"/root".size
	#calculate black strip
	var correction = (OS.get_window_size() - root_size)/2.0
	#we use fixed resolution of 1600 * 900
	var ratio = Vector2(480.0, 270.0)/root_size
	target = (get_viewport().get_mouse_position()-correction)*(ratio)
	target = target - pos*(.6666)
	target = target + camera.get_camera_screen_center()-size/(2)	
	
	velocity = (target - position).normalized() * movement_speed


