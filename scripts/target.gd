class_name Target
extends Node3D

@export var max_hp: int = 100

var current_hp: int = 0


func _ready() -> void:
	current_hp = max_hp


func take_damage(damage_data: DamageData):
	current_hp = max(current_hp - damage_data.amount, 0)

	if current_hp < 1:
		print_debug("target died")
		return


func is_alive() -> bool:
	return current_hp > 0