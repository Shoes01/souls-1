# Flags the item as an Item.
class_name ItemComponent
extends Node


func _ready() -> void:
	get_parent().add_to_group("item")
