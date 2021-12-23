extends Area2D

signal reply_dropped(reply_data, area)
signal reply_hover(reply_data, area)
signal reply_enter(reply_data, area)
signal reply_exit(reply_data, area)
onready var collisionShape = get_node("CollisionShape2D")

#func _ready():
#	if get_parent() is Control :
#		collisionShape.shape.extents=get_parent().rect_size/2
#		position.y = get_parent().rect_size.y/2
#		position.x =get_parent().rect_size.x/2

func _on_drop_data(data):
	emit_signal('reply_dropped',data, self)

func _on_hover_data(data):
	emit_signal('reply_hover',data, self)
	
func _on_enter_data(data):
	emit_signal('reply_enter',data, self)

func _on_exit_data(data):
	emit_signal('reply_exit',data, self)

