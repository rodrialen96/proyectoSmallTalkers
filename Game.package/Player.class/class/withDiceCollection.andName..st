initialization
withDiceCollection: aDiceCollection andName: aName
	self assertWithValidValueOfDices: aDiceCollection.
	^ self new initializeWithDiceCollection: aDiceCollection andName: aName