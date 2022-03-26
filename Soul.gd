class_name Soul
extends Node

# Access a value by using soul[row][column]
var soul = [
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9]
]


func _ready() -> void:
	#_create_with_dimensions(2, 5)
	pass


func create_with_dimensions(rows: int, columns: int) -> void:
	var new_soul = []
	for x in range(0, rows):
		new_soul.append([])
		for y in range(0, columns):
			new_soul[x].append(0)
	
	soul = new_soul

# The left-most column goes to the far-right.
func rotate_left() -> void:
	for x in range(0, len(soul)):
		# Pop the fist element and push it to the back.
		soul[x].push_back(soul[x].pop_front())

# The right-most column goes to the far-left.
func rotate_right() -> void:
	for x in range(0, len(soul)):
		# Pop the last element, and push it to the front.
		soul[x].push_front(soul[x].pop_back())

# The top-most row goes to the bottom.
func rotate_up() -> void:
	soul.push_back(soul.pop_front())

# The bottom-most row goes to the top.
func rotate_down() -> void:
	soul.push_front(soul.pop_back())

# Merge two souls.
func merge_with(new_soul: Array) -> void:
	for x in range(0, len(new_soul)):
		for y in range(0, len(new_soul[x])):
			soul[x][y] += new_soul[x][y]
