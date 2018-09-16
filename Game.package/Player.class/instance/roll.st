rolling
roll
	| rand sum |
	sum := 0.
	1 to: diceCollection size do: [ :i | 
		rand := Random new.
		sum := sum + ((rand next * ((diceCollection at: i) faceValue - 1)) truncated + 1) ].
	"Genera un random entre 0 y 1 (float), lo multiplico por (caras del dado - 1) y luego le sumo 1"
	rollNumber := sum