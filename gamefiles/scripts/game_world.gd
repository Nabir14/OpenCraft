extends Node3D
class_name GameWorld

var draw_debug_wireframe : bool = false
var show_debug_info : bool = false

func _init() -> void:
	RenderingServer.set_debug_generate_wireframes(true)

func _ready() -> void:
	print("[OpenCraft]")
	print("Game Version: "+OpenCraftGame.get_version())
	print("API Version: "+OpenCraftAPI.get_version())
	
	%GameUI.update_ui_element("game_version", OpenCraftGame.get_version())
	%GameUI.update_ui_element("api_version", OpenCraftAPI.get_version())
	
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("DebugToggleWireframe"):
		draw_debug_wireframe = !draw_debug_wireframe
	elif event.is_action_pressed("DebugToggleUI"):
		show_debug_info = !show_debug_info

func _process(_delta: float) -> void:
	%GameUI.toggle_debug_info(show_debug_info)
	%GameUI.update_ui_element("fps", Engine.get_frames_per_second())
	%GameUI.update_ui_element("draw_calls", Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
	%GameUI.update_ui_element("triangle_count", Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME))
	
	if draw_debug_wireframe:
		get_viewport().debug_draw = Viewport.DEBUG_DRAW_WIREFRAME
	else:
		get_viewport().debug_draw = Viewport.DEBUG_DRAW_DISABLED
