extends Node2D
export var box = preload("res://Scenes/RigidBox.tscn")
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
func _input(event):
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene("res://Scenes/Game.tscn")


func _on_Timer_timeout():
	var ibox = box.instance()
	ibox.position = $CanvasLayer/Position2D.position
	$CanvasLayer.add_child(ibox)
	$Timer.wait_time = rng.randf_range(0.25,0.8)
