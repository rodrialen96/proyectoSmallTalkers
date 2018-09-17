rolling
rollRandom
	| rand |
	rand := Random new.
	rollNumber := (rand next * (dice faceValue - 1)) truncated + 1
	"Genera un random entre 0 y 1 (float), lo multiplico por (caras del dado - 1) y luego le sumo 1"