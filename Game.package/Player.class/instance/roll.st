rolling
roll
	| sum |
	sum := 0.
	1 to: diceCollection size do: [ :i | sum := sum + (diceCollection at: i) roll ].
	rollNumber := sum