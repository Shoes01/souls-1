class_name CombatSystem
extends Node


signal stat_reduced(stat, amount, entity)

var stat_sub_system: Resource = preload("res://systems/StatSubSystem.tres")


func _on_begin_combat(attacker: Entity, defender: Entity, is_attack: bool) -> void:
	var attacker_stats: Dictionary = stat_sub_system.calculate_stats(attacker)
	var defender_stats: Dictionary = stat_sub_system.calculate_stats(defender)
	
	var damage_output: int = attacker_stats["ATK"] - defender_stats["DEF"]
	if is_attack == false:
		damage_output = attacker_stats["MAG"] - defender_stats["RES"]
	
	if damage_output < 0:
		damage_output = 0
	
	if attacker_stats["SPD"] > defender_stats["SPD"] + 5:
		damage_output *= 2
	
	print("Attacker deals ", damage_output, " to defender.")
	
	emit_signal("stat_reduced", "HP", damage_output, defender)
