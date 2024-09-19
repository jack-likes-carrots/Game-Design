extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
#pixels per second
@export var speed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress += speed * delta


func _on_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/death_lvl3.tscn")