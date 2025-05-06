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
GameTest >> testWhenTheBoardIsInvalidThenTheGameIsInvalid [

	"ayuda por favor"
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

	| aBoard someShips someDices fiveSquares aBlackHole aDice |
	fiveSquares := 5.
	aBlackHole := BlackHole between: 1 and: 2.
	aBoard := Board with: fiveSquares and: aBlackHole.
	someShips := #(  ) asOrderedCollection.
	aDice := Dice withSides: 2.
	someDices := #( aDice ) asOrderedCollection.
	self
		should: [ Game with: aBoard and: someShips and: someDices ]
		raise: Error
		withMessageText: 'The Game needs at least one ship to start.'
]
