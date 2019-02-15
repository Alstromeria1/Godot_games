# script : ship

extends Area2D

const scn_laser = preload("res://scenes/laser_ship.tscn")
const scn_explosion = preload("res://scenes/Explosion.tscn")
const scn_flash = preload("res://scenes/flash.tscn")

export var armor = 4 setget set_armor 

func _ready():
	add_to_group("ship")
	yield(get_tree().create_timer(0.5), "timeout")
	shoot()
	
	
func _process(delta):
	
	# tracking mouse
	var motion = (get_global_mouse_position().x - get_position().x) * 0.1
	translate(Vector2(motion, 0))
	
	#clamping to view 
	
	var window_width = get_viewport_rect().size.x
	var player_width = $sprite.texture.get_width()
	var pos = get_position()
	pos.x = clamp(pos.x , 0+(player_width/2) , window_width - (player_width/2))
	set_position(pos)
	pass

func shoot() :
	
	while true :
		var pos_left = $cannons/left.get_global_position()
		var pos_right = get_node("cannons/right").get_global_position()
		create_laser(pos_left)
		create_laser(pos_right)
	
		yield(get_tree().create_timer( 0.25) , "timeout")
	
func set_armor(new_value):
	print (new_value)
	armor = new_value 
	if armor <= 0:
		create_explosion()
		queue_free()
	
func create_laser(pos):
	var laser = scn_laser.instance()
	laser.set_position(pos)
	get_tree().get_root().call_deferred("add_child" , laser)
	pass
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_position(get_position())
	get_tree().get_root().call_deferred("add_child" , explosion)
	
