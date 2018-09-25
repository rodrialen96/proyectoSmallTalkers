tests
testPlayerRollAlwaysFive
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	player rollAlwaysFive.
	self assert: player rollNumber equals: 5