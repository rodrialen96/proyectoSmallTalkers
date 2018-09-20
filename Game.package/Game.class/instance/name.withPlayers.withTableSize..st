initialization
name: aName withPlayers: playersColletion withTableSize: aSize
	finish:=false.
	ranking := SortedCollection sortBlock: [ :p1 :p2 | p1 showPosition >= p2 showPosition ].
	name:= aName.
	players:=playersColletion.
	table := Table withSize: aSize.
	
	
	