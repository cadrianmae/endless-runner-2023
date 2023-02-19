extends Particles


func _process(delta):
	freeParticle()

func freeParticle():
	if ( emitting == false ):
		queue_free()
