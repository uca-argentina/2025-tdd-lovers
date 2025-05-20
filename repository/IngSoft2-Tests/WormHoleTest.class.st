Class {
	#name : 'WormHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
WormHoleTest >> should: anErrorBlock raise: anErrorClass withMessageText: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
WormHoleTest >> testWhenAShipLandsOnTheBeginningOfAWormHoleThenItEndsUpAtTheEndOfIt [

	| aBoard aShip twentySquares aSetDice aWormHole sideToRoll |
	twentySquares := 20.
	aWormHole := WormHole between: 2 and: 10.
	aBoard := Board with: twentySquares and: aWormHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 2.
	aSetDice := LoadedDice toRoll: sideToRoll.
	self assert: (aShip move: aSetDice roll on: aBoard) equals: 10
]

{ #category : 'tests' }
WormHoleTest >> testWhenAShipLandsOnTheEndOfAWormHoleThenItEndsUpAtTheBeginningOfIt [

	| aBoard aShip twentySquares aSetDice aWormHole sideToRoll |
	twentySquares := 20.
	aWormHole := WormHole between: 2 and: 5.
	aBoard := Board with: twentySquares and: aWormHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 5.
	aSetDice := LoadedDice toRoll: sideToRoll.
	self assert: (aShip move: aSetDice roll on: aBoard) equals: 2
]

{ #category : 'tests' }
WormHoleTest >> testWhenAWormHoleIsCreatedWithNegativeBeginningThenInvalid [

	self
		should: [ WormHole between: -2 and: 5 ]
		raise: Error
		withMessageText: 'A Worm Hole cannot begin in a negative square'
]

{ #category : 'tests' }
WormHoleTest >> testWhenAWormHoleIsCreatedWithNegativeEndThenInvalid [

	self
		should: [ WormHole between: 2 and: -5 ]
		raise: Error
		withMessageText: 'A Worm Hole cannot end in a negative square'
]

{ #category : 'tests' }
WormHoleTest >> testWhenAWormHoleIsCreatedWithTheBeginningLargerThanTheEndingThenInvalid [

	self
		should: [ WormHole between: 10 and: 5 ]
		raise: Error
		withMessageText:
		'A Worm Hole cannot be created with the beginning larger than the ending'
]
