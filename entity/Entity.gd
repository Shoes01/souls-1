## Base Entity.
## 
## The base entity is a Node2D with a Transform - this goes a bit against ECS,
## but it's also simpler, so.
class_name Entity
extends Node2D


var _id: int = get_instance_id()
var _list_of_components := []


func _ready() -> void:
	for child in get_children():
		_list_of_components.append(child.get_class())


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
	_list_of_components.append(component.get_class())


func get_stats() -> String:
	var soul_component = get_component("SoulComponent")
	var job_component = get_component("JobComponent")
	
	if soul_component == null or job_component == null:
		return "STATS ARE BROKEN"
	
	var soul = soul_component.get_soul()
	var job_stats = job_component.get_stat_assignment()
	
	var result: String = ""
	
	for x in range(0, len(soul)):
		for y in range(0, len(soul[0])):
			var soul_integer = soul[x][y]
			var job_stat = job_stats[x][y]
			
			result += job_stat + ": " + str(soul_integer) + "   "
		result += "\n"
	
	return result
