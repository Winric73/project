extends CharacterBody2D

#var enemy_inattack_range = false
#var enemy_attack_cooldown = true
var health = 100
var player_alive = true

#var attack_ip = false

const speed = 100
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta: float) -> void:
	player_movement(delta) 
#	enemy_attack()
	
	if health <= 0:
		player_alive = false #add respawn or whatever
		health = 0
		print("You died numb nuts")
		self.queue_free()

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed # x and speed for right 
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed # x and -speed for left
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed # changed to Y because its backwards, speed
		velocity.x = 0	
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed # changed to Y because its backwards, -speed
		velocity.x = 0	#flipped X & Y
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_idle")

	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("front_idle")

			
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_idle")

	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_idle")
			
func player():
	pass
