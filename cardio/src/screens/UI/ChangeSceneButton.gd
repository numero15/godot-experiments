extends Button
export(String, FILE) var scene_to_load

func _on_button_up():
	get_tree().change_scene(scene_to_load)


