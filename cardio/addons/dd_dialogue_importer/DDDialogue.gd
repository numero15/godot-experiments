extends Resource

class_name DDDialogue

var characters
var nodes
var start_node
var connections

func init(d):
	characters = d.characters
	nodes = d.nodes
	connections = d.connections
	
	for n in nodes:
		if n.node_type == "start":
			start_node = n
			break

func get_first_node():
	var first_node_name = start_node.next
	return find_node_with_name(first_node_name)

func find_node_with_name(name):
	for node in nodes:
		if node.node_name == name:
			return node
	
	return null

func set_lines(value):
	return

func get_lines():
	return null

func _to_string() -> String:
	return "dd dialogue"
