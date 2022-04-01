extends Node


signal game_state_has_changed()


func _on_opened_character_menu(actor: Actor) -> void:
	Global.game_state.push_back(Global.State.STATE_MENU)
	emit_signal("game_state_has_changed")
	$CharacterMenu.open_menu(actor)


func _on_close_character_menu() -> void:
	$CharacterMenu.close_menu()


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_state[-1] != Global.State.STATE_MENU: return
	
	if event.is_action_pressed("ui_cancel"):
		Global.game_state.pop_back()
		emit_signal("game_state_has_changed")
		$CharacterMenu.close_menu()
		get_tree().set_input_as_handled()
