extends Control


signal closed()
signal drop(dropped_item, entity)

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity


func _ready() -> void:
	#$Panel/ItemList/PopupMenu.
	pass


func open_menu(entity: Entity) -> void:
	_cached_entity = entity
	var contents: Array = entity.get_component("InventoryComponent").get_contents()
	_cached_contents = contents
	
	for item in contents:
		$Panel/ItemList.add_item(item.name)
	
	set_visible(true)


func close_menu():
	$Panel/ItemList.clear()
	set_visible(false)


func _on_ItemList_item_activated(index: int) -> void:
	var entity = _cached_contents[index]
	var item_component = entity.get_component("ItemComponent")
	_cached_selected_item = entity
	
	# Popup Menu options
	## Consume
	## Drop
	## Equip
	
	if item_component.is_consumable:
		$Panel/ItemList/PopupMenu.set_item_disabled(0, false)
	else:
		$Panel/ItemList/PopupMenu.set_item_disabled(0, true)
	
	if item_component.is_droppable:
		$Panel/ItemList/PopupMenu.set_item_disabled(1, false)
	else:
		$Panel/ItemList/PopupMenu.set_item_disabled(1, true)
	
	if item_component.is_equippable:
		$Panel/ItemList/PopupMenu.set_item_disabled(2, false)
	else:
		$Panel/ItemList/PopupMenu.set_item_disabled(2, true)
	
	$Panel/ItemList/PopupMenu.set_visible(true)


func _on_PopupMenu_index_pressed(index: int) -> void:
	# 0 : consume
	if index == 1:
		emit_signal("drop", _cached_selected_item, _cached_entity)
		emit_signal("closed")
		
	# 2 : equip
	
