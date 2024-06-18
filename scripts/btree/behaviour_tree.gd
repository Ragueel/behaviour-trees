class_name BehaviourTree
extends Node

@export var root: RepeaterNode

var _context: Dictionary = {}


func _process(delta: float) -> void:
	root.evaluate(_context)