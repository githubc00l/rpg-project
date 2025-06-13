extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO
@onready var animation_tree: AnimationTree = $AnimationTree

func _physics_process(_delta):
	if Input.is_action_pressed("ui_run"):
		velocity = direction * 180
		move_and_slide()
	else:
		velocity = direction * 100
		move_and_slide()
		

func _process(_delta):
	direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if direction != Vector2.ZERO:
		set_walking(true)
		update_blend_position()
	else:
		set_walking(false)
		
func set_walking(value):
	animation_tree["parameters/conditions/is_walking"] = value
	animation_tree["parameters/conditions/idle"] = not value

func update_blend_position():
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/walk/blend_position"] = direction
