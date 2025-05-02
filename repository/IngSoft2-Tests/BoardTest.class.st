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
