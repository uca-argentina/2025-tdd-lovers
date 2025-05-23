Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessageText: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
BoardTest >> testWhenABoardIsCreatedAndEndsBeforeTheEndingOfItsWormHoleThenInvalid [

	| twentySquares aWormHole |
	twentySquares := 20.
	aWormHole := WormHole between: 15 and: 30.
	self
		should: [ Board with: twentySquares and: aWormHole ]
		raise: Error
		withMessageText:
		'A Board cannot end before the ending of its Worm Hole'
]

{ #category : 'tests' }
BoardTest >> testWhenABoardIsCreatedAndItsWormHoleEndsAtTheLastSquareThenInvalid [

	| twentySquares aBlackHole |
	twentySquares := 20.
	aBlackHole := WormHole between: 15 and: 20.
	self
		should: [ Board with: twentySquares and: aBlackHole ]
		raise: Error
		withMessageText:
		'A Worm Hole cannot end at the end of its Board'
]

{ #category : 'tests' }
BoardTest >> testWhenABoardIsCreatedAndTheWormHoleFallsOutsideOfTheDimentionThenInvalid [

	| twentySquares aWormHole |
	twentySquares := 20.
	aWormHole := WormHole between: 25 and: 30.
	self
		should: [ Board with: twentySquares and: aWormHole ]
		raise: Error
		withMessageText:
		'A Worm Hole cannot fall outside of its Boards length'
]

{ #category : 'tests' }
BoardTest >> testWhenABoardIsCreatedWithLessThanTwoSquaresThenInvalid [

	| aLength aWormHole |
	aLength := -1.
	aWormHole := WormHole between: 1 and: 2.
	self
		should: [ Board with: aLength and: aWormHole ]
		raise: Error
		withMessageText: 'Board must have at least two squares'
]
