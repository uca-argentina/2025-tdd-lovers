"
This class represent a player
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'board'
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

	board := aBoard
]

{ #category : 'accessing' }
Ship >> move: aPosition [

	^ 1
]
