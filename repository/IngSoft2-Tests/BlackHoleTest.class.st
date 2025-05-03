Class {
	#name : 'BlackHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
BlackHoleTest >> should: anErrorBlock raise: anErrorClass withMessageText: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
BlackHoleTest >> testWhenABlackHoleIsCreatedWithNegativeBeginningThenInvalid [

	self
		should: [ BlackHole between: 2 and: 5 ]
		raise: Error
		withMessageText: 'A Black Hole cannot begin in a negative space'
]

{ #category : 'tests' }
BlackHoleTest >> testWhenAShipLandsOnTheBeginningOfABlackHoleThenItEndsUpAtTheEndOfIt [

	| aBoard aShip twentySquares numberRolled aBlackHole|
	twentySquares := 20.
	aBlackHole := BlackHole between: 2 and: 10.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship with: aBoard.
	numberRolled := 2.
	self assert: (aShip move: numberRolled) equals: 10
]

{ #category : 'tests' }
BlackHoleTest >> testWhenAShipLandsOnTheEndOfABlackHoleThenItEndsUpAtTheBeginningOfIt [

	| aBoard aShip twentySquares numberRolled aBlackHole|
	twentySquares := 20.
	aBlackHole := BlackHole between: 2 and: 5.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship with: aBoard.
	numberRolled := 5.
	self assert: (aShip move: numberRolled) equals: 2
]
