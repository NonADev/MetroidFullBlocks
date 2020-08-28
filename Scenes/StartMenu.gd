extends Control



func _on_StartGameButton_pressed():
	get_tree().change_scene("res://Scenes/Level01.tscn")


func _on_StopGameButton_pressed():
	get_tree().quit(200)
