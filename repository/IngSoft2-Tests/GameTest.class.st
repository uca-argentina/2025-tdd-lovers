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

	| fiveSquares aWormHole aGame aGameBuilder sideToRoll |
	fiveSquares := 5.
	sideToRoll := 5.
	aWormHole := WormHole between: 2 and: 3.
	aGameBuilder := GameBuilder new.
	aGameBuilder ship: 'BlueShip'.
	aGameBuilder ship: 'BlackShip'.
	aGameBuilder loadedDice: sideToRoll.
	aGameBuilder board: fiveSquares with: aWormHole. 
	aGame := aGameBuilder build.
	aGame nextTurn.
	self
		should: [ aGame nextTurn ]
		raise: Error
		withMessageText: 'The game has finished.'
]

{ #category : 'tests' }
GameTest >> testWhenAShipMovesOneSquareThenTheBoardIsPrintedCorrectly [

	| fiveSquares aWormHole aGame expectedDetails sideToRoll aGameBuilder |
	fiveSquares := 5.
	sideToRoll := 1.
	aWormHole := WormHole between: 2 and: 3.
	aGameBuilder := GameBuilder new.
	aGameBuilder ship: 'BlueShip'.
	aGameBuilder ship: 'BlackShip'.
	aGameBuilder loadedDice: sideToRoll.
	aGameBuilder board: fiveSquares with: aWormHole. 
	aGame := aGameBuilder build.
	expectedDetails := 'BlackShip: 0' , String cr , 'BlueShip: 1' , String cr.
	aGame nextTurn.
	self assert: aGame printBoard equals: expectedDetails
]

{ #category : 'tests' }
GameTest >> testWhenAShipReachesTheFinalSquareThenTheGameEnds [

	| fiveSquares aWormHole aGame aGameBuilder sideToRoll |
	fiveSquares := 5.
	sideToRoll := 2.
	aWormHole := WormHole between: 2 and: 3.
	aGameBuilder := GameBuilder new.
	aGameBuilder ship: 'BlueShip'.
	aGameBuilder ship: 'BlackShip'.
	aGameBuilder loadedDice: sideToRoll.
	aGameBuilder board: fiveSquares with: aWormHole. 
	aGame := aGameBuilder build.
	aGame nextTurn.
	aGame nextTurn.
	self assert: aGame nextTurn equals: '(Winner) BlueShip'
]

{ #category : 'tests' }
GameTest >> testWhenTheGameEndsThenTheWinnerIsShownOnTheLeaderBoard [

	| fiveSquares aWormHole aGame expectedDetails aGameBuilder sideToRoll |
	fiveSquares := 5.
	sideToRoll := 2.
	aWormHole := WormHole between: 2 and: 3.
	aGameBuilder := GameBuilder new.
	aGameBuilder ship: 'BlueShip'.
	aGameBuilder ship: 'BlackShip'.
	aGameBuilder loadedDice: sideToRoll.
	aGameBuilder board: fiveSquares with: aWormHole. 
	aGame := aGameBuilder build.
	expectedDetails := 'BlackShip: 3' , String cr ,'(Winner) BlueShip: 5' , String cr.
	aGame nextTurn.
	aGame nextTurn.
	aGame nextTurn.
	self
		assert: aGame printBoard
		equals: expectedDetails
]

{ #category : 'tests' }
GameTest >> testWhenThereAreLessThanTwoShipsThenTheGameIsInvalid [

	| fiveSquares aWormHole twoSides aGameBuilder |
	fiveSquares := 5.
	twoSides := 2.
	aWormHole := WormHole between: 1 and: 2.
	aGameBuilder := GameBuilder new.
	aGameBuilder ship: 'BlueShip'.
	aGameBuilder board: fiveSquares with: aWormHole.
	aGameBuilder dice: twoSides.
	self
		should: [ aGameBuilder build ]
		raise: Error
		withMessageText: 'The Game needs at least two ship to start.'
]

{ #category : 'tests' }
GameTest >> testWhenThereAreNotAnyDicesThenTheGameIsInvalid [

	| fiveSquares aWormHole aGameBuilder |
	fiveSquares := 5.
	aWormHole := WormHole between: 1 and: 2.
	aGameBuilder := GameBuilder new.
	aGameBuilder ship: 'Blueship'.
	aGameBuilder ship: 'Blackship'.
	aGameBuilder board: fiveSquares with: aWormHole .
	self
		should: [ aGameBuilder build. ]
		raise: Error
		withMessageText: 'The Game needs at least one dice to start.'
]
