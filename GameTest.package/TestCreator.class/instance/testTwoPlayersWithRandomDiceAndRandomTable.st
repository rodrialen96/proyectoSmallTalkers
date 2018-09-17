tests
testTwoPlayersWithRandomDiceAndRandomTable
	| player1 player2 dice table i |
	table := Table withSize: 10.
	dice := Dice withNumberOfFaces: 3.
	player1 := Player withDice: dice.
	dice := Dice withNumberOfFaces: 8.
	player2 := Player withDice: dice.	"el segundo jugador deberia ganar siempre"
	i := 0.
	[ i < 1 ]
		whileTrue: [ player1 rollRandom.
			player1 advancePosition.
			player2 rollRandom.
			player2 advancePosition.
			player1 showPosition >= table showPositions
				ifTrue: [ player1 rankedWithValue: 1.
					player2 rankedWithValue: 2.
					i := 1 ].
			player2 showPosition >= table showPositions
				ifTrue: [ player2 rankedWithValue: 1.
					player1 rankedWithValue: 2.
					i := 1 ] ].
	self assert: player1 showRank equals: 2.
	self assert: player2 showRank equals: 1