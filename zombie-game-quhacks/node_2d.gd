extends Node2D

func ready():
	spawn_zombie()
	spawn_zombie()
	spawn_zombie()
	spawn_zombie()
	spawn_zombie()

func spawn_zombie():
	var new_zombie = preload("res://Zombie.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_zombie.global_position = %PathFollow2D.global_position


func _on_timer_timeout():
	spawn_zombie()


func _on_player_dead():
	%GameOver.visible = true
