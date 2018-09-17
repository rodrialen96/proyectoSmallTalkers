initialization
assertWithValidValueOfPositions: aValue
	(aValue <= 0) ifTrue: [ AssertionFailure signal: 'You cant create a table with negative values of positions' ].