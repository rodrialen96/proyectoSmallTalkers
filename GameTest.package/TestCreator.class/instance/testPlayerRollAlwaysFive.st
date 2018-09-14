tests
testPlayerRollAlwaysFive
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	player rollAlwaysFive.
	self assert: player showRollNumber equals: 5