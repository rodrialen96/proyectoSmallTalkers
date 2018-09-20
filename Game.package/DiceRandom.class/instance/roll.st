rolling
roll
	|rand| 
	rand:= Random new.
	rand := ((rand next * (quantityFaces  - 1)) truncated + 1).	"Genera un random entre 0 y 1 (float), lo multiplico por (caras del dado - 1) y luego le sumo 1"
	^ rand