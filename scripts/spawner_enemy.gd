#script: spawner_enemy


extends Node


const enemies = [
	preload("res://scenes/enemy_kamikaze.tscn"),
	preload("res://scenes/enemy_clever.tscn")
]

func _ready():
	spawn()
	pass

func spawn():
	
	while true:
		randomize()
		var enemy = enemies[randi()%enemies.size()].instance()
		var pos = Vector2()
		pos.x = rand_range(0+16 , get_viewport().get_visible_rect().size.x -16)
		pos.y = 0-16
		enemy.set_position(pos)
		get_node("container").add_child(enemy)
		
		yield(get_tree().create_timer(rand_range(0.4 , 1)), "timeout")
		
		pass
