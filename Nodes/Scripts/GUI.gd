extends Control

onready var tip_counter = $Tip/Money

func _physics_process(delta: float) -> void:
	tip_counter.text = str(get_parent().get_parent().get_node("Player").get_tip())
	pass # Replace with function body.
