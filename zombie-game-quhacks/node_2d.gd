extends Node2D

@onready var path_follow = %PathFollow2D


func spawn_zombie():
	var new_zombie = preload("res://Zombie.tscn").instantiate()
	path_follow.progress_ratio = randf()
	new_zombie.global_position = path_follow.global_position
	add_child(new_zombie)

func _on_timer_timeout():
	spawn_zombie()


func _on_player_dead():
	%GameOver.visible = true
