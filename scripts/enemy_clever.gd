extends "res://scripts/enemy.gd"

const scn_laser = preload("res://scenes/laser_enemy.tscn")

export var enemy_shooting_rate = 1.5
var timer = enemy_shooting_rate


func _ready():
	randomize()
	var possible_movement = [velocity.x , -velocity.x]
	velocity.x = possible_movement[randi() % possible_movement.size()]
	
	
	
	
func _process(delta):
		timer += delta 
		if timer >= enemy_shooting_rate:
			shoot()
			timer = 0.0
		if get_position().x <= 0 + 16:
			velocity.x = abs(velocity.x)
		if get_position().x >= get_viewport_rect().size.x - 16:
			velocity.x = -abs(velocity.x)

func shoot():
	
	
		var laser = scn_laser.instance()
		laser.set_position(get_node("cannon").get_global_position())
		get_tree().get_root().call_deferred("add_child" , laser)
		
	
	
	
	
	
	
