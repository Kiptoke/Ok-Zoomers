extends Node2D

func _process(_delta):
	$CanvasLayer/Score.bbcode_text = "[b]Score[/b]: " + str(GameVars.score)
	GameVars.score += 1
