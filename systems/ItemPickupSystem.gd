class_name ItemPickupSystem
extends Node


signal removed_entity(entity)

var grid: Resource = preload("res://board/Grid.tres")


func _on_item_picked_up(entity: Entity) -> void:
	var inventory_component: Node = entity.get_component("InventoryComponent")
	
	if inventory_component == null: 
		print("Entity tried to pick up an item, but has no inventory! Entity: ", entity.name, "(", entity.id, ")")
		return
	
	#print("beep")
	
	var entity_cell: Vector2 = grid.calculate_grid_coordinates(entity.position)	
	
	for item in get_tree().get_nodes_in_group("item"):
		var item_cell: Vector2 = grid.calculate_grid_coordinates(item.position)
		
		if entity_cell == item_cell:
			# pick up the item!
			inventory_component.contents.append(item)
			emit_signal("removed_entity", item)
			print("Item picked up!")
