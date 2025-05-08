"
""This class represents a Game""
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'board',
		'ships',
		'dices',
		'finished'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
Game class >> hasDices: someDices [

	someDices size < 1 ifTrue: [
		Error signal: 'The Game needs at least one dice to start.' ]
]

{ #category : 'testing' }
Game class >> hasShips: someShips [

	someShips size < 1 ifTrue: [
		Error signal: 'The Game needs at least one ship to start.' ]
]

{ #category : 'creation' }
Game class >> with: aBoard and: someShips and: someDices [

	self hasDices: someDices.
	self hasShips: someShips.
	^ self new initializeWith: aBoard and: someShips and: someDices
]

{ #category : 'action' }
Game >> canStillPlay [

	finished ifTrue: [ Error signal: 'The game has finished.' ]
]

{ #category : 'initialization' }
Game >> finish [

	finished := true
]

{ #category : 'initialization' }
Game >> initializeWith: aBoard and: someShips and: someDices [

	board := aBoard.
	ships := someShips.
	dices := someDices.
	finished := false
]

{ #category : 'action' }
Game >> nextTurn [

	| shipToMove rolledNumber shipNewPosition |
	self canStillPlay.
	shipToMove := ships removeFirst.
	rolledNumber := self rollDices.
	shipNewPosition := shipToMove move: rolledNumber on: board in: self.
	ships add: shipToMove.
	finished ifTrue: [^ shipToMove youWon ]
]

{ #category : 'printing' }
Game >> printBoard [

	| positions |
	positions := ships
		             inject: ''
		             into: [ :result :aShip |
		             result , aShip details , String cr ].
	^ positions
]

{ #category : 'action' }
Game >> rollDices [

	| rolledNumber |
	rolledNumber := dices
		                inject: 0
		                into: [ :total :aDice | total + aDice roll ].
	^ rolledNumber
]
