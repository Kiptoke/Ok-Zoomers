extends Control

func _on_Button_button_down():
	print("press")
	self.visible = false
# warning-ignore:return_value_discarded
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_Restart_visibility_changed():
	$VBoxContainer/RichTextLabel.bbcode_text = "[center]You [color=red]crashed![/color]\nYour final score was:\n[/center]" + "[center][wave]" + str(GameVars.score) + "[/wave][/center]"

