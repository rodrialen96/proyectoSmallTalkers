tests
testGameWithThreePlayersWithOneDiceEach
	| table players ranking |
	table := Table withSize: 40.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 showPosition >= p2 showPosition ].	"mayor posicion == mejor ranking"
	players := OrderedCollection new.
	players add: (Player withDiceAndName: (Dice withNumberOfFaces: 5) and: 'Julian').
	players add: (Player withDiceAndName: (Dice withNumberOfFaces: 30) and: 'Rodri').
	players add: (Player withDiceAndName: (Dice withNumberOfFaces: 10) and: 'Lucas').
	"deberian quedar 1)Rodri 2)Lucas 3)Julian"
	[ table showFinish == 0 ]
		whileTrue: [ "---------------------"
			"Todos los jugadores tiran el dado y avanzan"
			1 to: players size do: [ :i | 
				(players at: i) rollRandom.
				(players at: i) advancePosition ].
			"Verifico si alguno llego al final del tablero para terminar el juego, guardo al ganador"
			1 to: players size do: [ :i | 
				(players at: i) showPosition >= table showPositions
					ifTrue: [ table finishGame.
						table winnerIs: (players at: i) showName ] ] ].
	"---------------Termina el While-----------------"
	"Creo una lista ordenada con las posiciones de cada jugador"
	1 to: players size do: [ :i | ranking add: (players at: i) ].
	"Termina el test con el juego finalizado, y los jugadores rankeados"
	self assert: table showFinish == 1.
	self assert: table showWinner equals: 'Rodri'.
	self assert: (ranking at: 1) showName equals: 'Rodri'.
	self assert: (ranking at: 2) showName equals: 'Lucas'.
	self assert: (ranking at: 3) showName equals: 'Julian'