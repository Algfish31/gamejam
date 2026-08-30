extends CharacterBody2D
var projectile_cooldown = true
var projectile = preload("res://projectile.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	#for some reason its very fussy with the order that you code the inputs in so keep it the same
	var Direction = Globalvariables.direction
	Direction = Input.get_vector("Left","Right","Up","Down")
	velocity = Direction*SPEED
	Vision(Direction)
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	$"../ui/Plrhealth".text = str(Globalvariables.plrhealth)
	if Input.is_action_just_pressed("Left_click") and projectile_cooldown:
		projectile_cooldown = false
		var projectile_instance = projectile.instantiate()
		projectile_instance.rotation = $Marker2D.rotation
		projectile_instance.global_position = $Marker2D.global_position
		add_child(projectile_instance)
		await get_tree().create_timer(0.5).timeout
		projectile_cooldown = true
		
	move_and_slide()
	
func Vision(dir):
	if dir.y == -1:
		$Polyup.visible = false
		$Polydown.visible = true
		$Polyleft.visible = true
		$Polyright.visible = true
		
		#print("Animated sprite .play north walk")
	if dir.y == 1:
		$Polyup.visible = true
		$Polydown.visible = false
		$Polyleft.visible = true
		$Polyright.visible = true
		#print("Animated sprite .play down walk")
	if dir.x == 1:
		$Polyup.visible = true
		$Polydown.visible = true
		$Polyleft.visible = true
		$Polyright.visible = false
		#print("Animated sprite .play right walk")
	if dir.x == -1:
		$Polyup.visible = true
		$Polydown.visible = true
		$Polyleft.visible = false
		$Polyright.visible = true
		#print("Animated sprite .play left walk")


func Player():
	pass
