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
		'finished',
		'winner',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'validation' }
Game class >> hasDices: someDices [

	someDices size < 1 ifTrue: [
		Error signal: 'The Game needs at least one dice to start.' ]
]

{ #category : 'validation' }
Game class >> hasLaps: someLaps [

	someLaps < 1 ifTrue: [
		Error signal: 'The Game needs at least one lap to start.' ]
]

{ #category : 'validation' }
Game class >> hasShips: someShips [

	someShips size < 2 ifTrue: [
		Error signal: 'The Game needs at least two ship to start.' ]
]

{ #category : 'creation' }
Game class >> with: aBoard for: someLaps and: someShips and: someDices [

	self hasDices: someDices.
	self hasShips: someShips.
	self hasLaps: someLaps.
	^ self new initializeWith: aBoard for: someLaps and: someShips and: someDices
]

{ #category : 'validation' }
Game >> canStillPlay [

	finished ifTrue: [ Error signal: 'The game has finished.' ]
]

{ #category : 'changing state' }
Game >> finish [

	finished := true
]

{ #category : 'testing' }
Game >> hasFinished [

	^ finished
]

{ #category : 'initialization' }
Game >> initializeWith: aBoard for: someLaps and: someShips and: someDices [

	board := aBoard.
	ships := someShips.
	dices := someDices.
	laps := someLaps.
	finished := false.
	winner := NullShip new.
]

{ #category : 'action' }
Game >> nextTurn [

	| shipToMove rolledNumber shipNewPosition shipInitialPosition shipFinalPosition |
	self canStillPlay.
	shipToMove := ships removeFirst.
	rolledNumber := self rollDices.
	shipInitialPosition := shipToMove actualPosition.
	shipFinalPosition := shipInitialPosition + rolledNumber.
	(board hasReachTheFinalSquare: shipFinalPosition) ifTrue: [ self finish ].
	shipNewPosition := board moveIfWormHoleAt: shipFinalPosition.
	shipToMove moveTo: shipNewPosition.
	ships add: shipToMove.
	finished ifTrue: [ winner := shipToMove ]
]

{ #category : 'printing' }
Game >> printBoard [

	| positions results winnerShip |
	
	winnerShip := 'Winner: ', winner name , String cr.
	positions := ships
		             inject: ''
		             into: [ :result :aShip |
		             result , aShip details , String cr ].
	results:= winnerShip , positions.
	^ results
]

{ #category : 'action' }
Game >> rollDices [

	| rolledNumber |
	rolledNumber := dices sum: [ :aDice | aDice roll ].

	^ rolledNumber
]
