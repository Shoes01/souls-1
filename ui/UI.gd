extends Node


signal game_state_has_changed()


func _ready() -> void:
	$InventoryMenu.connect("closed", self, "close")


func _on_opened_character_menu(entity: Entity) -> void:
	Global.game_state.push_back(Global.State.STATE_MENU)
	emit_signal("game_state_has_changed")
	$CharacterMenu.open_menu(entity)


func _on_opened_inventory_menu(entity: Entity) -> void:
	Global.game_state.push_back(Global.State.STATE_MENU)
	emit_signal("game_state_has_changed")
	$InventoryMenu.open_menu(entity)


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_state[-1] != Global.State.STATE_MENU: return
	
	if event.is_action_pressed("ui_cancel"):
		close()


func close() ->void:
	Global.game_state.pop_back()
	emit_signal("game_state_has_changed")
	$CharacterMenu.close_menu()
	$InventoryMenu.close_menu()
	get_tree().set_input_as_handled()
