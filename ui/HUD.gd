extends Control


func _ready() -> void:
	_on_HUD_updated()


func _on_HUD_updated() -> void:
	var text: String
	
	for child in get_tree().get_nodes_in_group("pc"):
		# there is only one.
		text = child.get_component("SoulComponent").get_soul_string()
	
	$Panel/HBoxContainer/Body.set_text(text)
