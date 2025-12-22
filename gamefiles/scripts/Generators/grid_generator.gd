extends GridMap
class_name GridGenerator

@export var start_pos : Vector3 = Vector3.ZERO
@export var chunk_width : int = 8
@export var chunk_height : int = 8
@export var chunk_depth : int = 8
@export var chunk_noise : Noise

enum GridBlockIDs { NULL = 0, GRASS = 1, DIRT = 2 }

func set_start_pos(pos : Vector3) -> void:
	start_pos = Vector3(pos.x * chunk_width, pos.y * chunk_height, pos.z * chunk_depth)

func set_noise_offset(offset : Vector3):
	chunk_noise.set_offset(Vector3(offset.x * chunk_width, offset.y * chunk_height, offset.z * chunk_depth))

func generate_basic_chunk() -> void:
	for x in range(start_pos.x, chunk_width+start_pos.x):
		for y in range(start_pos.y, chunk_height+start_pos.y):
			for z in range(start_pos.z, chunk_depth+start_pos.z):
				if y == 0:
					place(GridBlockIDs.GRASS, -Vector3(x, y, z))
				else:
					place(GridBlockIDs.DIRT, -Vector3(x, y, z))

func generate_chunk_with_terrain(resize_multiplyer : float) -> void:
	for x in range(start_pos.x, chunk_width+start_pos.x):
		for z in range(start_pos.y, chunk_depth+start_pos.z):
			var value : float = chunk_noise.get_noise_2d(x, z)
			var ground : int = abs(resize_multiplyer * value) * chunk_height
			
			for y in range(-chunk_height, ground):
				if y == ground-1:
					place(GridBlockIDs.GRASS, Vector3(x, y, z))
				else:
					place(GridBlockIDs.DIRT, Vector3(x, y, z))

func place(block_id : int, pos : Vector3) -> void:
	set_cell_item(local_to_map(pos), block_id)
