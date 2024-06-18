class_name SequenceNode
extends BehaviourNode

@export var nodes: Array[BehaviourNode] = []

var current_node: int = 0


func _reset_state() -> void:
	current_node = 0


func evaluate(context: Dictionary) -> BehaviourNode.Status:
	if len(nodes) == 0:
		_reset_state()
		return BehaviourNode.Status.SUCCESS

	var bt_node: BehaviourNode = nodes[current_node]
	var result: BehaviourNode.Status = bt_node.evaluate(context)
	if result == BehaviourNode.Status.ERROR:
		_reset_state()
		return BehaviourNode.Status.ERROR

	if result == BehaviourNode.Status.SUCCESS:
		if current_node == len(nodes) - 1:
			_reset_state()
			return BehaviourNode.Status.SUCCESS

		current_node += 1

	return BehaviourNode.Status.RUNNING
