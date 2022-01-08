extends Control

var currentDropZone : Area2D = null
var data = null setget set_data
signal reply_dropped(reply_data)
signal reply_hover(reply_data)
signal reply_enter(reply_data)
signal reply_exit(reply_data)
onready var label_name = get_node("PanelContainer/LabelName")

func _process(delta):
	if Input.is_action_pressed("mousePressed"):
		set_position(get_global_mouse_position() - .5 * rect_size)
		
	if Input.is_action_just_released("mousePressed") :
		drop()
		queue_free()
		
	if currentDropZone != null :
		emit_signal('reply_hover',data)
		
func drop ():
	if currentDropZone ==null:
		return
	emit_signal('reply_dropped',data)
	queue_free()

func _on_area_entered(area):
	currentDropZone = area
	if not is_connected("reply_dropped", currentDropZone, "_on_drop_data"):
		connect("reply_dropped", area, "_on_drop_data")
	if not is_connected("reply_hover", currentDropZone, "_on_hover_data"):
		connect("reply_hover", area, "_on_hover_data")
	if not is_connected("reply_enter", currentDropZone, "_on_enter_data"):
		connect("reply_enter", area, "_on_enter_data")
	if not is_connected("reply_exit", currentDropZone, "_on_exit_data"):
		connect("reply_exit", area, "_on_exit_data")
	emit_signal('reply_enter',data)

func _on_area_exited(area):
	emit_signal('reply_exit',data)
	if currentDropZone == null:
		return
	if is_connected("reply_dropped", currentDropZone, "_on_drop_data"):
		disconnect("reply_dropped", currentDropZone, "_on_drop_data")
	if is_connected("reply_hover", currentDropZone, "_on_hover_data"):	
		disconnect("reply_hover", currentDropZone, "_on_hover_data")
	if is_connected("reply_enter", currentDropZone, "_on_enter_data"):
		disconnect("reply_enter", currentDropZone, "_on_enter_data")
	if is_connected("reply_exit", currentDropZone, "_on_exit_data"):
		disconnect("reply_exit", currentDropZone, "_on_exit_data")
		currentDropZone = null


func set_data(d):
	data = d
	label_name.text = d.reply_name
	
