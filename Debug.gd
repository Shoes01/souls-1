extends Node


func _on_game_state_has_changed() -> void:
	var text = ""
	
	if Global.game_state[-1] == Global.State.STATE_GAME: text = "State: Game state"
	if Global.game_state[-1] == Global.State.STATE_MENU: text = "State: Menu state"
	
	$Label.set_text(text)
