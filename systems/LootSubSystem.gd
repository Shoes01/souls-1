# This sub system takes loot-data adn returned loot-entities.
class_name LootSubSystem
extends Resource


func generate_soul(soul_component: SoulComponent) -> Entity:
	# Create new entity.
	var entity : Entity = load("res://entity/Entity.gd").new()
	
	# Add components.
	## Position component is part of the entity...
	
	## Add Sprite component.
	var sprite_component: Node = load("res://components/SpriteComponent.gd").new()
	var sprite_texture: Texture = load("res://assets/SoulItem.png")
	sprite_component.set_texture(sprite_texture)
	entity.attach_component(sprite_component)
	
	## Add Item component.
	var item_component: Node = load("res://components/ItemComponent.gd").new()
	item_component.is_consumable = true
	entity.attach_component(item_component)
	
	## Add Soul component.
	entity.attach_component(soul_component)
	
	# Set name.
	var name: String = "Soul Jar (" + str(soul_component.get_soul_sum()) + ")"
	entity.set_name(name)
	
	return entity
