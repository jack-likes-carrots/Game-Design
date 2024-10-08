extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -750.0
#double jumping
var jump_count = 0
var max_jumps = 2



		
func jump():
	velocity.y = JUMP_VELOCITY

var start_position = Vector2(600, 250)

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if velocity.x > 1:
			anim.play("run")
		elif velocity.x == 0:
			anim.play("Idle")

	if is_on_floor():
		jump_count = 0
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
		jump_count += 1
		
	if Input.is_action_just_pressed("ui_accept"):
		AudioManager.play("res://Audio/jump-sound-14839.mp3")
		
	if not is_on_floor() and Input.is_action_just_pressed("ui_right"):
		anim.play("run_back")
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if velocity.x < 0:
		anim.play("run_back")
	

var normal_gravity = 200.0
var fast_drop_gravity = 500.0

func apply_fast_drop(delta: float) -> void:
	# Apply normal gravity when the player is not on the floor
	if not is_on_floor():
		velocity.y += normal_gravity * delta

	# Apply fast drop if "S" is pressed
	if Input.is_action_pressed("ui_down"):  # Make sure "ui_down" is mapped to "S"
		drop_faster(delta)

	# Use built-in velocity with move_and_slide
	move_and_slide()

# Function to make the player drop faster
func drop_faster(delta: float) -> void:
	velocity.y += fast_drop_gravity * delta
