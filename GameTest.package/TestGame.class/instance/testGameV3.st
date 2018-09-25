tests
testGameV3
	| players diceCollection game|
	players := OrderedCollection new.
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 8).
	players add: (Player withDiceCollection: diceCollection andName: 'Rodri').
	players add: (Player withDiceCollection: diceCollection andName: 'Julian').
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').
	"Deberia quedar 1)Rodri 2)Julian 3)Lucas"
	game := Game name: 'Ludo' withPlayers: players withTableSize: 30.
	[ game finished == false ] whileTrue: [ game play ].
	game rankPlayers.
	self assert: game finished == true.
	self assert: game winner equals: 'Rodri'.
	self assert: (game ranking at: 1) name equals: 'Rodri'.
	self assert: (game ranking at: 2) name equals: 'Julian'.
	self assert: (game ranking at: 3) name equals: 'Lucas'