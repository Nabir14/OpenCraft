extends Node3D
class_name ChunkGenerator

@export var width : int = 8
@export var height : int = 8
@export var depth : int = 8
@export var noise : Noise

func _ready() -> void:
	if !noise:
		printerr("ChunkGenerator: Noise is required by generate_chunk_with_terrain() function but Not Provided!")
		return

func set_noise_offset(offset : Vector3):
	if !noise:
		return
	
	noise.set_offset(Vector3(offset.x * width, offset.y * height, offset.z * depth))

func generate_basic_chunk() -> void:
	for x in width:
		for y in height:
			for z in depth:
				if y == 0:
					OpenCraftBlockSystem.place_sblock(self, OpenCraftBlockSystem.BlockIDs.GRASS, -Vector3(x, y, z))
				else:
					OpenCraftBlockSystem.place_block(self, OpenCraftBlockSystem.BlockIDs.DIRT, -Vector3(x, y, z))

func generate_chunk_with_terrain(resize_multiplyer : float) -> void:
	if !noise:
		return
	
	for x in width:
		for z in depth:
			var value : float = noise.get_noise_2d(x, z)
			var ground : int = abs(resize_multiplyer*value)*height
			
			for y in range(-height, ground):
				if y == ground-1:
					OpenCraftBlockSystem.place_block(self, OpenCraftBlockSystem.BlockIDs.GRASS, Vector3(x, y, z))
				else:
					OpenCraftBlockSystem.place_block(self, OpenCraftBlockSystem.BlockIDs.DIRT, Vector3(x, y, z))

func set_pos(pos : Vector3) -> void:
	global_position = Vector3(pos.x * width, pos.y * height, pos.z * depth)
