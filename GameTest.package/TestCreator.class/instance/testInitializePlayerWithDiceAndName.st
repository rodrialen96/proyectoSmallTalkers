tests
testInitializePlayerWithDiceAndName
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDiceAndName: dice and: 'Lucas'.
	self assert: player name equals: 'Lucas'