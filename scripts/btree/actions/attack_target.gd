class_name AttackTarget
extends BehaviourNode

@export var author: Node
@export var damage_amount: int = 10


func evaluate(context: Dictionary) -> BehaviourNode.Status:
	if not FindTarget.target_ctx_name in context:
		push_error("Target is not in context")
		return BehaviourNode.Status.ERROR

	var target = context[FindTarget.target_ctx_name]
	if not target is Target:
		push_error("got invalid target to attack")
		return BehaviourNode.Status.ERROR

	(target as Target).take_damage(DamageData.new(author, damage_amount))

	return BehaviourNode.Status.SUCCESS
