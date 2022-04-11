## Base Entity.
## 
## The base entity is a Node2D with a Transform - this goes a bit against ECS,
## but it's also simpler, so.
class_name Entity
extends Node2D


var _id: int = get_instance_id()


func _ready() -> void:
	#print("Entity is ready. ID: ", _id)
	pass


func get_component(value: String) -> Node:
	for child in get_children():
		if child.get_class() == value: 
			return child
	
	print("Failed to get component ", value, ".")
	print("Available components are:")
	for child in get_children():
		print(child.get_class())
	
	return null


func attach_component(component: Node) -> void:
	var old_parent: Node = component.get_parent()
	if old_parent: old_parent.remove_child(component)
	add_child(component)
