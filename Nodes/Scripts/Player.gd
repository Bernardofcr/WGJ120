extends KinematicBody2D

export(int) var SPEED = 40
export(int) var hp = 1
const GRAVITY = 10
const JUMP_FORCE = -250
const FLOOR = Vector2(0, -1)

var velocity = Vector2(0,0)
var on_ground = false
var is_attacking = false
var is_dead = false
var fireball_power = 1
var jump_count = 0
var tip_received = 0

func _ready() -> void:
	adjust_camera_limits()
	pass

func adjust_camera_limits() -> void:
	var tilemap_rect = get_parent().get_node("TileMap").get_used_rect()
	var tilemap_cell_size = get_parent().get_node("TileMap").cell_size
	$Camera2D.limit_left = tilemap_rect.position.x * tilemap_cell_size.x
	$Camera2D.limit_right = tilemap_rect.end.x * tilemap_cell_size.x
	$Camera2D.limit_top = tilemap_rect.position.y * tilemap_cell_size.y
	$Camera2D.limit_bottom = tilemap_rect.end.y * tilemap_cell_size.y
	pass

func _physics_process(delta: float) -> void:

	velocity.x = 0
	if !is_dead:
		if Input.is_action_pressed("ui_right"):
#			if !is_attacking or !is_on_floor():
			velocity.x += SPEED
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("run")
			if sign($Plate.position.x) == -1:
				var new_pos = Vector2(15, $Plate.position.y)
				$Plate.move_to_other_side(new_pos)

		elif Input.is_action_pressed("ui_left"):
#			if !is_attacking or !is_on_floor():
			velocity.x -= SPEED
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("run")
			if sign($Plate.position.x) == 1:
				var new_pos = Vector2(15 * -1, $Plate.position.y)
				$Plate.move_to_other_side(new_pos)

		elif Input.is_action_just_pressed("ui_focus_next"):
			get_tree().reload_current_scene()

		else:
			velocity.x = 0
			$AnimatedSprite.play("idle")

		if Input.is_action_pressed("ui_run"):
			SPEED = 70
			$Plate.change_plate_velocity(0.2)
			$AnimatedSprite.get_sprite_frames().set_animation_speed("run", 24.0)
		else:
			SPEED = 30
			$Plate.change_plate_velocity(0.5)
			$AnimatedSprite.get_sprite_frames().set_animation_speed("run", 12.0)

		velocity.y += GRAVITY

		move_and_slide(velocity, FLOOR)
	pass

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D2.set_deferred("disabled", true)
	$Timer.start()

func _on_AnimatedSprite_animation_finished() -> void:
	is_attacking = false
	pass # Replace with function body.

func get_tip() -> int:
	print("current tip = ", tip_received)
	return tip_received

func add_tip(value: int) -> void:
	tip_received += value
	pass

func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://Nodes/Scenes/TitleScreen.tscn")
	pass # Replace with function body.

func crown_power_up() -> void:
	fireball_power = 2
	pass
