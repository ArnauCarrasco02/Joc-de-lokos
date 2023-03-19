extends KinematicBody2D


var moviment := Vector2.ZERO
var gravetat = 400
var salt = -330
var Velocitat_Maxima_de_Caiguda = 500
var Velocitat_Maxima = 200
var acceleracio = 100 

func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moviment.y += gravetat*delta
	if moviment.y > Velocitat_Maxima_de_Caiguda:
		moviment.y = Velocitat_Maxima_de_Caiguda
	if Input.is_action_pressed("dreta"):
		moviment.x += acceleracio
	if Input.is_action_pressed("equerra"):
		moviment.x -= acceleracio
	else:
		moviment.x = lerp(moviment.x,0,0.2)
	if is_on_floor():
		if Input.is_action_just_pressed("adalt"):
			moviment.y = salt
	moviment.x = clamp(moviment.x,-Velocitat_Maxima,Velocitat_Maxima )
	moviment = move_and_slide(moviment, Vector2.UP)
