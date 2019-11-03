extends Area2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var minWaitTime = 5.0
var maxWaitTime = 30.0
var is_disabled = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.set_deferred("disabled",true)
	_set_timer()
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass

func _on_Table_body_entered(body) -> void:
	print("Colidiu com ", body.name)
	print("is_disabled = ",is_disabled)
	if !is_disabled:
		if body.name.begins_with("Food") || body.name.begins_with("@Food"):
			print("Desabilitando mesa.")
			is_disabled = true
			print("is_disabled = ",is_disabled)
			body.queue_free()
			$CollisionShape2D.set_deferred("disabled",true)
			_set_timer()
	pass # Replace with function body.

func __ask_food() -> void:
	if is_disabled:
		print("Habilitando mesa.")
		$CollisionShape2D.set_deferred("disabled",false)
		is_disabled = false
		print("is_disabled = ",is_disabled)
	pass

func _set_timer() -> void:
	$Timer.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	$Timer.start()
	pass

func _on_Timer_timeout() -> void:
	__ask_food()
	pass # Replace with function body.
