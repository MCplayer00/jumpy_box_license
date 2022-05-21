extends KinematicBody2D
export(int,"Up","Down") var direction
export var speed = 3
func _ready():
	if direction == 0:
		speed *= -1
func _physics_process(delta):
	position.y += speed


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if body is player:
		body.die()
