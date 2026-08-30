extends Area2D


var projectile_speed = 300
func _ready() -> void:
	set_as_top_level(true)#always visible



func _process(delta: float) -> void:
	position += (Vector2.RIGHT*projectile_speed).rotated(rotation) * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()#delete if off screen

func projectileDealDamage():
	pass





func _on_body_entered(body: Node2D) -> void:
	if body.has_method("takeDamage"):
		queue_free()
