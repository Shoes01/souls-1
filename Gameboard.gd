class_name GameBoard
extends Node


export var combat_engine: Resource = preload("res://CombatEngine.tres")
export var grid: Resource = preload("res://Grid.tres")

onready var player_character: Node2D = $PC


func _ready() -> void:
	var player_cell = grid.calculate_grid_coordinates(player_character.position)
	player_character.position = grid.calculate_map_position(player_cell)
	
	for child in $NPCs.get_children():
		var child_cell = grid.calculate_grid_coordinates(child.position)
		child.position = grid.calculate_map_position(child_cell)


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
	var walls: Array = $Map/Walls.get_used_cells()
	
	var valid_target := true
	if not grid.is_within_bounds(target_cell):
		valid_target = false
	
	# Check to see if anything is occupying target_cell
	if target_cell in walls:
		valid_target = false
	
	# Check to see if any unit is occupying target_cell
	for child in $NPCs.get_children():
		var child_cell = grid.calculate_grid_coordinates(child.position)
		if target_cell == child_cell:
			combat_engine.physical_combat(player_character, child)
			valid_target = false
			break
	
	if valid_target:
		player_character.position += direction * grid.cell_size.x
