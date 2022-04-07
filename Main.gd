extends Node


func _ready() -> void:
	# Needed at start of game.
	Global.game_state.push_back(Global.State.STATE_GAME)
	$Debug._on_game_state_has_changed()
	
	# Connect signals.
	$Gameboard.connect("opened_character_menu", $UI, "_on_opened_character_menu")
	$UI.connect("game_state_has_changed", $Debug, "_on_game_state_has_changed")
	$Gameboard.connect("entity_moved", $Gameboard/MovementSystem, "_on_entity_moved")
	$Gameboard.connect("item_picked_up", $Gameboard/ItemPickupSystem, "_on_item_picked_up")
	$Gameboard.connect("opened_inventory_menu", $UI, "_on_opened_inventory_menu")
	$Gameboard/MovementSystem.connect("begin_combat", $Gameboard/CombatSystem, "_on_begin_combat")
	$Gameboard/CombatSystem.connect("stat_reduced", $Gameboard/DamageSystem, "_on_stat_reduced")
	$Gameboard/DamageSystem.connect("died", $Gameboard/DeathSystem, "_on_died")
	$Gameboard/DeathSystem.connect("add_child_entity", $Gameboard, "_on_add_child_entity")
	$Gameboard/ItemPickupSystem.connect("removed_entity", $Gameboard, "_on_removed_entity")
	$UI/InventoryMenu.connect("drop", $Gameboard/InventorySystem, "_on_drop")
	$Gameboard/InventorySystem.connect("add_child_entity", $Gameboard, "_on_add_child_entity")
