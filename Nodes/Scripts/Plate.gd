extends RigidBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var velocity = Vector2(0,0)
export(float) var PLATE_VELOCITY = 0.5
# Called when the node enters the scene tree for the first time.
var is_tween_completed = true
var last_transition_velocity = PLATE_VELOCITY
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
#	print("velocity = ", velocity)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:

func move_to_other_side(new_pos: Vector2) -> void:
#	if is_tween_completed:
	if last_transition_velocity == PLATE_VELOCITY:
		$Tween.interpolate_property(self, "position",
		    Vector2(self.position.x, self.position.y), new_pos, PLATE_VELOCITY,
		    Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		last_transition_velocity = PLATE_VELOCITY
	pass

func change_plate_velocity(new_velocity: float) -> void:
	PLATE_VELOCITY = new_velocity
	pass


func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	last_transition_velocity = PLATE_VELOCITY
	pass # Replace with function body.
