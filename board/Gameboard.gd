class_name GameBoard
extends Node


signal opened_character_menu(actor)

export var combat_engine: Resource = preload("res://CombatEngine.tres")
export var grid: Resource = preload("res://board/Grid.tres")

onready var player_character: Actor = load("res://actor/Actor.tscn").instance()


func _ready() -> void:
	# Prepare PC
	add_child(player_character)
	player_character.make("pc")
	player_character.position = grid.calculate_map_position(Vector2(3, 3))
	
	
	# Prepare NPC
	var npc: Actor= load("res://actor/Actor.tscn").instance()
	add_child(npc)
	npc.make("npc")
	npc.position = grid.calculate_map_position(Vector2(3, 5))


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_state[-1] != Global.State.STATE_GAME: return
	
	# This can probably be streamlined, but eh.
	if event.is_action_pressed("ui_right"):
		_move_player_character(Vector2.RIGHT)
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_up"):
		_move_player_character(Vector2.UP)
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_left"):
		_move_player_character(Vector2.LEFT)
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_down"):
		_move_player_character(Vector2.DOWN)
		get_tree().set_input_as_handled()
	
	if event.is_action_pressed("custom_character_menu_open"):
		# open the character menu, probably via signal.
		emit_signal("opened_character_menu", player_character)
		get_tree().set_input_as_handled()


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
	var npcs = get_tree().get_nodes_in_group("npcs")
	for child in npcs:
		var child_cell = grid.calculate_grid_coordinates(child.position)
		if target_cell == child_cell:
			combat_engine.physical_combat(player_character, child)
			valid_target = false
			break
	
	if valid_target:
		player_character.position += direction * grid.cell_size.x
