extends Node2D
export(PackedScene) var Menu
export(PackedScene) var Plat = preload("res://Scenes/Platform.tscn")
export(PackedScene) var Spike_Plat = preload("res://Scenes/Platform_Spike.tscn")
var rng = RandomNumberGenerator.new()
export var score = 0
func _on_Timer_timeout():
	make_up_platform()
	make_down_platform()
func make_up_platform():
	rng.randomize()
	if rng.randi_range(0,3) == 0:
		var platf = Spike_Plat.instance()
		platf.direction = 0
		platf.position = $Up.position
		add_child(platf)
	else:
		var platf = Plat.instance()
		platf.direction = 0
		platf.position = $Up.position
		add_child(platf)
func make_down_platform():
	rng.randomize()
	if rng.randi_range(0,3) == 0:
		var platf = Spike_Plat.instance()
		platf.direction = 1
		platf.position = $Down.position
		add_child(platf)
	else:
		var platf = Plat.instance()
		platf.direction = 1
		platf.position = $Down.position
		add_child(platf)
	


func _on_Score_timeout():
	score += 1
	$Label.text = str(score)


func _on_Player_die():
	$Score.stop()
	$GG/Score.text = "Score: " + str(score)
	$AnimationPlayer.play("GG")

func _on_retry_pressed():
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().change_scene_to(Menu)



func _on_Area2D_body_entered(body):
	if body is player:
		$BG/Area2D/StaticBody2D.show()
		body.die()
