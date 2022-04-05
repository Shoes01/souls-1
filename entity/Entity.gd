## Base Entity.
## 
## The base entity is a Node2D with a Transform - this goes a bit against ECS,
## but it's also simpler, so.
class_name Entity
extends Node2D


var _id: int = get_instance_id()
var _position: Vector2 = position # I kind of need a position component. But I think SpriteComponent would need to be a child of the PositionComponent for any of it to make sense.
# Or that changing PositionComponent would update the parent_node()'s position. Which is also kind of dumb.


func _ready() -> void:
	#print("Entity is ready. ID: ", _id)
	pass


func get_component(value: String) -> Node:
	for child in get_children():
		if child.name == value:
			return child
	
	print("Failed to get component ", value, ".")
	return null


func attach_component(component: Node) -> void:
	add_child(component)
