class_name InventoryComponent
extends Node


var contents: Array = [] setget set_contents, get_contents


func set_contents(new_contents: Array) -> void:
	contents = new_contents


func get_contents() -> Array:
	return contents


func add_item(item: Entity) -> void:
	contents.append(item)
