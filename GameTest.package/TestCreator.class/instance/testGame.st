tests
testGame
	| table players ranking diceCollection |
	table := Table withSize: 100.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 showPosition >= p2 showPosition ].	"mayor posicion == mejor ranking"
	players := OrderedCollection new.
	"---------------Creo 3 jugadores con distinta cantidad de dados de distintos valores---------------"
	diceCollection := OrderedCollection new.
	diceCollection
		add: (Dice withNumberOfFaces: 10);
		add: (Dice withNumberOfFaces: 20);
		add: (Dice withNumberOfFaces: 30).
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').	"juega con 3 dados"
	diceCollection := OrderedCollection new.
	diceCollection
		add: (Dice withNumberOfFaces: 4);
		add: (Dice withNumberOfFaces: 6).
	players add: (Player withDiceCollection: diceCollection andName: 'Julian').	"juega con 2 dados"
	diceCollection := OrderedCollection new.
	diceCollection add: (Dice withNumberOfFaces: 80).
	players add: (Player withDiceCollection: diceCollection andName: 'Rodri').	"juega con 1 dado"
	"---------Jugadores creados-------------"
	"Deberia quedar 1)Rodri 2)Lucas 3)Julian"
	[ table showFinish == 0 ]
		whileTrue: [ "Todos los jugadores tiran el dado y avanzan"
			1 to: players size do: [ :i | 
				(players at: i) rollRandomDiceCollection.
				(players at: i) advancePosition ].
			"Verifico si alguno llego al final del tablero para terminar el juego, guardo al ganador"
			1 to: players size do: [ :i | 
				"---------------Termina el While-----------------"
				(players at: i) showPosition >= table showPositions
					ifTrue: [ table finishGame.
						table winnerIs: (players at: i) showName ] ] ].
	"Creo una lista ordenada con las posiciones de cada jugador"
	1 to: players size do: [ :i | ranking add: (players at: i) ].
	"Recorro esa lista y agrego el ranking de los jugadores"
	1 to: ranking size do: [ :i | (ranking at: i) rankedWithValue: i ].
	"----------------Juego Terminado, se sabe el ganador y el ranking de cada uno--------------"
	self assert: table showFinish == 1.
	self assert: table showWinner equals: 'Rodri'.
	self assert: (ranking at: 1) showName equals: 'Rodri'.
	self assert: (ranking at: 2) showName equals: 'Lucas'.
	self assert: (ranking at: 3) showName equals: 'Julian'.
	self assert: (players at: 1) showRank equals: 2.
	self assert: (players at: 2) showRank equals: 3.
	self assert: (players at: 3) showRank equals: 1