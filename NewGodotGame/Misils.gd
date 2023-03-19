extends KinematicBody2D

var moviment := Vector2.ZERO
var gravetat = 100
var Velocitat_Maxima_de_Caiguda = 100
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moviment.y += gravetat*delta
	if moviment.y > Velocitat_Maxima_de_Caiguda:
		moviment.y = Velocitat_Maxima_de_Caiguda
	moviment = move_and_slide(moviment, Vector2.UP)
