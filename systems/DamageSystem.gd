# Should be generalized to a "stat change system"
class_name DamageSystem
extends Node


signal died(entity)


func _on_stat_reduced(stat: String, amount: int, entity: Entity) -> void:
	var stat_assignment: Array = entity.get_component("JobComponent").get_stat_assignment()
	var soul_component: Node = entity.get_component("SoulComponent")
	var soul: Array = soul_component.get_soul()
	
	for x in range(0, len(stat_assignment)):
		for y in range(0, len(stat_assignment[0])):
			if stat_assignment[x][y] == stat:
				soul[x][y] -= amount
				print(soul[x][y], " ", stat.to_lower(), " remaining.")
				soul_component.set_soul(soul)
				if stat == "HP" and soul[x][y] < 0:
					emit_signal("died", entity)


# Keep this here so I don't lose it.
func reduce_stat(stat, amount) -> void:
	# Stat is a stat from Global.Stat
	# Amount is how much is being reduced from said stat.
	var _soul: Array = $Soul.get_soul()
	# Find the highest value for stat.
	var highest_value := 0
	var highest_stat: Vector2 = Vector2.INF
	
	for x in range(0, len(_soul)):
		for y in range(0, len(_soul[0])):
			if $Job.stat_assignment[x][y] == stat and _soul[x][y] > highest_value:
				highest_value = _soul[x][y]
				highest_stat = Vector2(x, y)
				
	if highest_value > 0:
		_soul[highest_stat.x][highest_stat.y] -= amount
