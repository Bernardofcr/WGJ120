extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

const POPUP_TIME = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	_set_timer()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _show_popup() -> void:
	self.show()
	_set_timer()
	pass

func _set_timer() -> void:
	$Timer.set_wait_time(POPUP_TIME)
	$Timer.start()
	pass

func _on_Timer_timeout() -> void:
	self.hide()
	pass # Replace with function body.
