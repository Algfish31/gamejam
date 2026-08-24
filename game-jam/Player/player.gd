extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	#for some reason its very fussy with the order that you code the inputs in so keep it the same
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down")* SPEED
	move_and_slide()


func player():
	pass
