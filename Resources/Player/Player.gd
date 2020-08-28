extends KinematicBody2D

onready var RESPAWN_POSITION = global_position
onready var sprite = $Sprite
const JUMP_HEIGHT = -600
const MAX_SPEED = 300
const ACCELERATION =  20
const FRICCION = 0.2
const GRAVITY = 25
const UP = Vector2(0, -1)
var motion = Vector2.ZERO
var state = MOVE

enum{
	MOVE
}


func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
	
	motion = move_and_slide(motion, UP)


func move_state(delta):
	if motion.y < 450:
		motion.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_respawn"):
		motion = Vector2.ZERO
		position = RESPAWN_POSITION
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION,MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION,-MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, FRICCION)
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		motion.x = lerp(motion.x, 0, 0.00001)

