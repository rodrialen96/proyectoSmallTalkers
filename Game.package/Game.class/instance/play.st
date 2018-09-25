playing
play
	1 to: players size do: [ :i | 
		finish == false
			ifTrue: [ (players at: i) roll.
				(players at: i) advancePosition.
				(players at: i) position >= table positions
					ifTrue: [ finish := true.
						winner:= (players at: i) name ] ] ]