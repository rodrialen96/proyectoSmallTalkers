tests
testPlayerRollChargedAndAvancePosition
	| dice player |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	player rollCharged.
	1 to: 3 do: [ :i | player advancePositionWithValue: (player showRollNumber at: i) ].
	self assert: (player showPosition) equals: 7.
	
	