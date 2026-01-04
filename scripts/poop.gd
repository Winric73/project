extends CharacterBody2D

const speed = 0
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()
	start_pos = position
	$AnimatedSprite2D.play("poop")
	
func _process(delta: float) -> void:
	if current_state == 0 or current_state == 1:
		$AnimatedSprite2D.play("poop")
	elif current_state == 2 and !is_chatting:
		if dir.x == -1:
			$AnimatedSprite2D.play("poop")#west
		if dir.x == 1:
			$AnimatedSprite2D.play("poop")#east
		if dir.y == -1:
			$AnimatedSprite2D.play("poop")#north
		if dir.y == 1:
			$AnimatedSprite2D.play("poop")#south			
