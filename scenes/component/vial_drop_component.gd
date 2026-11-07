extends Node

@export_range(0, 1) var drop_pecent: float = 1
@export var health_component: Node
@export var vial_scene: PackedScene


func _ready():
	(health_component as HealthComponent).died.connect(on_died)

func on_died():
	if randf() > drop_pecent:
		return
	
	if vial_scene == null:
		return
	
	if not get_parent() is Node2D:
		return
	
	var spawn_pos = (get_parent() as Node2D).global_position
	var vial_instance = vial_scene.instantiate() as Node2D
	get_tree().current_scene.add_child(vial_instance)
	vial_instance.global_position = spawn_pos
