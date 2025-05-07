Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> testWhenAShipMakesOneMoveOfTwoSquaresThenItsPositionIsTwo [

	| aBoard aShip twentySquares aSetDice aBlackHole sideToRoll |
	twentySquares := 20.
	aBlackHole := BlackHole between: 3 and: 10.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 2.
	aSetDice := SetDice toRoll: sideToRoll.
	self assert: (aShip move: aSetDice roll on: aBoard ) equals: 2
]

{ #category : 'tests' }
ShipTest >> testWhenAShipMakesTwoMovesOfOneSquareThenItsPositionIsTwo [

	| aBoard aShip twentySquares aSetDice aBlackHole sideToRoll |
	twentySquares := 20.
	aBlackHole := BlackHole between: 3 and: 10.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 1.
	aSetDice := SetDice toRoll: sideToRoll.
	aShip move: aSetDice roll on: aBoard .
	self assert: (aShip move: aSetDice roll on: aBoard ) equals: 2
]

{ #category : 'tests' }
ShipTest >> testWhenAShipMovesOneSquareThenItsPositionIsOne [

	| aBoard aShip twentySquares aSetDice aBlackHole sideToRoll |
	twentySquares := 20.
	aBlackHole := BlackHole between: 2 and: 10.
	aBoard := Board with: twentySquares and: aBlackHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 1.
	aSetDice := SetDice toRoll: sideToRoll.
	self assert: (aShip move: aSetDice roll on: aBoard ) equals: 1
]
