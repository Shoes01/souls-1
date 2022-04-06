class_name MovementSystem
extends Node


signal begin_combat(attacker, defender, is_attack)

var grid: Resource = preload("res://board/Grid.tres")


func _on_entity_moved(entity: Entity, direction: Vector2, walls: Array) -> void:
	# I am cheating my using walls, as the walls should really all be entities with some ObstacleComponent or something.
	var entity_cell = grid.calculate_grid_coordinates(entity.position)
	var target_cell = entity_cell + direction
	
	var valid_cell := true
	if not grid.is_within_bounds(target_cell):
		valid_cell = false
	
	if target_cell in walls:
		valid_cell = false
	
	for soul_entity in get_tree().get_nodes_in_group("soul"): # until a "position" component gets figured out.
		var soul_cell = grid.calculate_grid_coordinates(soul_entity.position)
		if target_cell == soul_cell:
			valid_cell = false
			emit_signal("begin_combat", entity, soul_entity, true)
	
	if target_cell in walls:
		valid_cell = false
	
	if valid_cell:
		entity.position += direction * grid.cell_size.x
