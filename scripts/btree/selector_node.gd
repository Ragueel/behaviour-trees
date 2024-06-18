class_name SelectorNode
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
	# if got an error, move to the next node in the array
	# if all nodes returned an error then return error
	if result == BehaviourNode.Status.ERROR:
		if current_node == len(nodes) - 1:
			_reset_state()
			return BehaviourNode.Status.ERROR

		current_node += 1

	if result == BehaviourNode.Status.SUCCESS:
		_reset_state()
		return BehaviourNode.Status.SUCCESS

	return BehaviourNode.Status.RUNNING
