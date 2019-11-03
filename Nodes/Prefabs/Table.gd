extends Area2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Table_body_entered(body) -> void:
	print("Colidiu com ", body.name)
	if body.name.begins_with("Food") || body.name.begins_with("@Food"):
		body.queue_free()
	pass # Replace with function body.
