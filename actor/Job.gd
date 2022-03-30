class_name Job
extends Node


export var name_: String = "job name" setget set_name, get_name
export var description: String = "job description" setget set_description, get_description
# The stats are assigned according to this nested array.
var stat_assignment: Array = [] setget set_stat_assignment
# The actor's soul needs to be this big in order to assume this job.
var size_requirement: Vector2 = Vector2.ZERO setget set_size_requirement


func soul_check(value: Node) -> bool:
	# TODO: This is probably broken, as is.
	if value.get_row_count() >= size_requirement.x and value.get_column_count() >= size_requirement.y:
		return true
	
	return false


func get_name() -> String:
	return name_


func set_name(value: String) -> void:
	name_ = value


func get_description() -> String:
	return description


func set_description(value: String) -> void:
	description = value


func set_stat_assignment(value: Array) -> void:
	stat_assignment = value


func set_size_requirement(value: Vector2) -> void:
	size_requirement = value


func _make(value: String) -> void:
	if value == "recruit":
		var requirements: Array = [
			[Global.Stat.STAT_ATK, Global.Stat.STAT_DEF, Global.Stat.STAT_SPD],
			[Global.Stat.STAT_MAG, Global.Stat.STAT_RES, Global.Stat.STAT_HP],
		]

		set_name("Recruit")
		set_description("The starter class.")
		set_stat_assignment(requirements)
		set_size_requirement(Vector2(2, 3))
