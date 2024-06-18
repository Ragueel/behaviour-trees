class_name RepeaterNode
extends BehaviourNode

@export var node: BehaviourNode


func evaluate(context: Dictionary) -> BehaviourNode.Status:
	node.evaluate(context)
	return BehaviourNode.Status.RUNNING
