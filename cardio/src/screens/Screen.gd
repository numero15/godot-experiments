extends Control

onready var shaderContainer = get_node("Compositing/ScreenShader")
onready var transition_rect = get_node("TransitionRect")

func _ready():
	var gradientTexture = GradientTexture.new()
	gradientTexture.set_gradient(OptionsData.shaderGradient)
	shaderContainer.material.set_shader_param("gradient",gradientTexture)
	
func change_scene(scene_path):
	transition_rect.transition_to(scene_path)
