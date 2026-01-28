extends MeshInstance3D
class_name VoxelGenerator

@export var shape : VoxelShape
@export var material : Material

func generate_data_2d(noise : Noise, max_size : Vector3, min_threshold : float) ->  Dictionary[Vector3, String]:
	var data : Dictionary[Vector3, String]
	
	for x in range(-max_size.x, max_size.x):
		for y in range(-max_size.x, max_size.y):
			var value : float = noise.get_noise_2d(x, y)
			if value > min_threshold:
				data[Vector3(x, 0 ,y)] = "Dummy"
	
	return data

func generate_data_3d(noise : Noise, max_size : Vector3, min_threshold : float) -> Dictionary[Vector3, String]:
	var data : Dictionary[Vector3, String]
	
	for x in range(-max_size.x, max_size.x):
		for y in range(-max_size.x, max_size.y):
			for z in range(-max_size.x, max_size.z):
				var value : float = noise.get_noise_3d(x, y, z)
				if value > min_threshold:
					data[Vector3(x, y ,z)] = "Dummy"
	
	return data

func generate_mesh(data : Dictionary[Vector3, String]) -> void:
	var vertices : PackedVector3Array
	var normals : PackedVector3Array
	
	for pos in data:
		var voxel_data : Dictionary[String, Array] = add_voxel(data, pos)
		for vertex in voxel_data.vertices:
			vertices.append(vertex)
		for normal in voxel_data.normals:
			normals.append(normal)
	
	generate_draw_call(vertices, normals)

func add_voxel(data : Dictionary[Vector3, String], pos: Vector3) -> Dictionary[String, Array]:
	var vertices : Array[Vector3]
	var normals : Array[Vector3]
	
	for face in shape.face_index_array:
		if !has_neighbour(data, face, pos):
			var indices = shape.indices[face]
			for triangle in indices:
				for index in triangle:
					vertices.append(shape.vertices[index] + pos)
					normals.append(shape.normals[face])
	
	return { "vertices": vertices, "normals": normals }

func has_neighbour(data : Dictionary[Vector3, String], face_index : int, voxel_position : Vector3):
	var neighbour_position = shape.normals[face_index] + voxel_position
	if data.has(neighbour_position):
		return true
	else:
		return false

func generate_draw_call(verts : PackedVector3Array, normals : PackedVector3Array) -> void:
	var surface_array : Array= []
	surface_array.resize(Mesh.ARRAY_MAX)

	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_NORMAL] = normals
	
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
	set_surface_override_material(0, material)
