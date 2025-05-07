"
This class represent a player
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'board',
		'position',
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Ship class >> called: aName [

	^ self new initializeCalled: aName
]

{ #category : 'creation' }
Ship class >> with: aBoard [

	^ self new initializeWith: aBoard
]

{ #category : 'accessing' }
Ship >> details [

	^ name , ': ' , position asString 
]

{ #category : 'initialization' }
Ship >> initializeCalled: aName [

	name := aName.
	position := 0
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

{ #category : 'accessing' }
Ship >> move: aPosition on: aBoard [

	| aNewPosition |
	aNewPosition := position + aPosition.
	position := aBoard validate: aNewPosition.
	^ position
]
