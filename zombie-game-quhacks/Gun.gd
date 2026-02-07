extends Node2D

const BULLET = preload("res://bullet.tscn")
@onready var AMMO = 10

func _physics_process(_delta):
    look_at(get_global_mouse_position())
    if Input.is_action_just_pressed("Shoot") && AMMO >= 1:
        shoot()
    if Input.is_action_just_pressed("Reload"):
        AMMO = 10
        %AmmoText.set_text("Ammo: " + str(AMMO) + "/10")

        
func shoot():
    var new_bullet = BULLET.instantiate()
    new_bullet.global_position = %ShootingPoint.global_position
    new_bullet.global_rotation = %ShootingPoint.global_rotation
    get_tree().current_scene.add_child(new_bullet)
    AMMO -= 1
    %AmmoText.set_text("Ammo: " + str(AMMO) + "/10")
