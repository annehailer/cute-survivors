extends CharacterBody2D


@onready var health_component: HealthComponent = $HealthComponent
@onready var label: Label = %Label
@onready var visuals: Node2D = $Visuals
@onready var velocity_component: Node = $VelocityComponent


func _process(delta: float) -> void:
	velocity_component.accelerate_to_player()
	velocity_component.move(self)
	
	
	var move_sign = sign(velocity.x)
	if move_sign != 0:
		visuals.scale = Vector2(-move_sign, 1)
	
	# teste vida (label)
	if health_component:
		label.text = str(health_component.current_health)
	else:
		label.text = "health_component is null"
