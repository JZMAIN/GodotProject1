extends Node2D

var theta:float = 0.0
@export_range(0,2*PI) var alpha: float = 0.0
# Called when the node enters the scene tree for the first time.
@export var bullet_node: PackedScene

func get_vector(angle):
	theta = angle + alpha 
	return Vector2(cos(theta), sin(theta))
	
func shoot(angle):
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.direction = get_vector(angle)
	
	get_tree().current_scene.call_deferred("add_child", bullet)

func _on_timer_timeout() -> void:
	shoot(theta) # Replace with function body.
