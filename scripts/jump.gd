extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var jump_sound = AudioStreamPlayer.new()
		jump_sound.stream = load("res://Audio/jump-sound-14839.mp3")
		add_child(jump_sound)
		jump_sound.play()
