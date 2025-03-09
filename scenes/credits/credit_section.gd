extends VBoxContainer

@export var title: String
@export_multiline var content: String

func _ready() -> void:
	$Title.text = title
	$Content.text = content+"\n"
