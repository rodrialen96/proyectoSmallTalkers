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
			player1 position >= table positions
				ifTrue: [ player1 rankedWithValue: 1.
					player2 rankedWithValue: 2.
					i := 1 ].
			player2 position >= table positions
				ifTrue: [ player2 rankedWithValue: 1.
					player1 rankedWithValue: 2.
					i := 1 ] ].
	self assert: player1 rank equals: 2.
	self assert: player2 rank equals: 1