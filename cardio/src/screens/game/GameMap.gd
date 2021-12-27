extends Node2D

onready var player = get_node("Player")

func _input(event):
	pass
	
func move_player(pos,size):
	player.set_target(pos,size)
