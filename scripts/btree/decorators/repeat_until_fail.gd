class_name RepeatUntilFail
extends BehaviourNode

@export var child_node: BehaviourNode


func evaluate(context: Dictionary) -> BehaviourNode.Status:
	var status: BehaviourNode.Status = child_node.evaluate(context)
	if status == BehaviourNode.Status.ERROR:
		return BehaviourNode.Status.ERROR

	return BehaviourNode.Status.RUNNING
