extends Node2D

var save = {
	"record":0,
	"fantasia":1,
	"teste":100,
}
var dataPath = "res://Save/save"

var score = 0

func _process(delta):
	if get_node("../Menu").get("morto") == false and get_tree().paused == false:
		score += 1


func record():
	if score > save.record:
		save.record = score
	get_node("../Menu/Record").text = String(str("seu record é: ", save.record))

func _ready():
	load_data()


# saves everyhing in the "save" variable
func save_data():
	var file = File.new()
	file.open(dataPath,file.WRITE_READ)
	file.store_var(save)
	file.close()
	
# and load
func load_data():
	var file = File.new()
	if not file.file_exists(dataPath):
		return false
	file.open(dataPath,file.READ)
	save = file.get_var()
	file.close()
	return true
