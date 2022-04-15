extends Node


signal game_state_has_changed()


func _ready() -> void:
	$InventoryMenu.connect("finished", self, "_on_finished")
	$ConsumeMenu.connect("finished", self, "_on_finished")
	$ConsumeSubMenu.connect("finished", self, "_on_finished")
	$ConsumeMenu.connect("soul_chosen", $ConsumeSubMenu, "_on_soul_chosen")


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_state[-1] != Global.State.STATE_MENU: return
	
	# Handle input specific to these menus.
	if $CharacterMenu.get_activity() == "active":
		# Has no input at the moment.
		pass
	if $ConsumeMenu.get_activity() == "active":
		# Has no input at the moment.
		pass
	if $ConsumeSubMenu.get_activity() == "active":
		if event.is_action_pressed("ui_right"):
			$ConsumeSubMenu.rotate_soul("right")
			get_tree().set_input_as_handled()
		elif event.is_action_pressed("ui_up"):
			$ConsumeSubMenu.rotate_soul("up")
			get_tree().set_input_as_handled()
		elif event.is_action_pressed("ui_left"):
			$ConsumeSubMenu.rotate_soul("left")
			get_tree().set_input_as_handled()
		elif event.is_action_pressed("ui_down"):
			$ConsumeSubMenu.rotate_soul("down")
			get_tree().set_input_as_handled()
		elif event.is_action_pressed("ui_accept"):	
			$ConsumeSubMenu.consume()
			_on_finished()
			get_tree().set_input_as_handled()
	if $InventoryMenu.get_activity() == "active":
		# Has no input at the moment.
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


func _on_open_consume_submenu() -> void:
	pass


func _on_finished() ->void:
	Global.game_state.pop_back()
	emit_signal("game_state_has_changed")
	$CharacterMenu.close_menu()
	$InventoryMenu.close_menu()
	$ConsumeMenu.close_menu()
	$ConsumeSubMenu.close_menu()
	get_tree().set_input_as_handled()
