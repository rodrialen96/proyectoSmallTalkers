tests
testCanICreateDice
	| dice |
	dice := Dice withNumberOfFaces: 6.
	self assert: dice faceValue equals: 6.