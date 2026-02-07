extends CharacterBody2D

@export var SPEED = 100
@onready var health_bar = $CanvasLayer/HealthBar

var playerHealth = 5

func _ready():
	health_bar.value = playerHealth

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED

func _physics_process(_delta):
	get_input()
	move_and_slide()
	look_at(get_global_mouse_position())

	
