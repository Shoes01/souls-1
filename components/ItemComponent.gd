# Flags the item as an Item.
class_name ItemComponent
extends Node


export var is_consumable := false
export var is_equippable := false
export var is_equipped := false setget set_equipped, get_equipped
export var is_droppable := true
export var slot := "" setget , get_slot
export var bonus := {
	"ATK": 0,
	"DEF": 0,
	"MAG": 0,
	"RES": 0,
	"SPD": 0,
	"HP": 0
} 


func _ready() -> void:
	get_parent().add_to_group("item")


func get_slot() -> String:
	return slot


func set_equipped(value: bool) -> void:
	is_equipped = value


func get_equipped() -> bool:
	return is_equipped


func get_bonus(stat: String) -> int:
	return bonus[stat]


func get_class() -> String:
	return "ItemComponent"
