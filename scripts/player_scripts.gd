extends CharacterBody2D

var rocket_scene = preload("res://scenes/rocket.tscn")

var rocket_container

func _ready():
	rocket_container = get_node("RocketContainer")

func _physics_process(delta):
	
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var speed = 400
	velocity = Vector2(0,0)
	
	
	if up:
		velocity.y = -speed
	
	if down:
		velocity.y = speed
	
	if left:
		velocity.x = -speed
		
	if right:
		velocity.x = speed
	move_and_slide()
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)



func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		_shoot()


func _shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 60
