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
Ship >> actualPosition [

	^ position
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

{ #category : 'update' }
Ship >> move: aPosition [

	position := position + aPosition
]

{ #category : 'update' }
Ship >> moveTo: aPosition [

	position := aPosition
]

{ #category : 'accessing' }
Ship >> name [
	^ name
]
