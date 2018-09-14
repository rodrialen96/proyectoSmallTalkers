tests
testDiceArray
	| dice array |
	array := Array new: 3.
	dice := Dice withNumberOfFaces: 4.
	array at: 1 put: dice.
	dice := Dice withNumberOfFaces: 8.
	array at: 2 put: dice.
	dice := Dice withNumberOfFaces: 5.
	array at: 3 put: dice.
	self assert: (array at: 2) faceValue equals: 8