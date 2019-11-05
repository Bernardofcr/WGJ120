extends Area2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var minWaitTime = 5.0
var maxWaitTime = 10.0
# Called when the node enters the scene tree for the first time.
var is_asking = false
var TABLE_NUMBER = 1

func _ready() -> void:
	TABLE_NUMBER = self.name.ord_at(5) - 48
#	print("Mesa de número: ", TABLE_NUMBER)
	$CollisionShape2D.set_deferred("disabled",true)
	_set_timer()
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass

func _on_Table_body_entered(body) -> void:
	#if body.name.begins_with("@Food") and body.for_table == self.name.ord_at(5) - 48: #48 is ASCII code for start numbers
	if (body.name.begins_with("Food") or body.name.begins_with("@Food")) and body.for_table == TABLE_NUMBER:
		print("Comida entregue!")
		body.queue_free()
		$CollisionShape2D.set_deferred("disabled",true)
		$PopupTable.hide()
		_set_timer()

	if body.name == "Player" and is_asking:
		get_parent().get_node("FoodSpawner").prepare_food(TABLE_NUMBER)
		is_asking = false
	pass # Replace with function body.

func __ask_food() -> void:
	is_asking = true
	$PopupTable.show()
	$CollisionShape2D.set_deferred("disabled",false)
	pass



func _set_timer() -> void:
	$Timer.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	$Timer.start()
	pass

func _on_Timer_timeout() -> void:
	__ask_food()
	pass # Replace with function body.
