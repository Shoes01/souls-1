extends Node


func _ready() -> void:
	$Gameboard.connect("opened_character_menu", $UI, "_on_opened_character_menu")
	$UI.connect("game_state_has_changed", $Debug, "_on_game_state_has_changed")
	$Gameboard/MovementSystem.connect("begin_combat", $Gameboard/CombatSystem, "_on_begin_combat")
	$Gameboard/CombatSystem.connect("damage_dealt", $Gameboard/DamageSystem, "_on_damage_dealt")
	
	Global.game_state.push_back(Global.State.STATE_GAME)
	$Debug._on_game_state_has_changed()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("custom_toggle_debug"):
		$Debug.set_visible(!$Debug.is_visible())
		get_tree().set_input_as_handled()
