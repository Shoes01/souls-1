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


func get_soul_sum() -> int:
	var total := 0
	for row in range(0, len(_soul)):
		for col in range(0, len(_soul[0])):
			total += _soul[row][col]
	
	return total

func get_row_count() -> int:
	return len(_soul)


func get_column_count()  -> int:
	return len(_soul[0])


func get_class() -> String:
	return "SoulComponent"


# The left-most column goes to the far-right.
func rotate_left() -> void:
	for x in range(0, len(_soul)):
		# Pop the fist element and push it to the back.
		_soul[x].push_back(_soul[x].pop_front())


# The right-most column goes to the far-left.
func rotate_right() -> void:
	for x in range(0, len(_soul)):
		# Pop the last element, and push it to the front.
		_soul[x].push_front(_soul[x].pop_back())


# The top-most row goes to the bottom.
func rotate_up() -> void:
	_soul.push_back(_soul.pop_front())


# The bottom-most row goes to the top.
func rotate_down() -> void:
	_soul.push_front(_soul.pop_back())


# Merge into host soul.
func merge(new_soul_component: SoulComponent) -> void:
	var new_soul = new_soul_component.get_soul()
	for x in range(0, len(new_soul)):
		for y in range(0, len(new_soul[x])):
			_soul[x][y] += new_soul[x][y]

