class_name SoulComponent
extends Node


export var _soul: Array = [[0, 0, 0], [0, 0, 0]] setget set_soul, get_soul


func _ready() -> void:
	get_parent().add_to_group("soul")


func get_soul() -> Array:
	return _soul


func set_soul(value: Array) -> void:
	_soul = value


func get_soul_string() -> String:
	var soul_string: String = ""
	for x in range(0, len(_soul)):
		soul_string += "["
		for y in range(0, len(_soul[0])):
			var string: String = "%4d, " % _soul[x][y]
			soul_string += string
		soul_string.erase(soul_string.length() - 2, 2)
		soul_string += "]\n"
	
	return soul_string


func get_row_count() -> int:
	return len(_soul)


func get_column_count()  -> int:
	return len(_soul[0])


func get_class() -> String:
	return "SoulComponent"
