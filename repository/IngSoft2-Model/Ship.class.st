"
This class represent a player
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'board',
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Ship class >> with: aBoard [

	^ self new initializeWith: aBoard
]

{ #category : 'initialization' }
Ship >> initializeWith: aBoard [

	board := aBoard.

	position := 0
]

{ #category : 'accessing' }
Ship >> move: aPosition [

	| aNewPosition |
	aNewPosition := position + aPosition.
	position := board validate: aNewPosition.
	^ position
]
