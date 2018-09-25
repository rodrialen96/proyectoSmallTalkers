playing
rankPlayers
	"Creo una lista ordenada con las posiciones de cada jugador"

	1 to: players size do: [ :i | ranking add: (players at: i) ].
	"Recorro esa lista y agrego el ranking de los jugadores"
	1 to: ranking size do: [ :i | (ranking at: i) rankedWithValue: i ].
	^ ranking