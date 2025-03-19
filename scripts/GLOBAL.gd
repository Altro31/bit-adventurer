extends Node

var score: int = 0
var progress: int = 0

func _ready() -> void:
	var data = get_config_data()
	score = int(data.get_value("data","score",0))
	progress = int(data.get_value("data","progress",0))

func get_config_data():
	var data = ConfigFile.new()
	data.load("res://data.cfg")
	return data
	
func save_config_data():
	var data = ConfigFile.new()
	data.set_value("data","score",score)
	data.set_value("data","progress",progress)
	data.save("res://data.cfg")
