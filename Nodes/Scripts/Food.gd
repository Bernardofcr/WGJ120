extends RigidBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mass = randi()%8+1
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
	if self.name != body.name:
		if body.name == "Plate":
			apply_inertia_velocity(body.velocity)
		elif body.name.match("Food"):
			body.apply_inertia_velocity(velocity*1.1)
		print(self.name, " colidiu com ", body.name)
	pass # Replace with function body.