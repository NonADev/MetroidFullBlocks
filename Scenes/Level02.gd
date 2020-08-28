extends Node2D

onready var animatedSprite = $HUD/AnimatedSprite
onready var animatedSprite2 = $HUD/AnimatedSprite2


func _on_LevelComplete_body_entered(body):
	animatedSprite.visible = true
	animatedSprite2.visible = true
