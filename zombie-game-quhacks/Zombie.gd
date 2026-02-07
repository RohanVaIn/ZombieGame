extends CharacterBody2D

@onready var TARGET = $"../Player"
@export var SPEED = 50
@export var HEALTH = 3

func _physics_process(_delta):
	var direction = (TARGET.position-position).normalized()
	velocity = direction * SPEED
	look_at(TARGET.position)
	move_and_slide()

func take_damage(): 
	HEALTH -= 1
	if HEALTH == 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		body.hit()
