extends Area2D



func _on_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/training_complete.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/Complete.tscn")
