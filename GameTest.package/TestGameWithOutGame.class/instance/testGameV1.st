tests
testGameV1
	| table players ranking diceCollection |
	table := Table withSize: 100.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 position >= p2 position ].	"mayor posicion == mejor ranking"
	players := OrderedCollection new.
	"---------------Creo 3 jugadores con distinta cantidad de dados de distintos valores---------------"
	diceCollection := OrderedCollection new.
	diceCollection
		add: (DiceCharged withNumberOfFaces: 10);
		add: (DiceCharged withNumberOfFaces: 15);
		add: (DiceCharged withNumberOfFaces: 20).
	players add: (Player withDiceCollection: diceCollection andName: 'Lucas').	"juega con 3 dados"
	diceCollection := OrderedCollection new.
	diceCollection
		add: (DiceCharged withNumberOfFaces: 4);
		add: (DiceCharged withNumberOfFaces: 6).
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
				(players at: i) position >= table positions
					ifTrue: [ table finishGame.
						table winnerIs: (players at: i) name ] ] ].
	"---------------Termina el While-----------------"
	"Creo una lista ordenada con las posiciones de cada jugador"
	1 to: players size do: [ :i | ranking add: (players at: i) ].
	"Recorro esa lista y agrego el ranking de los jugadores"
	1 to: ranking size do: [ :i | (ranking at: i) rankedWithValue: i ].
	"----------------Juego Terminado, se sabe el ganador y el ranking de cada uno--------------"
	self assert: table showFinish == 1.
	self assert: table showWinner equals: 'Rodri'.
	self assert: (ranking at: 1) name equals: 'Rodri'.
	self assert: (ranking at: 2) name equals: 'Lucas'.
	self assert: (ranking at: 3) name equals: 'Julian'.
	self assert: (players at: 1) rank equals: 2.
	self assert: (players at: 2) rank equals: 3.
	self assert: (players at: 3) rank equals: 1.