class_name StatSubSystem
extends Resource


func calculate_stats(entity: Entity) -> Dictionary:
	var soul: Array = entity.get_component("SoulComponent").get_soul()
	var stat_assignment: Array = entity.get_component("JobComponent").get_stat_assignment()
	var stat_values: Dictionary = {
		"ATK": 0,
		"DEF": 0,
		"MAG": 0,
		"RES": 0,
		"SPD": 0,
		"HP": 0
	}

	for x in range(0, len(soul)):
		for y in range(0, len(soul[0])):
			var key: String = stat_assignment[x][y]
			stat_values[key] += soul[x][y]
	
	return stat_values
