extends Control

onready var shaderContainer = get_node("Compositing/ScreenShader")

func _ready():
	var gradientTexture = GradientTexture.new()
	gradientTexture.set_gradient(OptionsData.shaderGardient)
#	shaderContainer.material.set_shader_param("gradient",gradientTexture)



