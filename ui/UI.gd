extends Node


signal game_state_has_changed()


func _ready() -> void:
	$InventoryMenu.connect("finished", self, "_on_finished")
	$ConsumeMenu.connect("finished", self, "_on_finished")


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_state[-1] != Global.State.STATE_MENU: return
	
	# Handle input specific to these menus.
	if $CharacterMenu.is_active():
		# Has no input at the moment.
		pass
	if $ConsumeMenu.is_active():
		if event.is_action_pressed("ui_right"):		$ConsumeMenu.rotate_soul("right")
		elif event.is_action_pressed("ui_up"):		$ConsumeMenu.rotate_soul("up")
		elif event.is_action_pressed("ui_left"):	$ConsumeMenu.rotate_soul("left")
		elif event.is_action_pressed("ui_down"):	$ConsumeMenu.rotate_soul("down")
		elif event.is_action_pressed("ui_accept"):	
			$ConsumeMenu.consume()
			_on_finished()
	if $InventoryMenu.is_active():
		# Has no input at the moment.
		# Eventually, I could add hotkeys.
		pass
	
	# Handle general menu input.
	if event.is_action_pressed("ui_cancel"):
		_on_finished()
		get_tree().set_input_as_handled()


func _on_opened_menu(menu: String, entity: Entity) -> void:
	Global.game_state.push_back(Global.State.STATE_MENU)
	emit_signal("game_state_has_changed")
	
	match menu:
		"consume_menu":		$ConsumeMenu.open_menu(entity)
		"character_menu":	$CharacterMenu.open_menu(entity)
		"inventory_menu":	$InventoryMenu.open_menu(entity)


func _on_finished() ->void:
	Global.game_state.pop_back()
	emit_signal("game_state_has_changed")
	$CharacterMenu.close_menu()
	$InventoryMenu.close_menu()
	$ConsumeMenu.close_menu()
	get_tree().set_input_as_handled()
