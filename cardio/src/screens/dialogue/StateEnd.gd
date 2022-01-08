extends State

var dialogue

func _ready():
	yield(owner, "ready")
	dialogue = owner as Control
	assert(dialogue != null)
