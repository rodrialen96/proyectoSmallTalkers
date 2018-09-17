tests
testPlayerRollCharged
	| dice player sum |
	dice := Dice withNumberOfFaces: 6.
	player := Player withDice: dice.
	player rollCharged.
	sum := 0.
	1 to: 3 do: [ :i | sum := sum + player showRollNumber at: i ]. 
	self assert: sum equals: 7