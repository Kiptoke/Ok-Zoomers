extends KinematicBody2D

enum Line {TOP,MIDDLE,BOTTOM}
var speed = 500
var velocity = Vector2(-speed,0)

func init(line, newspeed):
	position.x = 1150
	
	if line == Line.TOP:
		position.y = 100
	elif line == Line.MIDDLE:
		position.y = 300
	elif line == Line.BOTTOM:
		position.y = 500
		
	velocity = Vector2(-newspeed,0)
	
func _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == "Player":
			Sounds.get_node("Explosion").play()
			print("I collided with ", collision.collider.name)
			get_tree().paused = true
			get_node("/root/Level/CanvasLayer/Restart").visible = true
