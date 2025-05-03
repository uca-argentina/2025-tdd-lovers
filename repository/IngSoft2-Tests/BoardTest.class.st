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

	|aDimention |
	aDimention := -1.
	self
		should: [ Board with: aDimention ]
		raise: Error
		withMessageText: 'Board must have at least two squares'
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerMakesAMoveOfOneSquareThenItsPositionIsOne [

	| aBoard aShip twentySquares numberRoll aBlackHole |
	twentySquares := 20.
	aBlackHole := BlackHole between: 2 and: 10.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship with: aBoard.
	numberRoll := 1.
	self assert: (aShip move: numberRoll) equals: 1
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerMakesOneMoveOfTwoSquaresThenItsPositionIsTwo [

	| aBoard aShip twentySquares numberRoll aBlackHole |
	twentySquares := 20.
	aBlackHole := BlackHole between: 3 and: 10.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship with: aBoard.
	numberRoll := 2.
	self assert: (aShip move: numberRoll) equals: 2
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerMakesTwoMovesOfOneSquareThenItsPositionIsTwo [

	| aBoard aShip twentySquares numberRoll aBlackHole |
	twentySquares := 20.
	aBlackHole := BlackHole between: 3 and: 10.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship with: aBoard.
	numberRoll := 1.
	aShip move: numberRoll.
	self assert: (aShip move: numberRoll) equals: 2
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerReachesTheFinalSquare [

	| aBoard aShip threeSquares numberRoll |
	threeSquares := 3.
	aBoard := Board with: threeSquares.
	aShip := Ship with: aBoard.
	numberRoll := 3.
	self assert: (aShip move: numberRoll) equals: 'You win the game'
]
