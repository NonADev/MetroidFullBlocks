extends RigidBody2D

onready var player = get_parent().get_node("Player")
onready var sprite = $Sprite
var projectile_speed = 400


func _ready():
	apply_impulse(Vector2(), Vector2(projectile_speed, 0).rotated(rotation))


func _on_Collision_body_shape_entered(body_id, body, body_shape, area_shape):
	queue_free()
