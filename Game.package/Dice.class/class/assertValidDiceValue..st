asserting
assertValidDiceValue: aValue
(aValue <3) ifTrue: [AssertionFailure signal: 'A dice must have 3 or more faces']. 