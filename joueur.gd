extends CharacterBody2D
class_name Joueur

var speed = 500
var acceleration = 1000
var deceleration = 650

func get_input(delta):
	var input_direction = Input.get_vector("gauche", "droite", "haut", "bas")
	var target_velocity = input_direction * speed
	

	if input_direction != Vector2.ZERO:
		velocity.x = move_toward(velocity.x, target_velocity.x, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, deceleration * delta)
		velocity.y = 0
		
func _physics_process(delta):
	var initial_y = position.y
	get_input(delta)
	move_and_slide()
	position.y = initial_y 
