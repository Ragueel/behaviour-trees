class_name BehaviourNode
extends Node

enum Status {
	RUNNING,
	SUCCESS,
	ERROR,
}


func evaluate(context: Dictionary) -> Status:
	push_error("Not implemented evaluate in BT, %s" % [name])
	return Status.ERROR