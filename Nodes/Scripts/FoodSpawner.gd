extends Position2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var FOOD = preload("res://Nodes/Prefabs/Food.tscn")

export (float) var minWaitTime = 5
export (float) var maxWaitTime = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func prepare_food(table_number: int) -> void:
	yield(get_tree().create_timer(rand_range(minWaitTime, maxWaitTime)), "timeout")
	var new_food = FOOD.instance()
	get_parent().add_child(new_food)
	new_food.for_table = table_number
	new_food.position = self.global_position
	print("Prato ", new_food.name, " para a mesa ", new_food.for_table)
	pass