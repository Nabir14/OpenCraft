extends Node

enum BlockIDs { NULL = 0,GRASS = 1, DIRT = 2 }
var BlockScenePaths : Array = [
	"res://gamefiles/scenes/Blocks/null_block.tscn",
	"res://gamefiles/scenes/Blocks/grass_block.tscn",
	"res://gamefiles/scenes/Blocks/dirt_block.tscn"
]

func place_block(parent : ChunkGenerator, id : int, position : Vector3) -> void:
	var block : Node3D = null
	if id < 0 or id >= BlockScenePaths.size():
			block = load(BlockScenePaths[0]).instantiate()
			printerr("OpenCraftBlockSystem: Block ID Does Not Exist! Spawning Null Block.")
	else:
			block = load(BlockScenePaths[id]).instantiate()
	parent.add_child(block)
	block.global_position = position
