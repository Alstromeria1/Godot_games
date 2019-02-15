

extends "res://scripts/laser.gd"



	

	
func _on_area_enter(other):
	if other.is_in_group("enemy"):
		other.armor -= 1
		create_flare()
		queue_free()
	
	
	pass
