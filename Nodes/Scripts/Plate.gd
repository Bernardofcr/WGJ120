extends RigidBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var velocity = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
#	print("velocity = ", velocity)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:

func move_to_other_side(new_pos: Vector2, transition_velocity) -> void:
	$Tween.interpolate_property(self, "position",
        Vector2(self.position.x, self.position.y), new_pos, transition_velocity,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	pass
