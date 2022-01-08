extends State

var dialogue

func _ready():
	yield(owner, "ready")
	dialogue = owner as Control
	assert(dialogue != null)
	
func enter(_msg := {}) -> void:
	dialogue.opponent.opponent = dialogue.player
	dialogue.player.opponent = dialogue.opponent
	dialogue.player.direction_modifier = 0
	dialogue.opponent.direction_modifier = 0
