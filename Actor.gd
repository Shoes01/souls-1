class_name Actor
extends Node

export var hp := 0
export var speed := 0
export var defense := 0
export var attack := 0
export var magic := 0
export var resistance := 0

func die() -> void:
	print("This unit is dead.")
	queue_free()
