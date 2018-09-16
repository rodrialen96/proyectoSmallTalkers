initialization
assertWithValidValueOfDices:aCollection
	(aCollection size <= 0 ) ifTrue: [ AssertionFailure signal: 'You cant create a player without dices' ].
