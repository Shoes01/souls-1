extends Control


onready var body: Node = $Panel/VBoxContainer/Label2

var _state := "inactive" setget set_activity, get_activity


func open_menu(entity: Entity) -> void:
	set_activity("active")
	
	var text : String
	var job_name: String = entity.get_component("JobComponent").get_name()
	var soul: String = entity.get_component("SoulComponent").get_soul_string()
	
	text = job_name + "\n" + soul
	
	body.set_text(text)


func close_menu() -> void:
	set_activity("inactive")


func set_activity(value: String) -> void:
	_state = value
	match _state:
		"active": 	set_visible(true)
		"dormant": 	set_visible(true)
		"inactive": set_visible(false)


func get_activity() -> String:
	return _state
