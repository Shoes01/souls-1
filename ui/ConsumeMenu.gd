extends Control


signal finished()
signal soul_chosen(soul)

var _cached_contents : Array
var _cached_entity : Entity
var _cached_selected_item : Entity
var _state := "inactive" setget set_activity, get_activity


func close_menu() -> void:
	$Panel/VBoxContainer/ItemList.clear()
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
	var contents: Array = entity.get_component("InventoryComponent").get_contents()
	
	_cached_entity = entity
	_cached_contents = contents
	
	for item in contents:
		print(item)
		var soul_sum = item.get_component("SoulComponent").get_soul_sum()
		var item_entry: String = item.name + " (" + str(soul_sum) + ")"
		print(item_entry)
		$Panel/VBoxContainer/ItemList.add_item(item_entry)
	
	set_activity("active")


func _on_ItemList_item_activated(index):
	_cached_selected_item = _cached_contents[index]
	emit_signal("soul_chosen", _cached_entity, _cached_selected_item)
	set_activity("dormant")
