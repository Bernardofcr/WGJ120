extends RigidBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

enum FOOD_TYPE{
	BURGER = 1,
	COFFEE = 2,
	LUNCH = 3,
	BREAKFAST = 4
}
var food_type = FOOD_TYPE.LUNCH
var for_table = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mass = randi()%8+1
	food_type = rand_range(1,FOOD_TYPE.size())
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
#	velocity.y += GRAVITY
#	velocity = move_and_slide(velocity, FLOOR)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

#func _on_Food_body_entered(body) -> void:
#	print("Colidiu com %s", body.name)
#	pass # Replace with function body.

func apply_inertia_velocity(velocity: Vector2):
	self.velocity = velocity
	pass

func _on_Area2D_body_entered(body) -> void:
	if body.name == "TileMap":
		_set_timer()
#	if self.name != body.name:
#		print(self.name, " colidiu com ", body.name)

	pass # Replace with function body.

func _set_timer() -> void:
	$Timer.set_wait_time(10)
	$Timer.start()
	pass

func _on_Timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
