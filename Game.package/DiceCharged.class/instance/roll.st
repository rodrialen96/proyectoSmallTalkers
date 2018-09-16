rolling
roll
	| valueOfRoll |
	(actualValue < quantityFaces )
		ifTrue: [ valueOfRoll := actualValue + 1.
			actualValue := actualValue + 1. ]
		ifFalse: [ valueOfRoll := 1 ].
	^ valueOfRoll