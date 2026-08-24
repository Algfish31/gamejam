extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	#for some reason its very fussy with the order that you code the inputs in so keep it the same
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction*SPEED
	Vision(direction)
	move_and_slide()
	

func Vision(dir):
	if dir.y == -1:
		$Polyup.visible = false
		$Polydown.visible = true
		$Polyleft.visible = true
		$Polyright.visible = true
		print("Animated sprite .play north walk")
	if dir.y == 1:
		$Polyup.visible = true
		$Polydown.visible = false
		$Polyleft.visible = true
		$Polyright.visible = true
		print("Animated sprite .play down walk")
	if dir.x == 1:
		$Polyup.visible = true
		$Polydown.visible = true
		$Polyleft.visible = true
		$Polyright.visible = false
		print("Animated sprite .play right walk")
	if dir.x == -1:
		$Polyup.visible = true
		$Polydown.visible = true
		$Polyleft.visible = false
		$Polyright.visible = true
		print("Animated sprite .play left walk")
		
func player():
	pass
