extends KinematicBody2D

export (int) var movement_speed = 175
var velocity = Vector2.ZERO

func _physics_process(delta):
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	inputVector = inputVector.normalized()
	velocity = inputVector*movement_speed
	velocity = move_and_slide(velocity)
