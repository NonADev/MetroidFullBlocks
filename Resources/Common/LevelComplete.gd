extends Area2D

export(String, FILE, "*.tscn") var level
export(bool) var enabled = true

func _on_LevelComplete_body_entered(body):
	if enabled:
		get_tree().change_scene(level)
