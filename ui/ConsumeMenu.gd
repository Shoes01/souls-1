extends Control


signal closed()
signal game_state_has_changed()

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity


func open_menu(entity: Entity) -> void:
	var contents: Array = entity.get_component("InventoryComponent").get_contents()
	
	_cached_entity = entity
	_cached_contents = contents
	
	for item in contents:
		print(item)
		var soul_sum = item.get_component("SoulComponent").get_soul_sum()
		var item_entry: String = item.name + " (" + str(soul_sum) + ")"
		print(item_entry)
		$Panel/ItemList.add_item(item_entry)
	
	set_visible(true)


func close_menu() -> void:
	set_visible(false)
	$Panel/ItemList.clear()
	$Panel2.set_visible(false)


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_state[-1] != Global.State.STATE_CONSUME_MENU:return
	
	
	if event.is_action_pressed("ui_right"):
		_cached_selected_item.get_component("SoulComponent").rotate_right()
	elif event.is_action_pressed("ui_up"):
		_cached_selected_item.get_component("SoulComponent").rotate_up()
	elif event.is_action_pressed("ui_left"):
		_cached_selected_item.get_component("SoulComponent").rotate_left()
	elif event.is_action_pressed("ui_down"):
		_cached_selected_item.get_component("SoulComponent").rotate_down()
	elif event.is_action_pressed("ui_accept"):
		for child in get_tree().get_nodes_in_group("pc"):
			# there is only one.
			child.get_component("SoulComponent").merge(_cached_selected_item.get_component("SoulComponent"))
			child.get_component("InventoryComponent").remove_item(_cached_selected_item)
			_cached_selected_item.queue_free()
			_cached_selected_item = null
		emit_signal("closed")
	
	update_menu()

func _on_ItemList_item_activated(index):
	emit_signal("game_state_has_changed")
	_cached_selected_item = _cached_contents[index]
	
	var presoul_text: String = _cached_entity.get_component("SoulComponent").get_soul_string()
	$Panel2/HBoxContainer/PreSoul.set_text(presoul_text)
	
	var newsoul_text: String = _cached_selected_item.get_component("SoulComponent").get_soul_string()
	$Panel2/HBoxContainer/NewSoul.set_text(newsoul_text)
	
	$Panel2.set_visible(true)


func update_menu() -> void:
	if _cached_selected_item:
		var newsoul_text: String = _cached_selected_item.get_component("SoulComponent").get_soul_string()
		$Panel2/HBoxContainer/NewSoul.set_text(newsoul_text)
