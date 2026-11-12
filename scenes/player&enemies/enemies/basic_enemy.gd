extends CharacterBody2D

const MAX_SPEED = 60

@onready var health_component: HealthComponent = $HealthComponent
@onready var label: Label = %Label
@onready var visuals: Node2D = $Visuals


func _process(delta: float) -> void:
	var direction =  get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()
	
	var move_sign = sign(velocity.x)
	if move_sign != 0:
		visuals.scale = Vector2(-move_sign, 1)
	
	# teste vida (label)
	if health_component:
		label.text = str(health_component.current_health)
	else:
		label.text = "health_component is null"


func get_direction_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO
	
