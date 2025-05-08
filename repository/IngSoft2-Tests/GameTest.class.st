Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
GameTest >> should: anErrorBlock raise: anErrorClass withMessageText: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
GameTest >> testWhenAShipMovesOneSquareThenTheBoardIsPrintedCorrectly [

	| aBoard someShips someDices fiveSquares aBlackHole aShip aSetDice aGame |
	fiveSquares := 5.
	aBlackHole := BlackHole between: 2 and: 3.
	aBoard := Board with: fiveSquares and: aBlackHole.
	aShip := Ship called: 'BlueShip'.
	aSetDice := LoadedDice toRoll: 1.
	someShips := #(  ) asOrderedCollection.
	someDices := #(  ) asOrderedCollection.
	someShips add: aShip.
	someDices add: aSetDice.
	aGame := Game with: aBoard and: someShips and: someDices.
	aGame nextTurn.
	self assert: aGame printBoard equals: 'BlueShip: 1' , String cr
]

{ #category : 'tests' }
GameTest >> testWhenAShipReachesTheFinalSquareThenTheGameEnds [

	| aBoard someShips someDices fiveSquares aBlackHole aShip aSetDice aGame |
	fiveSquares := 5.
	aBlackHole := BlackHole between: 2 and: 3.
	aBoard := Board with: fiveSquares and: aBlackHole.
	aShip := Ship called: 'BlueShip'.
	aSetDice := LoadedDice toRoll: 2.
	someShips := #(  ) asOrderedCollection.
	someDices := #(  ) asOrderedCollection.
	someShips add: aShip.
	someDices add: aSetDice.
	aGame := Game with: aBoard and: someShips and: someDices.
	aGame nextTurn.
	self assert: aGame nextTurn equals: 'The game has ended.'
]

{ #category : 'tests' }
GameTest >> testWhenTheGameEndsThenTheTheWinnerIsShownOnTheLeaderBoard [

	| aBoard someShips someDices fiveSquares aBlackHole aShip aSetDice aGame |
	fiveSquares := 5.
	aBlackHole := BlackHole between: 2 and: 3.
	aBoard := Board with: fiveSquares and: aBlackHole.
	aShip := Ship called: 'BlueShip'.
	aSetDice := LoadedDice toRoll: 2.
	someShips := #(  ) asOrderedCollection.
	someDices := #(  ) asOrderedCollection.
	someShips add: aShip.
	someDices add: aSetDice.
	aGame := Game with: aBoard and: someShips and: someDices.
	aGame nextTurn.
	aGame nextTurn.
	self
		assert: aGame printBoard
		equals: 'BlueShip: You win the game' , String cr
]

{ #category : 'tests' }
GameTest >> testWhenThereAreNotAnyDicesThenTheGameIsInvalid [

	| aBoard someShips someDices fiveSquares aBlackHole aShip |
	fiveSquares := 5.
	aBlackHole := BlackHole between: 1 and: 2.
	aBoard := Board with: fiveSquares and: aBlackHole.
	aShip := Ship called: 'BlueShip'.
	someShips := #( aShip ) asOrderedCollection.
	someDices := #(  ) asOrderedCollection.
	self
		should: [ Game with: aBoard and: someShips and: someDices ]
		raise: Error
		withMessageText: 'The Game needs at least one dice to start.'
]

{ #category : 'tests' }
GameTest >> testWhenThereAreNotAnyShipsThenTheGameIsInvalid [

	| aBoard someShips someDices fiveSquares aBlackHole aDice twoSides |
	fiveSquares := 5.
	aBlackHole := BlackHole between: 1 and: 2.
	aBoard := Board with: fiveSquares and: aBlackHole.
	someShips := #(  ) asOrderedCollection.
	twoSides := 2.
	aDice := Dice with: twoSides.
	someDices := #( aDice ) asOrderedCollection.
	self
		should: [ Game with: aBoard and: someShips and: someDices ]
		raise: Error
		withMessageText: 'The Game needs at least one ship to start.'
]
