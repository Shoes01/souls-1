extends Control


signal add_child_entity(item)
signal finished()
signal dropped(dropped_item, entity)
signal equipped(equipped_item, entity)

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity
var _state := "inactive" setget set_activity, get_activity


func close_menu() -> void:
	$Panel/VBoxContainer/ItemList.clear()
	$Panel/VBoxContainer/ItemList/PopupMenu.set_visible(false)
	set_activity("inactive")
	_cached_contents = []
	_cached_entity = null
	_cached_selected_item = null


func set_activity(value: String) -> void:
	_state = value
	
	match _state:
		"active": 	set_visible(true)
		"dormant": 	set_visible(true)
		"inactive": set_visible(false)


func get_activity() -> String:
	return _state


func open_menu(entity: Entity) -> void:
	_cached_entity = entity
	var contents: Array = entity.get_component("InventoryComponent").get_contents()
	_cached_contents = contents
	
	for item in contents:
		$Panel/VBoxContainer/ItemList.add_item(item.name)
	
	set_activity("active")


func _on_ItemList_item_activated(index: int) -> void:
	var entity = _cached_contents[index]
	var item_component = entity.get_component("ItemComponent")
	_cached_selected_item = entity
	
	# Popup Menu options
	## Drop
	## Equip
	if item_component.is_droppable:
		$Panel/VBoxContainer/ItemList/PopupMenu.set_item_disabled(0, false)
	else:
		$Panel/VBoxContainer/ItemList/PopupMenu.set_item_disabled(0, true)
	
	if item_component.is_equippable:
		$Panel/VBoxContainer/ItemList/PopupMenu.set_item_disabled(1, false)
	else:
		$Panel/VBoxContainer/ItemList/PopupMenu.set_item_disabled(1, true)
	
	$Panel/VBoxContainer/ItemList/PopupMenu.set_visible(true)


func _on_PopupMenu_index_pressed(index: int) -> void:
	# Drop item.
	if index == 0:
		_cached_entity.get_component("InventoryComponent").remove_item(_cached_selected_item)
		_cached_selected_item.position = _cached_entity.position
		emit_signal("add_child_entity", _cached_selected_item)
		emit_signal("finished")
	# Equip item.
	if index == 1:
		_cached_entity.get_component("InventoryComponent").equip_item(_cached_selected_item)
		emit_signal("finished")

