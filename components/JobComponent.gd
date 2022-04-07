class_name JobComponent
extends Node


export var name_: String = "Recruit" setget set_name, get_name
export var stat_assignment: Array = [["ATK", "DEF", "SPD"],
									 ["MAG", "RES", "HP"]
									] setget set_stat_assignment, get_stat_assignment


func _ready() -> void:
	get_parent().add_to_group("job")


func set_name(value: String) -> void:
	name_ = value


func get_name() -> String:
	return name_


func set_stat_assignment(value: Array) -> void:
	stat_assignment = value


func get_stat_assignment() -> Array:
	return stat_assignment


func get_class() -> String:
	return "JobComponent"
