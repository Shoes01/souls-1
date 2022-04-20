class_name InventoryComponent
extends Node


var contents: Array = [] setget set_contents, get_contents


func _ready() -> void:
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
	var item_component: Node = item.get_component("ItemComponent")
	var toggle: bool = item_component.get_equipped()
	item.get_component("ItemComponent").set_equipped(!toggle)
	
	# Unequip any other item that occupies the same slot.
	for stored_item in contents:
		if stored_item._id == item._id: continue
		
		var stored_item_component: Node = stored_item.get_component("ItemComponent")
		
		if (stored_item_component.get_equipped() == true
		and stored_item_component.get_slot() == item_component.get_slot()):
			stored_item_component.set_equipped(false)


func unequip_item(item: Entity) -> void:
	item.get_component("ItemComponent").set_equipped(false)


func get_equipped_bonus(stat: String) -> int:
	var bonus := 0
	
	for item in contents:
		var item_component = item.get_component("ItemComponent")
		if item_component.get_equipped() == true:
			bonus += item_component.get_bonus(stat)
				
	return bonus


func get_class() -> String:
	return "InventoryComponent"
