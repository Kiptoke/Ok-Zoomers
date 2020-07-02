extends Position2D

var rng = RandomNumberGenerator.new()
var Asteroid = preload("res://Scenes/Asteroid.tscn")

var speed = 500
var timespeedup = 0.1

func _on_Timer_timeout():
	
	rng.randomize()
	var time = rng.randf_range(1.0,3.0) - timespeedup
	print("new wait time = ", str(time), " ", str(timespeedup))
	$Timer.wait_time = time

	var ast = Asteroid.instance()
	rng.randomize()
	var lane = rng.randi_range(0,2)
	print("asteroid spawned in lane ", str(lane), " ", str(speed))
	ast.init(lane, speed)
	get_parent().add_child(ast)
	
	if(speed < 1200):
		speed += 50
	if(timespeedup < 1):
		timespeedup += 0.05
