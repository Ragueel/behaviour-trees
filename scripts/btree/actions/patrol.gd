class_name Patrol
extends BehaviourNode

@export var move_node: Node3D
@export var patrol_duration: float = 3.0
@export var movement_speed: float = 4.0

var current_patrol_duration: float = 0.0
var is_patrolling: bool = false
var movement_direction: Vector3 = Vector3.ZERO


func evaluate(context: Dictionary) -> BehaviourNode.Status:
	if not is_patrolling:
		is_patrolling = true
		current_patrol_duration = 0.0
		movement_direction = Vector3(randfn(0.5, 2.0), 0.0, randfn(0.5, 2.0))
		movement_direction = movement_direction.normalized()

	current_patrol_duration += get_process_delta_time()
	move_node.position += movement_direction * (movement_speed * get_process_delta_time())

	if current_patrol_duration > patrol_duration:
		is_patrolling = false
		return BehaviourNode.Status.SUCCESS

	return BehaviourNode.Status.RUNNING
