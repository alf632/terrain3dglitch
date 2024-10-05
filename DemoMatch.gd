extends Node3D

@onready var map = $Map

# Called when the node enters the scene tree for the first time.
func _ready():
	var tank = find_child("Tank")
	tank.movement_domain = Constants.Match.Navigation.Domain.TERRAIN
	tank.add_to_group("controlled_units")
	map.find_child("Terrain3D").set_camera(find_child("Unit").find_child("Camera3D"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
