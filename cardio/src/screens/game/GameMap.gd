extends Node2D

onready var area = get_node("Area2D")
onready var player = get_node("Player")

func _input(event):
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
#	https://stackoverflow.com/questions/68533928/my-get-viewport-get-mouse-position-isnt-working-right-godot-gdscript
#	if event is InputEventMouseButton :
#		if event.pressed :
#
#			var container = find_parent("ViewportContainer") as ViewportContainer
#			var offset = Vector2.ZERO
#			if container != null:
#				print(event.position)
#				event = container.make_input_local(event)
#				offset=container.rect_global_position
#				print(event.position)
#
#			event = make_input_local(event)
#			print(event.position)
#			player.position =event.position
#			player.position = area.get_global_mouse_position()-offset
	pass
