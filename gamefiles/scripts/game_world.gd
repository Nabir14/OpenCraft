extends Node3D
class_name GameWorld

func _ready() -> void:
	print("[OpenCraft]")
	print("Game Version: "+OpenCraftGame.get_version())
	print("API Version: "+OpenCraftAPI.get_version())
	
	%game_version.text = "Game Version: "+OpenCraftGame.get_version()
	%api_version.text = "API Version: "+OpenCraftAPI.get_version()
	
	$ChunkSystem.generate_grid_chunk($GridMap, 8, 8)

func _process(_delta: float) -> void:
	%fps.text = "FPS: "+str(Engine.get_frames_per_second())
	%draw_calls.text = "Draw Calls: "+str(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
