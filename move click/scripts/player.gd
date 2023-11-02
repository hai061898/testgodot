extends CharacterBody2D


var max_speed = 120
var speed = 0 
var accleration = 1200
var move_direction 
var moving = false
var destination = Vector2()
var movement = Vector2()


func _process(delta):
	AnimationLoop()
	

func _physics_process(delta):
	movementLoop(delta)


func _unhandled_input(event):
	if event.is_action_pressed("click"):
		moving = true
		destination = get_global_mouse_position()
	
func movementLoop(delta):
	if moving == false: 
		speed = 0 
	else: 
		speed += accleration * delta
		if speed > max_speed: 
			speed = max_speed
	movement = position.distance_to(destination)*speed
	move_direction = rad_to_deg(destination.angle_to_point(position))
	if position.distance_to(destination)> 5:
		velocity = position.direction_to(destination) * speed
		move_and_slide()
	else :
		moving = false

	
func AnimationLoop():
	
	var anim_direction = "d"
	var anim_mode = "idle"
	var animation 
	if move_direction <= 15 and move_direction >= -15: 
		anim_direction = "l"
	elif move_direction <= 60 and move_direction >= 15:
		anim_direction = "tl"	
	elif move_direction <= 120 and move_direction >= 60:
		anim_direction = "t"
	elif move_direction <= 165 and move_direction >= 120: 
		anim_direction = "tr"	
	elif move_direction >= -60 and move_direction <= -15:
		anim_direction = "dl"
	elif move_direction >= -120 and move_direction <= -60:#
		anim_direction = "d"	
	elif move_direction >= -165 and move_direction <= -120:#
		anim_direction = "dr"
	elif move_direction <= -165 and move_direction <= 165:
		anim_direction = "r"	
	
	
	if moving == false:
		anim_mode = "idle"
	elif  moving == true:
		anim_mode = "walk"
	animation = anim_mode + "_"+ anim_direction
	$AnimationPlayer.play(animation)
