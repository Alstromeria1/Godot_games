extends Area2D

export var velocity = Vector2()
var armor = 2 setget set_armor

const scn_explosion = preload("res://scenes/explosion.tscn")

func _ready():
	set_process(true)
	add_to_group( "enemy")
	connect ("area_entered" , self , "_on_area_enter")
	
	pass
func _process(delta):
	translate (velocity * delta)
	
	if get_position().y-16 >= get_viewport_rect().size.y:
		queue_free()
	
func set_armor(new_value):
	armor = new_value
	if armor <= 0 : 
		create_explosion()
		queue_free()
func _on_area_enter(other):
		if other.is_in_group("ship") :
			other.armor -= 2
			create_explosion()
			queue_free()
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_position(get_position())
	get_tree().get_root().call_deferred("add_child" , explosion)
	
	

