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
GameTest >> testWhenAPlayerTryToRollTheDicesWhenTheGameHasFinishedThenItFails [

	| fiveSquares aWormHole aGame sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices |
	fiveSquares := 5.
	sideToRoll := 5.
	
	aWormHole := WormHole between: 2 and: 3.
	aBlueShip := Ship called: 'BlueShip'.
	aBlackShip := Ship called: 'BlackShip'.
	aLoadedDice := LoadedDice toRoll: sideToRoll.
	aBoard := Board with: fiveSquares and: aWormHole.
	
	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someShips add: aBlackShip.
	someDices add: aLoadedDice.
	aGame := Game with: aBoard and: someShips and: someDices.
	
	aGame nextTurn.
	self
		should: [ aGame nextTurn ]
		raise: Error
		withMessageText: 'The game has finished.'
]

{ #category : 'tests' }
GameTest >> testWhenAShipMovesOneSquareThenTheBoardIsPrintedCorrectly [

	| fiveSquares aWormHole aGame expectedDetails sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices |
	fiveSquares := 5.
	sideToRoll := 1.
	
	aWormHole := WormHole between: 2 and: 3.
	aBlueShip := Ship called: 'BlueShip'.
	aBlackShip := Ship called: 'BlackShip'.
	aLoadedDice := LoadedDice toRoll: sideToRoll.
	aBoard := Board with: fiveSquares and: aWormHole.
	
	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someShips add: aBlackShip.
	someDices add: aLoadedDice.
	aGame := Game with: aBoard and: someShips and: someDices.
	
	expectedDetails := 'Winner: There is not a winner yet', String cr , 'BlackShip: 0' , String cr , 'BlueShip: 1' , String cr.
	
	aGame nextTurn.
	
	self assert: aGame printBoard equals: expectedDetails
]

{ #category : 'tests' }
GameTest >> testWhenAShipReachesTheFinalSquareThenTheGameEnds [

	| fiveSquares aWormHole aGame sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices |
	fiveSquares := 5.
	sideToRoll := 2.
	
	aWormHole := WormHole between: 2 and: 3.
	aBlueShip := Ship called: 'BlueShip'.
	aBlackShip := Ship called: 'BlackShip'.
	aLoadedDice := LoadedDice toRoll: sideToRoll.
	aBoard := Board with: fiveSquares and: aWormHole.
	
	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someShips add: aBlackShip.
	someDices add: aLoadedDice.
	aGame := Game with: aBoard and: someShips and: someDices.
	
	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	
	self assert: (aGame hasFinished)
]

{ #category : 'tests' }
GameTest >> testWhenTheGameEndsThenTheWinnerIsShownOnTheLeaderBoard [

	| fiveSquares aWormHole aGame expectedDetails sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices |
	fiveSquares := 5.
	sideToRoll := 2.
	
	aWormHole := WormHole between: 2 and: 3.
	aBlueShip := Ship called: 'BlueShip'.
	aBlackShip := Ship called: 'BlackShip'.
	aLoadedDice := LoadedDice toRoll: sideToRoll.
	aBoard := Board with: fiveSquares and: aWormHole.
	
	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someShips add: aBlackShip.
	someDices add: aLoadedDice.
	aGame := Game with: aBoard and: someShips and: someDices.
	
	expectedDetails := 'Winner: BlueShip' , String cr , 'BlackShip: 3' , String cr ,'BlueShip: 5' , String cr.
	
	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	
	self
		assert: aGame printBoard
		equals: expectedDetails
]

{ #category : 'tests' }
GameTest >> testWhenThereAreLessThanTwoShipsThenTheGameIsInvalid [

	| fiveSquares aWormHole aBlueShip aLoadedDice sideToRoll aBoard someShips someDices |
	fiveSquares := 5.
	sideToRoll := 2.
	
	aWormHole := WormHole between: 1 and: 2.
	
	aBlueShip := Ship called: 'BlueShip'.
	aLoadedDice := LoadedDice toRoll: sideToRoll.
	aBoard := Board with: fiveSquares and: aWormHole.
	
	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someDices add: aLoadedDice.
	self
		should: [ Game with: aBoard and: someShips and: someDices. ]
		raise: Error
		withMessageText: 'The Game needs at least two ship to start.'
]

{ #category : 'tests' }
GameTest >> testWhenThereAreNotAnyDicesThenTheGameIsInvalid [

	| fiveSquares aWormHole aBlueShip aBoard someShips someDices |
	fiveSquares := 5.
	aWormHole := WormHole between: 1 and: 2.
	
	aBlueShip := Ship called: 'BlueShip'.
	aBoard := Board with: fiveSquares and: aWormHole.
	
	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	
	self
		should: [ Game with: aBoard and: someShips and: someDices. ]
		raise: Error
		withMessageText: 'The Game needs at least one dice to start.'
]
