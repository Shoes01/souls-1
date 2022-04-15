extends Control


signal finished()

var _cached_entity : Entity
var _cached_selected_item : Node
var _state := "inactive" setget set_activity, get_activity


func open_menu(entity: Entity, new_soul: Node) -> void:
	set_activity("active")
	_cached_entity = entity
	_cached_selected_item = new_soul
	
	_update_menu()


func close_menu() -> void:
	set_activity("inactive")
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


func rotate_soul(direction: String) -> void:
	if _cached_selected_item == null: return
	
	match direction:
		"right":	_cached_selected_item.get_component("SoulComponent").rotate_right()
		"left":		_cached_selected_item.get_component("SoulComponent").rotate_left()
		"up":		_cached_selected_item.get_component("SoulComponent").rotate_up()
		"down":		_cached_selected_item.get_component("SoulComponent").rotate_down()
	
	_update_menu()


func _update_menu() -> void:
	var presoul_text: String = _cached_entity.get_component("SoulComponent").get_soul_string()
	$Panel2/HBoxContainer/VBoxContainer/PreSoul.set_text(presoul_text)
	
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


func consume() -> void:
	for child in get_tree().get_nodes_in_group("pc"):
		# there is only one.
		child.get_component("SoulComponent").merge(_cached_selected_item.get_component("SoulComponent"))
		child.get_component("InventoryComponent").remove_item(_cached_selected_item)
		_cached_selected_item.queue_free()
		_cached_selected_item = null


func _on_soul_chosen(entity: Entity, new_soul: Node) -> void:
	open_menu(entity, new_soul)
