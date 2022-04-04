extends Node


func _ready() -> void:
	# Needed at start of game.
	Global.game_state.push_back(Global.State.STATE_GAME)
	$Debug._on_game_state_has_changed()
	
	# Connect signals.
	$Gameboard.connect("opened_character_menu", $UI, "_on_opened_character_menu")
	$UI.connect("game_state_has_changed", $Debug, "_on_game_state_has_changed")
	$Gameboard/MovementSystem.connect("begin_combat", $Gameboard/CombatSystem, "_on_begin_combat")
	$Gameboard/CombatSystem.connect("stat_reduced", $Gameboard/DamageSystem, "_on_stat_reduced")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("custom_toggle_debug"):
		$Debug.set_visible(!$Debug.is_visible())
		get_tree().set_input_as_handled()
