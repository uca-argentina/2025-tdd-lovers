Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> testWhenAShipMakesOneMoveOfTwoSquaresThenItsPositionIsTwo [

	| aBoard aShip twentySquares aSetDice aWormHole sideToRoll |
	twentySquares := 20.
	aWormHole := WormHole between: 3 and: 10.
	aBoard := Board with: twentySquares and: aWormHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 2.
	aSetDice := LoadedDice toRoll: sideToRoll.
	aShip move: aSetDice roll.
	self assert: aShip actualPosition equals: 2
]

{ #category : 'tests' }
ShipTest >> testWhenAShipMakesTwoMovesOfOneSquareThenItsPositionIsTwo [

	| aBoard aShip twentySquares aSetDice aWormHole sideToRoll |
	twentySquares := 20.
	aWormHole := WormHole between: 3 and: 10.
	aBoard := Board with: twentySquares and: aWormHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 1.
	aSetDice := LoadedDice toRoll: sideToRoll.
	aShip move: aSetDice roll.
	aShip move: aSetDice roll.
	self assert: aShip actualPosition equals: 2
]

{ #category : 'tests' }
ShipTest >> testWhenAShipMovesOneSquareThenItsPositionIsOne [

	| aBoard aShip twentySquares aSetDice aWormHole sideToRoll |
	twentySquares := 20.
	aWormHole := WormHole between: 2 and: 10.
	aBoard := Board with: twentySquares and: aWormHole.
	aShip := Ship called: 'BlueShip'.
	sideToRoll := 1.
	aSetDice := LoadedDice toRoll: sideToRoll.
	aShip move: aSetDice roll.
	self assert: aShip actualPosition equals: 1
]
