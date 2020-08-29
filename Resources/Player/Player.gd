extends KinematicBody2D

onready var RESPAWN_POSITION = global_position
onready var sprite = $Sprite
onready var timer = $Timer
const JUMP_HEIGHT = -600
const MAX_SPEED = 300
const ACCELERATION =  20
const FRICCION = 0.2
const GRAVITY = 25
const UP = Vector2(0, -1)
var spell = preload("res://Resources/Props/Spell.tscn")
var motion = Vector2.ZERO
var state = MOVE
var spell_instance
var can_shoot = true

enum{
	MOVE
}


func teleport_player(to:Vector2, remove_motion=true):
	position = to
	if remove_motion:
		motion = Vector2.ZERO


func shoot_control():
	if spell_instance == null && Input.is_action_just_pressed("ui_shoot"):
		timer.start(0.7)
		can_shoot = false
		spell_instance = spell.instance()
		spell_instance.position = get_global_position()
		spell_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(spell_instance)
	elif can_shoot && spell_instance != null && Input.is_action_just_pressed("ui_shoot"):
		teleport_player(spell_instance.position)
		spell_instance.queue_free()


func _physics_process(delta):
	shoot_control()
	match state:
		MOVE:
			move_state(delta)


func move_state(delta):
	if motion.y < 450:
		motion.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_respawn"):
		motion = Vector2.ZERO
		teleport_player(RESPAWN_POSITION)
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
		
	motion = move_and_slide(motion, UP)


func _on_Timer_timeout():
	if spell_instance != null:
		spell_instance.sprite.modulate = Color(1.0,1.0,1.0)
		can_shoot = true
