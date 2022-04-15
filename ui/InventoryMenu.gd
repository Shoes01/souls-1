extends Control


enum Action {ACTION_DROP, ACTION_EQUIP}

signal add_child_entity(item)
signal finished()
signal dropped(dropped_item, entity)
signal equipped(equipped_item, entity)

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity
var _state := "inactive" setget set_activity, get_activity


func open_menu(entity: Entity) -> void:
	set_activity("active")
	_cached_entity = entity
	_cached_contents = entity.get_component("InventoryComponent").get_contents()
	
	for item in _cached_contents:
		$Panel/VBoxContainer/ItemList.add_item(item.name)	


func close_menu() -> void:
	set_activity("inactive")
	$Panel/VBoxContainer/ItemList.clear()
	$Panel/VBoxContainer/ItemList/PopupMenu.set_visible(false)
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


func _on_ItemList_item_activated(index: int) -> void:
	_cached_selected_item = _cached_contents[index]
	
	var item_component = _cached_selected_item.get_component("ItemComponent")
	
	# Popup Menu options
	$Panel/VBoxContainer/ItemList/PopupMenu.set_item_disabled(Action.ACTION_DROP, !item_component.is_droppable)
	$Panel/VBoxContainer/ItemList/PopupMenu.set_item_disabled(Action.ACTION_EQUIP, !item_component.is_equippable)
	
	$Panel/VBoxContainer/ItemList/PopupMenu.set_visible(true)


func _on_PopupMenu_index_pressed(index: int) -> void:
	# Drop item.
	if index == Action.ACTION_DROP:
		_cached_entity.get_component("InventoryComponent").remove_item(_cached_selected_item)
		_cached_selected_item.position = _cached_entity.position
		emit_signal("add_child_entity", _cached_selected_item)
		emit_signal("finished")
	# Equip item.
	if index == Action.ACTION_EQUIP:
		_cached_entity.get_component("InventoryComponent").equip_item(_cached_selected_item)
		# Probably emit a signal here.
		emit_signal("finished")

