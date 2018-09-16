initialization
withSize: aSize
	self assertWithValidValueOfPositions: aSize.
	^ self new initializeWithSize: aSize