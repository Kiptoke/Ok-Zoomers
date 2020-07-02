extends KinematicBody2D

# Storing which line the player is on
# 1 - y = 100
# 2 - y = 300
# 3 - y = 500
# x is constant at 104

enum Line {TOP,MIDDLE,BOTTOM}
var line = Line.MIDDLE 

func moveLine(y):
	$Tween.interpolate_property(self, "position",
		get_position(), Vector2(104,y), 0.5, 
		Tween.TRANS_QUAD, Tween.EASE_OUT_IN)
		
	$Tween.start()
	
func updatePos(lineNum):
	
	if lineNum == Line.TOP:
		moveLine(100)
	elif lineNum == Line.MIDDLE:
		moveLine(300)
	elif lineNum == Line.BOTTOM:
		moveLine(500)

func _process(_delta):
	if Input.is_action_just_pressed("ui_up"):
		if line != Line.TOP:
			line -= 1
			print(line)
	elif Input.is_action_just_pressed("ui_down"):
		if line != Line.BOTTOM:
			line += 1
			print(line)
			
	updatePos(line)
