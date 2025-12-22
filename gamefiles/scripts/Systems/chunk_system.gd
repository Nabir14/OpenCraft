extends Node3D
class_name  ChunkSystem

func generate_grid_chunk(chunk_generator : GridGenerator, width : int, depth : int):
	for x in range(0, width):
		for z in range(0, depth):
			chunk_generator.set_start_pos(Vector3(x, 0, z))
			chunk_generator.set_noise_offset(Vector3(x, z, 0))
			chunk_generator.generate_chunk_with_terrain(10.0)
