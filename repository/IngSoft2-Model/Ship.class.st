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

{ #category : 'instance creation' }
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

	position := board validate: aPosition .
	^ position
]
