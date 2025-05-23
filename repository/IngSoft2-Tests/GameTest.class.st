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

	| fiveSquares aWormHole aGame sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices oneLap |
	fiveSquares := 5.
	sideToRoll := 5.
	oneLap := 1.

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
	aGame := Game
		         with: aBoard
		         for: oneLap
		         and: someShips
		         and: someDices.

	aGame nextTurn.
	self
		should: [ aGame nextTurn ]
		raise: Error
		withMessageText: 'The game has finished.'
]

{ #category : 'tests' }
GameTest >> testWhenAShipMakesOneLapOnTheBoardThenThePositionChangesAccordingly [

	| fiveSquares aWormHole aBlueShip aBoard someShips someDices aSetDice twoLaps aBlackShip sideToRoll aGame expectedPosition |
	fiveSquares := 5.
	twoLaps := 2.
	aWormHole := WormHole between: 2 and: 3.
	expectedPosition := Position at: 1 in: 2.

	aBlueShip := Ship called: 'BlueShip'.
	aBlackShip := Ship called: 'BlackShip'.
	sideToRoll := 6.
	aSetDice := LoadedDice toRoll: sideToRoll.
	aBoard := Board with: fiveSquares and: aWormHole.

	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someShips add: aBlackShip.
	someDices add: aSetDice.

	aGame := Game
		         with: aBoard
		         for: twoLaps
		         and: someShips
		         and: someDices.

	aGame nextTurn.

	self assert: (aBlueShip actualPosition equals: expectedPosition)
]

{ #category : 'tests' }
GameTest >> testWhenAShipMovesOneSquareThenTheBoardIsPrintedCorrectly [

	| fiveSquares aWormHole aGame expectedDetails sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices oneLap |
	fiveSquares := 5.
	sideToRoll := 1.
	oneLap := 1.

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
	aGame := Game
		         with: aBoard
		         for: oneLap
		         and: someShips
		         and: someDices.

	expectedDetails := 'Winner: There is not a winner yet' , String cr
	                   , 'BlackShip: Lap: 1 Square: 0' , String cr , 'BlueShip: Lap: 1 Square: 1'
	                   , String cr.

	aGame nextTurn.

	self assert: aGame printBoard equals: expectedDetails
]

{ #category : 'tests' }
GameTest >> testWhenAShipReachesTheFinalSquareThenTheGameEnds [

	| fiveSquares aWormHole aGame sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices oneLap |
	fiveSquares := 5.
	sideToRoll := 2.
	oneLap := 1.

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
	aGame := Game
		         with: aBoard
		         for: oneLap
		         and: someShips
		         and: someDices.

	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.

	self assert: aGame hasFinished
]

{ #category : 'tests' }
GameTest >> testWhenTheGameEndsThenTheWinnerIsShownOnTheLeaderBoard [

	| fiveSquares aWormHole aGame expectedDetails sideToRoll aBlueShip aBlackShip aLoadedDice aBoard someShips someDices oneLap |
	fiveSquares := 5.
	sideToRoll := 2.
	oneLap := 1.

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
	aGame := Game
		         with: aBoard
		         for: oneLap
		         and: someShips
		         and: someDices.

	expectedDetails := 'Winner: BlueShip' , String cr , 'BlackShip: Lap: 1 Square: 3'
	                   , String cr , 'BlueShip: Lap: 2 Square: 0' , String cr.

	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.

	self assert: aGame printBoard equals: expectedDetails
]

{ #category : 'tests' }
GameTest >> testWhenThereAreLessThanTwoShipsThenTheGameIsInvalid [

	| fiveSquares aWormHole aBlueShip aLoadedDice sideToRoll aBoard someShips someDices oneLap |
	fiveSquares := 5.
	sideToRoll := 2.
	oneLap := 1.

	aWormHole := WormHole between: 1 and: 2.

	aBlueShip := Ship called: 'BlueShip'.
	aLoadedDice := LoadedDice toRoll: sideToRoll.
	aBoard := Board with: fiveSquares and: aWormHole.

	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someDices add: aLoadedDice.
	self
		should: [
			Game
				with: aBoard
				for: oneLap
				and: someShips
				and: someDices ]
		raise: Error
		withMessageText: 'The Game needs at least two ship to start.'
]

{ #category : 'tests' }
GameTest >> testWhenThereAreNotAnyDicesThenTheGameIsInvalid [

	| fiveSquares aWormHole aBlueShip aBoard someShips someDices oneLap |
	fiveSquares := 5.
	oneLap := 1.
	aWormHole := WormHole between: 1 and: 2.

	aBlueShip := Ship called: 'BlueShip'.
	aBoard := Board with: fiveSquares and: aWormHole.

	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.

	self
		should: [
			Game
				with: aBoard
				for: oneLap
				and: someShips
				and: someDices ]
		raise: Error
		withMessageText: 'The Game needs at least one dice to start.'
]

{ #category : 'tests' }
GameTest >> testWhenThereIsLessThanOneLapThenTheGameIsInvalid [

	| fiveSquares aWormHole aBlueShip aBoard someShips someDices aDice twoSides zeroLaps aBlackShip |
	fiveSquares := 5.
	twoSides := 2.
	zeroLaps := 0.
	aWormHole := WormHole between: 1 and: 2.

	aBlueShip := Ship called: 'BlueShip'.
	aBlackShip := Ship called: 'BlackShip'.
	aDice := Dice with: twoSides.
	aBoard := Board with: fiveSquares and: aWormHole.

	someShips := OrderedCollection new.
	someDices := OrderedCollection new.
	someShips add: aBlueShip.
	someShips add: aBlackShip.
	someDices add: aDice.

	self
		should: [
			Game
				with: aBoard
				for: zeroLaps
				and: someShips
				and: someDices ]
		raise: Error
		withMessageText: 'The Game needs at least one lap to start.'
]
