extends Control
var cell_size=32

func setup(_opponent,_cell_size,_owner):
	cell_size = _cell_size
	var i = rect_size.x if _opponent == 1 else 0
	var dir = -1 if _opponent == 1 else 1
	for graduation in get_children() :
		graduation.rect_position.x = i-3
		i+=cell_size*dir
		graduation.get_node("Area2D").connect("reply_dropped", _owner, "_on_reply_dropped")
		graduation.get_node("Area2D").connect("reply_enter", _owner, "_on_reply_enter")
		graduation.get_node("Area2D").connect("reply_exit", _owner, "_on_reply_exit")

func move(_dist):
	#update everyone
	for graduation in get_children() :
		graduation.rect_position.x += _dist
	#then replace if needed (prevent positioning error)
	for graduation in get_children() :
		if graduation.rect_position.x < -8 and _dist < 0:
			graduation.rect_position.x = get_rightest_child().rect_position.x + cell_size
		if graduation.rect_position.x > rect_size.x  and _dist > 0 :
			graduation.rect_position.x = get_leftest_child().rect_position.x - cell_size
	
func get_leftest_child()->Control:
	var leftest_child = get_child(0)
	for c in get_children() :
		if c.rect_position.x < leftest_child.rect_position.x :
			leftest_child = c
	return leftest_child
	
func get_rightest_child()->Control:
	var rightest_child =  get_child(0)
	for c in get_children() :
		if c.rect_position.x > rightest_child.rect_position.x :
			rightest_child = c
	return rightest_child
