extends Area2D
onready var label = get_node("UI")

func _on_NPC_body_entered(body):
	label.visible=true

func _on_NPC_body_exited(body):
	label.visible=false
