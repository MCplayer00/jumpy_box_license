extends KinematicBody2D # The player is a kinematic body, hence extends Kine..
class_name player
# Adjustable variables of the player
# export is used to allow to edit the values outside the script
export var speed = 500 # The speed of the character
export var gravity = 32 # The gravity of the character
export var jumpforce = 800 # The jump force of the character
export var can_die = true
var is_died = false
var motion = Vector2.ZERO 
signal die
func _physics_process(delta): 
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("right"): # If the player enters the right arrow
		motion.x = speed # then the x coordinates of the vector be positive
	elif Input.is_action_pressed("left"): # If the player enters the left arrow
		motion.x = -speed # then the x coordinates of the vector be negative
	else: # If none of these are pressed
		motion.x = lerp(motion.x, 0, 0.25) # set the x to 0 by smoothly transitioning by 0.25
	if is_on_floor(): # If the ground checker is colliding with the ground
		if Input.is_action_pressed("jump"): # And the player hits the up arrow key
			motion.y = -jumpforce # then jump by jumpforce
	
	motion.y += gravity + delta # Always make the player fall down
	
	motion = move_and_slide(motion, Vector2.UP)
	#Player Should Die When Fall
func die():
	if not is_died:
		emit_signal("die")
		is_died = true
		$AnimationPlayer.play("Die")
