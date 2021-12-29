extends Node2D

onready var player = get_node("Player")

var is_active=true setget is_active_set

func move_player(pos,size):
	if is_active :
		player.set_target(pos,size)

	
func is_active_set (_b):
	is_active = _b
	if is_active :
		get_tree().call_group("group_NPC", "activate")
		player.is_active = true
	else :
		get_tree().call_group("group_NPC", "deactivate")
		player.is_active = false
