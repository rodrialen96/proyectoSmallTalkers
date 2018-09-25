tests
testGameV4
	| players diceCollection game |
	players := OrderedCollection new.
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 4).
	players add: (Player withDiceCollection: diceCollection andName: 'Rodri').
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 6).
	players add: (Player withDiceCollection: diceCollection andName: 'Julian').
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 3).
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').
	"Deberia quedar 1)Julian(30)  2)Rodri(20)  3)Lucas(12)"
	game := Game name: 'Ludo' withPlayers: players withTableSize: 30.
	[ game finished == false ] whileTrue: [ game play ].
	game rankPlayers.
	self assert: game finished == true.
	self assert: game winner equals: 'Julian'.
	self assert: (game ranking at: 1) name equals: 'Julian'.
	self assert: (game ranking at: 1) position equals: 30.
	self assert: (game ranking at: 2) name equals: 'Rodri'.
	self assert: (game ranking at: 2) position equals: 20.
	self assert: (game ranking at: 3) name equals: 'Lucas'.
	self assert: (game ranking at: 3) position equals: 12