extends Node

@export var blocks: Vector2i = Vector2i(4, 4)
@export var block_size: float = 22.0
@export var street_width: float = 11.0
@export var min_height: float = 6.0
@export var max_height: float = 20.0
@export var seed_value: int = 12345


func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = seed_value

	var pitch: float = block_size + street_width
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(0.6, 0.61, 0.63)
	mat.roughness = 0.9

	for x in blocks.x:
		for z in blocks.y:
			var h: float = rng.randf_range(min_height, max_height)
			var w: float = block_size * rng.randf_range(0.7, 0.95)
			var d: float = block_size * rng.randf_range(0.7, 0.95)
			var pos := Vector3(
				(x - blocks.x * 0.5 + 0.5) * pitch,
				h * 0.5,
				(z - blocks.y * 0.5 + 0.5) * pitch
			)
			_add_box(pos, Vector3(w, h, d), mat)


func _add_box(pos: Vector3, size: Vector3, mat: Material) -> void:
	var body := StaticBody3D.new()
	body.position = pos

	var box := BoxShape3D.new()
	box.size = size
	var col := CollisionShape3D.new()
	col.shape = box

	var mesh := BoxMesh.new()
	mesh.size = size
	mesh.material = mat
	var mi := MeshInstance3D.new()
	mi.mesh = mesh

	body.add_child(col)
	body.add_child(mi)
	add_child(body)
