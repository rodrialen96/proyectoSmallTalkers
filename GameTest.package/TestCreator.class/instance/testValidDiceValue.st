tests
testValidDiceValue
	|dice|
	self should: [ dice:= Dice withNumberOfFaces: 2 ] raise: AssertionFailure.