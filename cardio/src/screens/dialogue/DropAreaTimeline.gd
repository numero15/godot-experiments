extends "res://src/screens/dialogue/DropArea.gd"

func _on_Area2D_area_entered(area):
	if area.collision_layer== 8:
		set_deferred("monitorable",false)

func _on_Area2D_area_exited(area):
	if area.collision_layer== 8:
		set_deferred("monitorable",true)
