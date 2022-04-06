extends Control


func open_menu(entity: Entity) -> void:
	# List all the items in the entity inventory
	# Allow the user to click on an itme with a mouse
	## popup menu allows you to consume item
	var contents = entity.get_component("InventoryComponent").get_contents()
	
	for item in contents:
		$Panel/ItemList.add_item(item.name)
	
	set_visible(true)


func close_menu():
	set_visible(false)
