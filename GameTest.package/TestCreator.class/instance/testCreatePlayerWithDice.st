tests
testCreatePlayerWithDice
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	self assert: player position equals: 0