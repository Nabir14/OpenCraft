extends VoxelShape
class_name CubeVoxel

enum Face{BOTTOM, FRONT, RIGHT, TOP, LEFT, BACK}

func _init() -> void:
	face_index_array =  [0, 1, 2, 3, 4, 5]
	
	vertices = [
		Vector3(-0.5, -0.5, 0.5),
		Vector3(0.5, -0.5, 0.5),
		Vector3(0.5, -0.5, -0.5),
		Vector3(-0.5, -0.5, -0.5),
		Vector3(-0.5, 0.5, 0.5),
		Vector3(0.5, 0.5, 0.5),
		Vector3(0.5, 0.5, -0.5),
		Vector3(-0.5, 0.5, -0.5)
	]

	indices = {
		Face.FRONT: [[0, 4, 5],[0, 5, 1]],
		Face.BACK: [[2, 7, 3],[2, 6, 7]],
		Face.LEFT: [[3, 7, 4],[3, 4, 0]],
		Face.RIGHT: [[1, 5, 6],[1, 6, 2]],
		Face.BOTTOM: [[0, 1, 2],[0, 2, 3]],
		Face.TOP: [[4, 7, 6],[4, 6, 5]]
	}

	normals = {
		Face.FRONT: Vector3(0, 0, 1),
		Face.BACK: Vector3(0, 0, -1),
		Face.LEFT: Vector3(-1, 0, 0),
		Face.RIGHT: Vector3(1, 0, 0),
		Face.BOTTOM: Vector3(0, -1, 0),
		Face.TOP: Vector3(0, 1, 0)
	}
