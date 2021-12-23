extends Control

var replyCard = preload("res://src/screens/dialogue/ReplyCard.tscn")

func _ready():
	for replyData in PlayerReplies.get_children():
		var new_reply= replyCard.instance()
		new_reply.setup(replyData)
		add_child(new_reply)


