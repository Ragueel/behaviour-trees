class_name MoveToTarget
extends BehaviourNode

@export var move_node: CharacterBody3D
@export var reach_distance: float = 1
@export var move_speed: float = 300


func evaluate(context: Dictionary) -> BehaviourNode.Status:
	if not FindTarget.target_ctx_name in context:
		push_error("Target is not in context")
		return BehaviourNode.Status.ERROR

	var target: Node = context[FindTarget.target_ctx_name]
	if not target is Node3D:
		push_error("Target is not node 3d, got %s"  % [target])
		return BehaviourNode.Status.ERROR

	var target_position: Vector3 = (target as Node3D).position
	if has_reached_target(target_position):
		return BehaviourNode.Status.SUCCESS

	var movement_direction: Vector3 = target_position - move_node.position
	move_node.position += movement_direction.normalized() * (move_speed * get_process_delta_time())

	return BehaviourNode.Status.RUNNING


func has_reached_target(target_position: Vector3) -> bool:
	var distance: float = target_position.distance_to(move_node.position)
	return distance < reach_distance
