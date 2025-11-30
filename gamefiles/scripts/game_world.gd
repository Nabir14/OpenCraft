extends Node3D
class_name GameWorld

func _ready() -> void:
	print("[OpenCraft]")
	print("Game Version: "+OpenCraftGame.get_version())
	print("API Version: "+OpenCraftAPI.get_version())
	
	%game_version.text = "Game Version: "+OpenCraftGame.get_version()
	%api_version.text = "API Version: "+OpenCraftAPI.get_version()
