# Flags the item as an Item.
class_name ItemComponent
extends Node


export var is_consumable := false
export var is_equippable := false
export var is_droppable := true


func _ready() -> void:
	get_parent().add_to_group("item")


func get_class() -> String:
	return "ItemComponent"
