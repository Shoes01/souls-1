class_name GameBoard
extends Node


var grid: Grid = preload("res://Grid.tres")

onready var player_character: Node2D = $PC


func _ready() -> void:
	var player_cell = grid.calculate_grid_coordinates(player_character.position)
	player_character.position = grid.calculate_map_position(player_cell)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		_move_player_character(Vector2.RIGHT)
	elif event.is_action_pressed("ui_up"):
		_move_player_character(Vector2.UP)
	elif event.is_action_pressed("ui_left"):
		_move_player_character(Vector2.LEFT)
	elif event.is_action_pressed("ui_down"):
		_move_player_character(Vector2.DOWN)


func _move_player_character(direction: Vector2) -> void:
	var player_cell = grid.calculate_grid_coordinates(player_character.position)
	var target_cell = player_cell + direction
	var walls: Array = get_node("Map/Walls").get_used_cells()
	
	# Check to see if anything is occupying target_cell
	if !(target_cell in walls):
		player_character.position += direction * grid.cell_size.x
