extends Area2D
onready var label = get_node("UI")
onready var button = get_node("UI/Button")
signal open_dialogue(dialogue_data)

func _on_NPC_body_entered(body):
	label.visible=true

func _on_NPC_body_exited(body):
	label.visible=false

func _ready():
	var top_control = get_tree().get_root().get_node("Screen")
	if top_control != null :
		connect("open_dialogue",top_control,"open_dialogue")

func _on_button_up():
	emit_signal("open_dialogue","NPC name")
	OpponentData.add_child(get_node("Data/Stats").duplicate())
	OpponentData.add_child(get_node("Data/Replies").duplicate())
	
func deactivate():
	button.disabled=true
	
func activate():
	button.disabled=false
