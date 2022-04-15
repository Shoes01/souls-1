extends Control


signal finished()
signal soul_chosen(soul)

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity
var _state := "inactive" setget set_activity, get_activity


func open_menu(entity: Entity) -> void:
	set_activity("active")
	_cached_entity = entity
	_cached_contents = entity.get_component("InventoryComponent").get_contents()
	
	for item in _cached_contents:
		var soul_sum = item.get_component("SoulComponent").get_soul_sum()
		var item_entry: String = item.name + " (" + str(soul_sum) + ")"
		
		$Panel/VBoxContainer/ItemList.add_item(item_entry)


func close_menu() -> void:
	set_activity("inactive")
	$Panel/VBoxContainer/ItemList.clear()
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


func _on_ItemList_item_activated(index):
	_cached_selected_item = _cached_contents[index]
	emit_signal("soul_chosen", _cached_entity, _cached_selected_item)
	set_activity("dormant")
