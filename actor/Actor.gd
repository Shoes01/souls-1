class_name Actor
extends Node2D


onready var job = $Job
onready var soul = $Soul


func die() -> void:
	print("This unit is dead.")
	queue_free()


func make(value: String) -> void:
	if value == "npc":
		$Job._make("recruit")
		$Soul.set_soul([[6, 3, 10], [6, 3, 10]])
		$Sprite.set_flip_h(true)
		add_to_group("npcs")
	if value == "pc":
		$Job._make("recruit")
		$Soul.set_soul([[10, 5, 1], [10, 5, 1]])
		$Sprite.set_texture(load("res://assets/alienGreen.png"))


func get_stat(value) -> int:
	# Value is a stat from Global.Stat
	var _soul: Array = $Soul.get_soul()
	var total = 0
	
	for x in range(0, len(_soul)):
		for y in range(0, len(_soul[0])):
			if $Job.stat_assignment[x][y] == value:
				total += _soul[x][y]
	
	return total


func reduce_stat(stat, amount) -> void:
	# Stat is a stat from Global.Stat
	# Amount is how much is being reduced from said stat.
	var _soul = $Soul.get_soul()
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
