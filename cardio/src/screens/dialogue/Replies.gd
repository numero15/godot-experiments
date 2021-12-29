extends Control

var replyCard = preload("res://src/screens/dialogue/ReplyCard.tscn")

func _ready():
	for replyData in PlayerData.get_node("Replies").get_children():
		var new_reply= replyCard.instance()
		new_reply.setup(replyData)
		add_child(new_reply)


