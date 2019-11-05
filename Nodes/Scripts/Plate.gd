extends RigidBody2D

var velocity = Vector2(0,0)
export(float) var PLATE_VELOCITY = 0.5

var is_tween_completed = true
var last_transition_velocity = PLATE_VELOCITY
func _ready() -> void:
	pass # Replace with function body.

func move_to_other_side(new_pos: Vector2) -> void:
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
