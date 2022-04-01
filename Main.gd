extends Node


func _ready() -> void:
	$Gameboard.connect("opened_character_menu", $UI, "_on_opened_character_menu")
	$UI.connect("game_state_has_changed", $Debug, "_on_game_state_has_changed")
	
	Global.game_state.push_back(Global.State.STATE_GAME)
	$Debug._on_game_state_has_changed()
