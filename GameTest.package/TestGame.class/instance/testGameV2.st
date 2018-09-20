tests
testGameV2
	"la version 2 dados cargados y siempre gana el primero que tira"

	| table players ranking diceCollection |
	table := Table withSize: 100.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 showPosition >= p2 showPosition ].	
	players := OrderedCollection new.
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 50).
	players add: (Player withDiceCollection: diceCollection andName: 'Rodri').
	players add: (Player withDiceCollection: diceCollection andName: 'Julian').
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').
	"Deberia quedar 1)Rodri 2)Julian 3)Lucas"
	[ table showFinish == 0 ]
		whileTrue: [ "Todos los jugadores tiran los dados y avanzan  la suma de los valores tirados"
			1 to: players size do: [ :i | 
				table showFinish == 0
					ifTrue: [ (players at: i) roll.
						(players at: i) advancePosition.
						(players at: i) showPosition >= table showPositions
							ifTrue: [ table finishGame.
								table winnerIs: (players at: i) showName ] ] ] ].
	"---------------Termina el While-----------------"
	"Creo una lista ordenada con las posiciones de cada jugador"
	1 to: players size do: [ :i | ranking add: (players at: i) ].
	"Recorro esa lista y agrego el ranking de los jugadores"
	1 to: ranking size do: [ :i | (ranking at: i) rankedWithValue: i ].
	"----------------Juego Terminado, se sabe el ganador y el ranking de cada uno--------------"
	self assert: table showFinish == 1.
	self assert: table showWinner equals: 'Rodri'.
	self assert: (ranking at: 1) showName equals: 'Rodri'.
	self assert: (ranking at: 2) showName equals: 'Julian'.
	self assert: (ranking at: 3) showName equals: 'Lucas'.
	self assert: (players at: 1) showRank equals: 1.
	self assert: (players at: 2) showRank equals: 2.
	self assert: (players at: 3) showRank equals: 3