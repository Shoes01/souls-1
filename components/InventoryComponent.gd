class_name InventoryComponent
extends Node


var contents: Array = [] setget set_contents, get_contents
var equipped : Dictionary


func _ready() -> void:
	equipped["MAIN"] = null
	equipped["OFF"] = null
	equipped["HEAD"] = null
	equipped["BODY"] = null
	get_parent().add_to_group("inventory")


func set_contents(new_contents: Array) -> void:
	contents = new_contents


func get_contents() -> Array:
	return contents


func add_item(item: Entity) -> void:
	contents.append(item)


func remove_item(item: Entity) -> void:
	unequip_item(item)
	
	var index := 0
	for stored_item in contents:
		if item._id == stored_item._id:
			contents.remove(index)
			break
		else:
			index += 1


func equip_item(item: Entity) -> void:
	var toggle: bool = item.get_component("ItemComponent").get_equipped()
	item.get_component("ItemComponent").set_equipped(!toggle)


func unequip_item(item: Entity) -> void:
	item.get_component("ItemComponent").set_equipped(false)


func get_class() -> String:
	return "InventoryComponent"
