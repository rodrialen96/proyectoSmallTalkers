initialization
initializeWithname: aName withPlayers: playersColletion withTableSize: aSize
	finish := false.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 position >= p2 position ].
	name := aName.
	players := playersColletion.
	table := Table withSize: aSize