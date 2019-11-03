extends Position2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var FOOD = preload("res://Nodes/Prefabs/Food.tscn")

export (float) var minWaitTime = 5
export (float) var maxWaitTime = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() # Toda vez que o jogo começar ela vai começar num tempo diferente
	$Timer.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	$Timer.start()
	pass # Replace with function body.


func _on_Timer_timeout() -> void:
	var new_food = FOOD.instance()
	new_food.name.erase(0,1)
	get_parent().add_child(new_food)
	new_food.position = self.global_position

	$Timer.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	$Timer.start()
	pass # Replace with function body.
