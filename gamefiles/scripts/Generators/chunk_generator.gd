extends Node3D
class_name ChunkGenerator

@export var voxel_generator : VoxelGenerator
@export var noise : Noise
@export var size : Vector3
@export var ratio : float

func _ready() -> void:
	var data : Dictionary[Vector3, String] = voxel_generator.generate_data_3d(noise, size, ratio)
	voxel_generator.generate_mesh(data)
	voxel_generator.create_trimesh_collision()
