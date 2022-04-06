class_name GameBoard
extends Node


signal opened_character_menu(entity)
signal entity_moved(entity, direction, walls)
signal item_picked_up(entity)
signal opened_inventory_menu(entity)

export var grid: Resource = preload("res://board/Grid.tres")

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
	
	# Handle movement.
	# This can probably be streamlined, but eh.
	if event.is_action_pressed("ui_right"):
		emit_signal("entity_moved", player_character, Vector2.RIGHT, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_up"):
		emit_signal("entity_moved", player_character, Vector2.UP, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_left"):
		emit_signal("entity_moved", player_character, Vector2.LEFT, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_down"):
		emit_signal("entity_moved", player_character, Vector2.DOWN, $Map/Walls.get_used_cells())
		get_tree().set_input_as_handled()
	
	# Open Character menu.
	if event.is_action_pressed("custom_character_menu_open"):
		emit_signal("opened_character_menu", player_character)
		get_tree().set_input_as_handled()
	
	if event.is_action_pressed("custom_inventory_menu_open"):
		emit_signal("opened_inventory_menu", player_character)
		get_tree().set_input_as_handled()
	
	# Pick up an item.
	if event.is_action_pressed("custom_item_pickup"):
		emit_signal("item_picked_up", player_character)
		get_tree().set_input_as_handled()


func _on_created_new_entity(entity: Entity) -> void:
	add_child(entity)


func _on_removed_entity(entity) -> void:
	remove_child(entity)
