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
BoardTest >> testWhenABoardIsCreatedWithInvalidDimentionThenInvalid [

	| aBoard aShip aDimention |
	aDimention := -1.
	self
		should: [ Board with: aDimention ]
		raise: Error
		withMessageText: 'Board must have at least one sides'
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerDoAMoveOfOneSquareThenItsPositionIsOne [

	| aBoard aShip |
	aBoard := Board with: 20.
	aShip := Ship with: aBoard.
	self assert: (aShip move: 1) equals: 1
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerDoOneMoveOfTwoSquaresThenItsPositionIsTwo [

	| aBoard aShip |
	aBoard := Board with: 20.
	aShip := Ship with: aBoard.
	self assert: (aShip move: 2) equals: 2
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerDoTwoMovesOfOneSquareThenItsPositionIsTwo [

	| aBoard aShip |
	aBoard := Board with: 20.
	aShip := Ship with: aBoard.
	aShip move: 1.
	self assert: (aShip move: 1) equals: 2
]

{ #category : 'tests' }
BoardTest >> testWhenAPlayerReachTheFinalSquare [

	| aBoard aShip |
	aBoard := Board with: 3.
	aShip := Ship with: aBoard.
	self assert: (aShip move: 3) equals: 'You win the game'
]
