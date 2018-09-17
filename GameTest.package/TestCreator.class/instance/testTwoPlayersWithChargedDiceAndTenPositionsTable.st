tests
testTwoPlayersWithChargedDiceAndTenPositionsTable
	| player1 player2 dice i j |
	dice := Dice withNumberOfFaces: 6.
	player1 := Player withDice: dice.	"va a tener el dado cargado"
	player2 := Player withDice: dice.	"tiene mala suerte y tira todo 1"
	player1 rollCharged.
	i := 1.
	j := 1.
	[ i <= 5 ]
		whileTrue: [ player1 advancePositionWithValue: (player1 showRollNumber at: i).
			player2 advancePositionWithValue: 1.
			player1 showPosition >= 10
				ifTrue: [ player1 rankedWithValue: j.
					j := j + 1 .
					player2 rankedWithValue: j.].
			player2 showPosition >= 10
				ifTrue: [ player2 rankedWithValue: j.
					j := j + 1 .
					player2 rankedWithValue: j.].
			i := i + 1 ].
	self assert: player1 showRank equals: 1.
	self assert: player2 showRank equals: 2.