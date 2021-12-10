extends KinematicBody2D

export (bool) var mouse_control = true
export (int) var movement_speed = 175
var target = Vector2()
var velocity = Vector2()
onready  var camera:Camera2D = get_node("Sprite/Camera2D")

#func _physics_process(delta):
#	if target.distance_to(position) < 5:
#		target = position
#		velocity = Vector2.ZERO
#
#	var collision_info = move_and_collide(velocity * delta)

func _input(event):
	if mouse_control and Input.is_mouse_button_pressed(BUTTON_LEFT):
		target = get_global_mouse_position()#event.position#get_global_mouse_position()#get_viewport().get_mouse_position()#event.get_position()
		position=event.position
		#prevent back and forth movement near target
		if target.distance_to(position) < 5:
			target = position
#		velocity = (target - position).normalized() * movement_speed
