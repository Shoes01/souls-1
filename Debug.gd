extends CanvasLayer


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("custom_toggle_debug"):
		$Label.set_visible(!$Label.is_visible())
		get_tree().set_input_as_handled()


func _on_game_state_has_changed() -> void:
	var text := ""
	
	if Global.game_state[-1] == Global.State.STATE_GAME: text = "State: Game state"
	if Global.game_state[-1] == Global.State.STATE_MENU: text = "State: Menu state"
	
	$Label.set_text(text)
