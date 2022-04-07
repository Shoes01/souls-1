class_name DeathSystem
extends Node


signal add_child_entity(entity)

var loot_sub_system: Resource = preload("res://systems/LootSubSystem.tres")


func _on_died(entity: Entity) -> void:
	print("Entity ", entity.name, " (ID:", entity._id, ") has died.")
	var soul_component: Node = entity.get_component("SoulComponent")
	
	# Make a droppable soul item entity.
	var soul_loot_entity: Entity = loot_sub_system.generate_soul(soul_component)
	# Set its position.
	soul_loot_entity.set_position(entity.position)
	
	emit_signal("add_child_entity", soul_loot_entity)
	
	entity.queue_free()

