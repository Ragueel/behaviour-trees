class_name FindTarget
extends BehaviourNode

const target_ctx_name: StringName = "target"


func evaluate(context: Dictionary) -> BehaviourNode.Status:
	var target_node: Node = get_node("/root/GameplayScene/target")
	if target_node == null:
		return BehaviourNode.Status.ERROR

	if not (target_node as Target).is_alive():
		return BehaviourNode.Status.ERROR

	context[target_ctx_name] = target_node

	return BehaviourNode.Status.SUCCESS
