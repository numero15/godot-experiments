extends Node2D

signal health_updated

var health : = 0 setget set_health

func set_health(value:int)->void:
	health = value
	emit_signal("health_updated",value)
