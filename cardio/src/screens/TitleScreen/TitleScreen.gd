extends "res://src/screens/Screen.gd"

export (ButtonGroup) var palette_group

func _ready():
	palette_group.connect('pressed',self,'_on_palette_pressed')
	
func _on_palette_pressed(data):
	OptionsData.shaderGradient = load("res://src/Autoload/Colors_"+ str(data.get_position_in_parent()+1)+".tres")
	var gradientTexture = GradientTexture.new()
	gradientTexture.set_gradient(OptionsData.shaderGradient)
	shaderContainer.material.set_shader_param("gradient",gradientTexture)

func _on_Fullscreen_toggled(button_pressed):
	 OS.window_fullscreen = button_pressed
