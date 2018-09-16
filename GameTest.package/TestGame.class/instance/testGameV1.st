tests
testGameV1
	| table players ranking diceCollection |
	table := Table withSize: 100.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 showPosition >= p2 showPosition ].	"mayor posicion == mejor ranking"
	players := OrderedCollection new.
	"---------------Creo 3 jugadores con distinta cantidad de dados de distintos valores---------------"
	diceCollection := OrderedCollection new.
	diceCollection
		add: (DiceRandom  withNumberOfFaces: 10);
		add: (DiceRandom withNumberOfFaces: 15);
		add: (DiceCharged withNumberOfFaces: 20).
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').	"juega con 3 dados"
	diceCollection := OrderedCollection new.
	diceCollection
		add: (DiceRandom withNumberOfFaces: 4);
		add: (DiceRandom withNumberOfFaces: 25).
	players add: (Player withDiceCollection: diceCollection andName: 'Julian').	"juega con 2 dados"
	diceCollection := OrderedCollection new.
	diceCollection add: (DiceCharged withNumberOfFaces: 80).
	players add: (Player withDiceCollection: diceCollection andName: 'Rodri').	"juega con 1 dado"
	"---------Jugadores creados-------------"
	"Deberia quedar 1)Rodri 2)Lucas 3)Julian"
	[ table showFinish == 0 ]
		whileTrue: [ "Todos los jugadores tiran los dados y avanzan  la suma de los valores tirados"
			1 to: players size do: [ :i | 
				(players at: i) roll.
				(players at: i) advancePosition ].
			"Verifico si alguno llego al final del tablero para terminar el juego, guardo al ganador"
			1 to: players size do: [ :i | 
				(players at: i) showPosition >= table showPositions
					ifTrue: [ table finishGame.
						table winnerIs: (players at: i) showName ] ] ].
	"---------------Termina el While-----------------"
	"Creo una lista ordenada con las posiciones de cada jugador"
	1 to: players size do: [ :i | ranking add: (players at: i) ].
	"Recorro esa lista y agrego el ranking de los jugadores"
	1 to: ranking size do: [ :i | (ranking at: i) rankedWithValue: i ].
	"----------------Juego Terminado, se sabe el ganador y el ranking de cada uno--------------"
	self assert: table showFinish == 1.
	self assert: table showWinner equals: 'Julian'.
	self assert: (ranking at: 1) showName equals: 'Julian'.
	self assert: (ranking at: 2) showName equals: 'Lucas'.
	self assert: (ranking at: 3) showName equals: 'Rodri'.
	self assert: (players at: 1) showRank equals: 2.
	self assert: (players at: 2) showRank equals: 1.
	self assert: (players at: 3) showRank equals: 3.