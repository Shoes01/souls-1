extends Node


func _ready() -> void:
	# Needed at start of game.
	Global.game_state.push_back(Global.State.STATE_GAME)
	$Debug._on_game_state_has_changed()
	
	# Connect Gameboard signals.	
	$Gameboard.connect("entity_moved", 		$Gameboard/MovementSystem, 		"_on_entity_moved")
	$Gameboard.connect("item_picked_up", 	$Gameboard/ItemPickupSystem, 	"_on_item_picked_up")
	$Gameboard.connect("opened_menu", 		$UI, 							"_on_opened_menu")
	$Gameboard.connect("HUD_updated",		$UI/HUD,						"_on_HUD_updated")
	
	# Connect system signals.
	$Gameboard/CombatSystem.connect(	"stat_reduced", 	$Gameboard/DamageSystem, 	"_on_stat_reduced")
	$Gameboard/DamageSystem.connect(	"died", 			$Gameboard/DeathSystem, 	"_on_died")
	$Gameboard/DeathSystem.connect(		"add_child_entity", $Gameboard, 				"_on_add_child_entity")
	$Gameboard/ItemPickupSystem.connect("removed_entity", 	$Gameboard, 				"_on_removed_entity")
	$Gameboard/MovementSystem.connect(	"begin_combat", 	$Gameboard/CombatSystem, 	"_on_begin_combat")
	
	# Connect UI signals.
	$UI.connect(				"game_state_has_changed", 	$Debug, 	"_on_game_state_has_changed")
	$UI/InventoryMenu.connect(	"add_child_entity", 		$Gameboard, "_on_add_child_entity")
