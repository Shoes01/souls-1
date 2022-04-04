extends Control


onready var body: Node = $Panel/RichTextLabel


func open_menu(entity: Entity) -> void:
	var text : String
	
	var job_name: String = entity.get_component("JobComponent").get_name()
	var soul: String = entity.get_component("SoulComponent").get_soul_string()
	
	text = job_name + "\n" + soul
	
	body.set_text(text)
	
	set_visible(true)


func close_menu() -> void:
	set_visible(false)
