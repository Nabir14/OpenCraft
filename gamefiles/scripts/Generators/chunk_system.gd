extends Node3D
class_name  ChunkSystem

@export var chunk_generator : ChunkGenerator
@export var width : int = 2
@export var depth : int = 2

func _ready() -> void:
	if !chunk_generator:
		printerr("ChunkSystem: Chunk Generator Is Required But Not Provided")
		return
		
	for x in range(0, width):
		for z in range(0, depth):
			chunk_generator.set_pos(Vector3(x, 0, z))
			chunk_generator.set_noise_offset(Vector3(x, z, 0))
			chunk_generator.generate_chunk_with_terrain(10.0)
