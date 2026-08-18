extends Node3D

func _ready() -> void:
	var vehicle = Vehicle.create(PlayerController.new())
	add_child(vehicle)
