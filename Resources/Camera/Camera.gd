extends Camera2D

onready var topPos = $Top
onready var bottomPos = $Bottom


func _ready():
	limit_top = topPos.global_position.y
	limit_left = topPos.global_position.x
	limit_bottom = bottomPos.global_position.y
	limit_right = bottomPos.global_position.x
