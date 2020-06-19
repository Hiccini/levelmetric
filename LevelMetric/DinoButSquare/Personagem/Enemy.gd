extends StaticBody2D

var velocity = 10
const scl = [0.3, 0.2, 0.17]
func _ready():
	scale = Vector2(scl[randi()%2], scl[randi()%2])
	


func _process(delta):
	var multiplicador = get_parent().get_node("../Timer").multiplicador
	velocity = 10 * multiplicador
	
	position.x += velocity*-1
	if position < Vector2(-400, 0):
		queue_free()
	
	
	





	

