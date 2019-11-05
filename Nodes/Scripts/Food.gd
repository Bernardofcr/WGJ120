extends RigidBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

const FOOD_TYPE = {1:"breakfast", 2:"burger", 3:"lunch", 4:"coffee"}
var food_type = FOOD_TYPE[1]
var for_table = 0

func _ready() -> void:
	mass = randi()%8+1
	pass # Replace with function body.

func apply_inertia_velocity(velocity: Vector2):
	self.velocity = velocity
	pass

func _on_Area2D_body_entered(body) -> void:
	if body.name == "TileMap":
		_set_timer()

	pass # Replace with function body.

func _set_timer() -> void:
	$Timer.set_wait_time(10)
	$Timer.start()
	pass

func _on_Timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
