extends Button
export (String) var text_toggle
var text_untoggle

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text_untoggle = text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_toggled(button_pressed):
	if button_pressed :
		text=text_toggle
	else :
		text = text_untoggle
