class_name InventorySystem
extends Node


signal add_child_entity(entity)


func _on_dropped(item: Entity, entity: Entity) -> void:
	# Remove from inventory.
	var inventory_component: Node = entity.get_component("InventoryComponent")
	inventory_component.remove_item(item)
	# Add to child of gameboard
	item.position = entity.position
	emit_signal("add_child_entity", item)
