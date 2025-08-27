extends RigidBody2D
class_name Balle

var speed = 400
var direction = Vector2(0.1, 1).normalized()

func _ready():
	gravity_scale = 0  # pas d'effet de gravité

	# PhysicsMaterial pour rebond parfait et friction nulle
	var material = PhysicsMaterial.new()
	material.bounce = 1.0
	physics_material_override = material

	# Définir la vitesse initiale
	linear_velocity = direction * speed

func _integrate_forces(state):
	# Maintenir la vitesse constante
	linear_velocity = linear_velocity.normalized() * speed
