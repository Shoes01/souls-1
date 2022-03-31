extends Node


func _on_open_character_menu(actor: Actor) -> void:
	$CharacterMenu.open_menu(actor)


func _on_close_character_menu() -> void:
	$CharacterMenu.close_menu()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		$CharacterMenu.close_menu()
		get_tree().set_input_as_handled()
