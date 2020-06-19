extends KinematicBody2D

const jump_power = -1000


var gravity = 50
var velocity = Vector2()
var count = 0

func _ready():
	position.y = 417

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down"):
		gravity = 200
	elif Input.is_action_just_released("ui_down"):
		gravity = 50
	elif Input.is_action_pressed("ui_up") and position.y >= 417:
		gravity = 50
		jump()
	
	velocity.y += gravity
	
	if !position.y >= 417:
			get_node("../../CPUParticles2D/Ground_particles").set_emitting(false)
	else:
		get_node("../../CPUParticles2D/Ground_particles").set_emitting(true)
	
	move_and_slide(velocity)

func jump():
	velocity.y = jump_power
	
	


func _on_Area2D_area_entered(area):
	var menu = get_node("../../Menu")
	menu.morto = true
	get_node("../../Menu/Pause").text = "você morreu"
	get_node("../../SaveSystem").record()
	get_node("../../SaveSystem").save_data()
	menu.pause_game()
	
	
