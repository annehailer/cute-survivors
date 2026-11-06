extends Camera2D

var cam_delay: float = 5

var target_position = Vector2.ZERO

func _ready() -> void:
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * cam_delay))


func set_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D
		target_position = player.global_position
