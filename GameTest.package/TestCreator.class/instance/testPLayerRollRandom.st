tests
testPLayerRollRandom
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	player rollRandom.
	self assert: (player rollNumber between: 1 and: 6)