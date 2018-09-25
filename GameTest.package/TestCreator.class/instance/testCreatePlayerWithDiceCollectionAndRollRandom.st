tests
testCreatePlayerWithDiceCollectionAndRollRandom
	| dice player diceCol |
	diceCol := OrderedCollection new.
	10 to: 30 do: [ :i | 
		dice := Dice withNumberOfFaces: i.
		diceCol add: dice ].
	player := Player withDiceCollection: diceCol.
	player rollRandomDiceCollection.
	self assert: diceCol size equals: 21.
	self assert: player showDice size == 0.
	self assert: (player rollNumber between: 1 and: 30).