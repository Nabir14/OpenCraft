extends Node3D
class_name ChunkGenerator

signal chunk_generated

@export var voxel_generator : VoxelGenerator
@export var noise_texture : Noise
@export var size : Vector3
@export var height_ratio : float = 1.0

func generate() -> void:
	voxel_generator.generate_mesh(generate_chunk_data(size))
	voxel_generator.create_trimesh_collision()
	chunk_generated.emit()

func generate_chunk_data(chunk_size : Vector3) -> Dictionary:
	var data : Dictionary[Vector3, String]
	
	for x in range(-chunk_size.x, chunk_size.x):
		for z in range(-chunk_size.z, chunk_size.z):
			var value = noise_texture.get_noise_2d(x, z) * height_ratio
			var height = int(((value + 1.0) / 2.0) * chunk_size.y)
			for y in range(-chunk_size.y, height):
				data[Vector3(x, y, z)] = "Dummy"
	
	return data
