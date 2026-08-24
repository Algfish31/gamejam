extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var speed = 100
var death = false
var atkdamage = 1
var alert: bool = false
var player_detected = false
var health = 2

@onready var player: CharacterBody2D = $'.'

func _ready() -> void:
	set_as_top_level(true)#always visibles
	#This is a just in case
	death = false

func _process(_delta: float) -> void:
	$Enemyhealth.text = str(health)#diplay health
	if death == false :# if alive
		$Vision/CollisionShape2D.disabled = false#player detection is on
		if player_detected:
			position += (player.position-position) / speed # go to player
		else:
			pass#replace with idle anim
			if death == true:
				$Vision/CollisionShape2D.disabled = true #player detection is off
				if alert == true :
					changedirection()

func changedirection() -> void:
	if position.x - player.position.x < 0:
		sprite.flip_h = true
	elif position.x - player.position.x > 0:
		sprite.flip_h = false
		print(sprite.flip_h)
		
	
	if Globalvariables.plrhealth < 0:
		queue_free()
	if health < 0.1 :
		dead()

func dead():
	death = true 
	$AnimatedSprite2D.play("Death")
	await get_tree().create_timer(0.2).timeout
	queue_free()


func _on_vision_body_entered(body: Node2D) -> void:
	#aggro range detection
	if body.has_method("player"):
		player_detected = true
		player = body
		alert = true
		

func _on_vision_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_detected = false
		alert = false
