extends Control


signal finished()
signal game_state_has_changed()

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity


func close_menu() -> void:
	set_visible(false)
	$Panel/VBoxContainer/ItemList.clear()
	$Panel2.set_visible(false)


func consume() -> void:
	for child in get_tree().get_nodes_in_group("pc"):
		# there is only one.
		child.get_component("SoulComponent").merge(_cached_selected_item.get_component("SoulComponent"))
		child.get_component("InventoryComponent").remove_item(_cached_selected_item)
		_cached_selected_item.queue_free()
		_cached_selected_item = null


func is_active() -> bool:
	return visible


func open_menu(entity: Entity) -> void:
	var contents: Array = entity.get_component("InventoryComponent").get_contents()
	
	_cached_entity = entity
	_cached_contents = contents
	
	for item in contents:
		print(item)
		var soul_sum = item.get_component("SoulComponent").get_soul_sum()
		var item_entry: String = item.name + " (" + str(soul_sum) + ")"
		print(item_entry)
		$Panel/VBoxContainer/ItemList.add_item(item_entry)
	
	set_visible(true)


func rotate_soul(direction: String) -> void:
	if _cached_selected_item == null: return
	
	match direction:
		"right":	_cached_selected_item.get_component("SoulComponent").rotate_right()
		"left":		_cached_selected_item.get_component("SoulComponent").rotate_left()
		"up":		_cached_selected_item.get_component("SoulComponent").rotate_up()
		"down":		_cached_selected_item.get_component("SoulComponent").rotate_down()
	
	_update_menu()


func _on_ItemList_item_activated(index):
	emit_signal("game_state_has_changed")
	_cached_selected_item = _cached_contents[index]
	
	var presoul_text: String = _cached_entity.get_component("SoulComponent").get_soul_string()
	$Panel2/HBoxContainer/VBoxContainer/PreSoul.set_text(presoul_text)
	
	_update_menu()
	
	$Panel2.set_visible(true)


func _update_menu() -> void:
	if _cached_selected_item:
		var newsoul_text: String = _cached_selected_item.get_component("SoulComponent").get_soul_string()
		$Panel2/HBoxContainer/VBoxContainer2/NewSoul.set_text(newsoul_text)
		
		# This code is laregly copied from the SoulComponent.
		var presoul = _cached_entity.get_component("SoulComponent").get_soul()
		var newsoul = _cached_selected_item.get_component("SoulComponent").get_soul()
		
		var merged_soul_text: String = ""
		for x in range(0, len(presoul)):
			merged_soul_text += "["
			for y in range(0, len(presoul[0])):
				var value = newsoul[x][y] + presoul[x][y]
				var string: String = "%4d, " % value
				merged_soul_text += string
			merged_soul_text.erase(merged_soul_text.length() - 2, 2)
			merged_soul_text += "]\n"
		
		$Panel2/HBoxContainer/VBoxContainer3/MergedSoul.set_text(merged_soul_text)
