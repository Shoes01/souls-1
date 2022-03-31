extends Control


onready var body = $Panel/RichTextLabel


func open_menu(actor: Actor) -> void:
	var text : String
	
	text = actor.job.get_name()
	
	body.set_text(text)
	
	set_visible(true)


func close_menu() -> void:
	set_visible(false)
