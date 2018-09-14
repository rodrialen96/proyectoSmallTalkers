initialization
withNumberOfFaces: aValue
	self assertValidDiceValue: aValue.
	^ self new initializeWithFaceValue: aValue