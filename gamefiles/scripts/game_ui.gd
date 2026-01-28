extends CanvasLayer
class_name GameUI

func toggle_debug_info(state : bool) -> void:
	%debug_ui.visible = state

func update_ui_element(alias : String, value : Variant):
	match alias:
		"title":
			%title.text = str(value)
		"game_version":
			%game_version.text = "Game Version: "+str(value)
		"api_version":
			%api_version.text = "API Version: "+str(value)
		"fps":
			%fps.text = "FPS: "+str(value)
		"draw_calls":
			%draw_calls.text = "Draw Calls: "+str(value)
		"triangle_count":
			%triangle_count.text = "Triangle Count: "+str(value)
	
