extends Node
var plrhealth = 10
var timer = 0.0
var Enemy = preload("res://Enemy/Enemy.tscn")
var Enemynumber = 0
var wave = 0
const window_size = Vector2(1152, 648)
var location = Vector2()
var timeout = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= timeout:
		spawn()
		timer=0.0


func spawn():
		await get_tree().create_timer(5).timeout
		randomize()
		var x = 1
		location.x = randf_range(1, window_size.x)
		location.y = randf_range(1, window_size.y)
		var enemy = Enemy.instantiate()
		enemy.position = location
		enemy.set_as_top_level(true)
		add_child(enemy)
		Enemynumber += 1
		print(Enemynumber)
		
