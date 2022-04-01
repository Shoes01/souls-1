extends Control


onready var body: Node = $Panel/RichTextLabel


func open_menu(actor: Actor) -> void:
	var text : String
	
	var job_name: String = actor.job.get_name()
	var soul: String = actor.soul.get_soul_string()
	
	text = job_name + "\n" + soul
	
	body.set_text(text)
	
	set_visible(true)


func close_menu() -> void:
	set_visible(false)
