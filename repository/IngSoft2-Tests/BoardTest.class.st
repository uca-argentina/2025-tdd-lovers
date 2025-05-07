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
BoardTest >> testWhenABoardIsCreatedAndEndsBeforeTheEndingOfItsBlackHoleThenInvalid [

	| twentySquares aBlackHole |
	twentySquares := 20.
	aBlackHole := BlackHole between: 15 and: 30.
	self
		should: [ Board with: twentySquares and: aBlackHole ]
		raise: Error
		withMessageText:
		'A Board cannot end before the ending of its Black Hole'
]

{ #category : 'tests' }
BoardTest >> testWhenABoardIsCreatedAndTheBlackHoleFallsOutsideOfTheDimentionThenInvalid [

	| twentySquares aBlackHole |
	twentySquares := 20.
	aBlackHole := BlackHole between: 25 and: 30.
	self
		should: [ Board with: twentySquares and: aBlackHole ]
		raise: Error
		withMessageText:
		'A Black Hole cannot fall outside of its Boards dimention'
]

{ #category : 'tests' }
BoardTest >> testWhenABoardIsCreatedWithLessThanTwoSquaresThenInvalid [

	| aDimention aBlackHole |
	aDimention := -1.
	aBlackHole := BlackHole between: 1 and: 2.
	self
		should: [ Board with: aDimention and: aBlackHole ]
		raise: Error
		withMessageText: 'Board must have at least two squares'
]
