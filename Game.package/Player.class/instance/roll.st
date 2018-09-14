rolling
roll
	| rand selectedDice |
	rand := Random new.
	dice size == 1
		ifTrue: [ rollNumber := (rand next * (dice faceValue - 1)) truncated + 1 ]
		ifFalse: [ selectedDice := (rand next * dice size) truncated + 1.	"elige un dado random de todos los que tiene"
			rand := Random new.
			rollNumber := (rand next * ((dice at: selectedDice) faceValue - 1)) truncated + 1
			"Genera un random entre 0 y 1 (float), lo multiplico por (caras del dado elegido - 1) y luego le sumo 1" ]