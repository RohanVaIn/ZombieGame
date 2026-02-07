extends Area2D
var SPEED
var travelled_distance
var RANGE
func _ready():
	SPEED = 300
	travelled_distance = 0
	RANGE = 100

func _process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
