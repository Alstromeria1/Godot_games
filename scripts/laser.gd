extends Area2D



export var velocity = Vector2()
const scn_flare = preload("res://scenes/flare.tscn")




func _ready():
	set_process(true)
	create_flare()
	connect("area_entered" , self , "_on_area_enter")
	yield(get_node("vis_notifier"), "screen_exited")
	queue_free()
	pass

func _process(delta):
		translate(velocity * delta)
		

		pass

func create_flare():
		var flare = scn_flare.instance()
		flare.set_position(get_position())
		get_tree().get_root().call_deferred( "add_child" , flare)
		pass
