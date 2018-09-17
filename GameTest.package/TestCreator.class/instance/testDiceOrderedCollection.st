tests
testDiceOrderedCollection
	| dice ordCol |
	ordCol := OrderedCollection new.
	10 to: 15 do: [ :i | 
		dice := Dice withNumberOfFaces: i.
		ordCol add: dice ].
	self assert: (ordCol at: 3) faceValue equals: 12.
	
"ordCol -→ an OrderedCollection(10 11 12 13 14 15)"