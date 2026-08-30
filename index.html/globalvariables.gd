extends Node
var plrhealth = 100
var timer = 0.0
var Enemy = preload("res://Enemy/Enemy.tscn")
var Enemynumber = 0
var Goodguy =preload("res://GoodGuys.tscn")
var Goodnum = 0
var wave = 0
const window_size = Vector2(1152, 648)
var location = Vector2()
var timeout = 5
var direction = Input.get_vector("Left","Right","Up","Down")



var lose = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= timeout:
		spawnE()
		spawnG()
		timer=0.0
	if Globalvariables.plrhealth < 0:
		get_tree().change_scene_to_file('res://Lose.tscn')
		queue_free()


func spawnE():
		randomize()
		var x = 1
		location.x = randf_range(1, window_size.x)
		location.y = randf_range(1, window_size.y)
		var enemy = Enemy.instantiate()
		enemy.position = location
		add_child(enemy)
		enemy.set_as_top_level(true)#always visibles
		Enemynumber += 1
		print(Enemynumber)
		

func spawnG():
		randomize()
		var x = 1
		location.x = randf_range(1, window_size.x)
		location.y = randf_range(1, window_size.y)
		var guys = Goodguy.instantiate()
		guys.position = location
		add_child(guys)
		guys.set_as_top_level(true)#always visibles
		Goodnum += 1
		print(Enemynumber)
