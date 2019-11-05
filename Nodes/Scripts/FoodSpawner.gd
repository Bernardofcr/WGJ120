extends Position2D

onready var FOOD = preload("res://Nodes/Prefabs/Food.tscn")

export (float) var minWaitTime = 5
export (float) var maxWaitTime = 10

func _ready() -> void:
	pass # Replace with function body.

func prepare_food(table_number: int, food_number) -> void:
	yield(get_tree().create_timer(rand_range(minWaitTime, maxWaitTime)), "timeout")
	var new_food = FOOD.instance()
	new_food.food_type = new_food.FOOD_TYPE[food_number]
	new_food.for_table = table_number
	get_parent().add_child(new_food)
	new_food.position = self.global_position
#	print("Prato ", new_food.name, " para a mesa ", new_food.for_table)
	pass