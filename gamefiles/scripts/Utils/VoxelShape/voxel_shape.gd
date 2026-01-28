extends Resource
class_name VoxelShape

@export var vertices : PackedVector3Array
@export var normals : Dictionary[int, Vector3]
@export var indices : Dictionary[int, Array]
@export var face_index_array : Array

func _init(verts : PackedVector3Array, norms : Dictionary[int, Vector3], inds : Dictionary[int, Array], fia : Array) -> void:
	vertices = verts
	normals = norms
	indices = inds
	face_index_array = fia
