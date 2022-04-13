extends Control


signal add_child_entity(item)
signal finished()
signal dropped(dropped_item, entity)
signal equipped(equipped_item, entity)

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity


func close_menu() -> void:
	$Panel/ItemList.clear()
	$Panel/ItemList/PopupMenu.set_visible(false)
	set_visible(false)


func is_active() -> bool:
	return visible


func open_menu(entity: Entity) -> void:
	_cached_entity = entity
	var contents: Array = entity.get_component("InventoryComponent").get_contents()
	_cached_contents = contents
	
	for item in contents:
		$Panel/ItemList.add_item(item.name)
	
	set_visible(true)


func _on_ItemList_item_activated(index: int) -> void:
	var entity = _cached_contents[index]
	var item_component = entity.get_component("ItemComponent")
	_cached_selected_item = entity
	
	# Popup Menu options
	## Drop
	## Equip
	if item_component.is_droppable:
		$Panel/ItemList/PopupMenu.set_item_disabled(0, false)
	else:
		$Panel/ItemList/PopupMenu.set_item_disabled(0, true)
	
	if item_component.is_equippable:
		$Panel/ItemList/PopupMenu.set_item_disabled(1, false)
	else:
		$Panel/ItemList/PopupMenu.set_item_disabled(1, true)
	
	$Panel/ItemList/PopupMenu.set_visible(true)


func _on_PopupMenu_index_pressed(index: int) -> void:
	# Drop item.
	if index == 0:
		_cached_entity.get_component("InventoryComponent").remove(_cached_selected_item)
		_cached_selected_item.position = _cached_entity.position
		emit_signal("add_child_entity", _cached_selected_item)
		emit_signal("finished")
	# Equip item.
	if index == 1:
		_cached_entity.get_component("InventoryComponent").equip(_cached_selected_item)
		emit_signal("finished")

