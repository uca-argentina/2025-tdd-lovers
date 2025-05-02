Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> testBanana [

	| aBoard aShip |
	aBoard := Board with: 20.
	aShip := Ship with: aBoard.
	self assert: (aShip move: 1) equals: 1
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
BoardTest >> testWhenAPlayerReachTheFinalSquare [

	| aBoard aShip |
	aBoard := Board with: 3.
	aShip := Ship with: aBoard.
	self assert: (aShip move: 3) equals: 'You win the game'
]
