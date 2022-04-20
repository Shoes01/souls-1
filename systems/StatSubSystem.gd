class_name StatSubSystem
extends Resource


func calculate_stats(entity: Entity) -> Dictionary:
	# Get Soul/Job stats.
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
	
	# Get item-related bonus.
	var inventory_component = entity.get_component("InventoryComponent")
	if inventory_component != null:
		for stat in stat_values.keys():
			stat_values[stat] += inventory_component.get_equipped_bonus(stat)
	
	return stat_values
