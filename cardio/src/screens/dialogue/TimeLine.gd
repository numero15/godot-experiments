extends Control

signal pause_timeline()
signal play_timeline()

var reply_timeline = preload ("res://src/screens/dialogue/ReplyTimeline.tscn")

onready var replies_container = get_node("TimelineContainer/Replies")
onready var will_bar = get_node("OpponentInfos/HBoxContainer/WillBar")
onready var graduations_container = get_node("TimelineContainer/DropZones")
onready var lock_picto = get_node("TimelineContainer/TextureLock")

enum speaker {PLAYER, OPPONENT}
export(speaker) var type
export (int) var speed
export (bool) var is_locked
export (int) var cell_size
var  will=10 setget set_will
var direction
var direction_modifier = 1

func set_will(_i):
	will=_i
	will_bar.value=will

func _ready():
	direction = 1 if type==speaker.PLAYER else -1
	will_bar.fill_mode=0 if type==speaker.PLAYER else 1
	will_bar.max_value = will
	self.set_will(will)
	graduations_container.setup(type,cell_size,self)
	if not is_locked :
		lock_picto.visible = false
	
func _process(delta):
	move_replies(delta * speed*direction*direction_modifier)
	graduations_container.move(delta * speed*direction*direction_modifier)

func _on_reply_dropped(reply_data, area):
	if is_locked:
		return
	if reply_data is ReplyData:
		var new_reply = reply_timeline.instance()
		replies_container.add_child(new_reply)
		new_reply.cell_size = cell_size
		new_reply.data = reply_data
		new_reply.direction = direction
		new_reply.rect_position.x = area.get_parent().rect_position.x + graduations_container.rect_position.x + 6
		if type==speaker.PLAYER :
			new_reply.rect_position.x -= new_reply.rect_size.x + 5
		new_reply.mirrored = false if type==speaker.PLAYER else true
	
func move_replies(_dist):
	for reply in replies_container.get_children():
		if reply.has_method("move"):
			reply.move(_dist)

func _on_trigger_area_entered(_area):
	if not ("data" in _area.get_parent() ) or not (is_a_parent_of(_area)):
		return
	if not _area.get_parent().has_hit and direction_modifier>0 :
		_area.get_parent().has_hit = true
		apply_effects(_area.get_parent().data)

func _on_trigger_area_exited(_area):
	if not ("data" in _area.get_parent() ) or not (is_a_parent_of(_area)):
		return
	if _area.get_parent().has_hit and direction_modifier<0:
		_area.get_parent().has_hit = false
		remove_effects(_area.get_parent().data)

func apply_effects(_data):
	self.set_will(will-1)
	
func remove_effects(_data):
	self.set_will(will+1)

func _on_reply_enter(reply_data, area):
	if is_locked:
		return
	emit_signal("pause_timeline")
	
func _on_reply_exit(reply_data, area):
	if is_locked:
		return
	emit_signal("play_timeline")

func pause(_b):
	if _b :
		direction_modifier = 0
	else :
		direction_modifier = 1
	
func rewind() :
	direction_modifier = -3

func play():
	direction_modifier = 1

