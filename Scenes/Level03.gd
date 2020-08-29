extends Node2D

onready var player = $World/Player
onready var animatedSprite = $HUD/EndGame/AnimatedSprite
onready var animatedSprite2 = $HUD/EndGame/AnimatedSprite2
onready var label = $HUD/EndGame/CenterContainer/Label


func _process(delta):
	if player.position.y > 700:
		player.teleport_player(player.RESPAWN_POSITION)


func _on_LevelComplete_body_entered(body):
	animatedSprite.visible = true
	animatedSprite2.visible = true
	label.visible = true
