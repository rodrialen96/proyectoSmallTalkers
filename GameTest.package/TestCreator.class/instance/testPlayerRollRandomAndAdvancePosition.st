tests
testPlayerRollRandomAndAdvancePosition
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	player rollRandom.
	player advancePosition.
	self assert: (player position) equals: (player rollNumber).