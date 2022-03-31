extends Node


func _ready() -> void:
	$Gameboard.connect("open_character_menu", $UI, "_on_open_character_menu")
