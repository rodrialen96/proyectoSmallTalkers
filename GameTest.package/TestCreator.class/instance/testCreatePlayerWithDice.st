tests
testCreatePlayerWithDice
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	self assert: player showPosition equals: 0