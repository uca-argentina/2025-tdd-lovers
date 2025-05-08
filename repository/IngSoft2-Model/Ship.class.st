"
This class represent a player
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
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

{ #category : 'accessing' }
Ship >> details [

	^ name , ': ' , position asString
]

{ #category : 'initialization' }
Ship >> initializeCalled: aName [

	name := aName.
	position := 0
]

{ #category : 'public - executing' }
Ship >> move: aPosition on: aBoard [

	| aNewPosition |
	aNewPosition := position + aPosition.
	position := aBoard validate: aNewPosition.
	^ position
]

{ #category : 'accessing' }
Ship >> move: aPosition on: aBoard in: aGame [

	| aNewPosition |
	aNewPosition := position + aPosition.
	(aBoard hasReachTheFinalSquare: aNewPosition) ifTrue: [ aGame finish ].
	position := aBoard validate: aNewPosition.
	^ position
]

{ #category : 'update' }
Ship >> youWon [

	^ name := '(Winner) ' , name
]
