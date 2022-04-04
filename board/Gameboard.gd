class_name GameBoard
extends Node


signal opened_character_menu(actor)

export var combat_engine: Script = load("res://systems/CombatSystem.gd")
export var grid: Resource = preload("res://board/Grid.tres")

onready var movement_system = $MovementSystem
onready var combat_system = $CombatSystem
onready var player_character: Entity = load("res://entity/entities/PlayerCharacter.tscn").instance()


func _ready() -> void:
	# Prepare PC
	add_child(player_character)
	player_character.position = grid.calculate_map_position(Vector2(3, 3))
	
	
	# Prepare NPC
	var npc: Entity = load("res://entity/entities/NonPlayerCharacter.tscn").instance()
	add_child(npc)
	npc.position = grid.calculate_map_position(Vector2(3, 5))


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_state[-1] != Global.State.STATE_GAME: return
	
	# This can probably be streamlined, but eh.
	if event.is_action_pressed("ui_right"):
		movement_system.move_to(player_character, Vector2.RIGHT, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_up"):
		movement_system.move_to(player_character, Vector2.UP, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_left"):
		movement_system.move_to(player_character, Vector2.LEFT, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_down"):
		movement_system.move_to(player_character, Vector2.DOWN, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	
	if event.is_action_pressed("custom_character_menu_open"):
		# open the character menu, probably via signal.
		emit_signal("opened_character_menu", player_character)
		get_tree().set_input_as_handled()

