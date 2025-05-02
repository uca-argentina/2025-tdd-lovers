"
This class represent the board
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'dimention'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Board class >> numberOfDimentionIsValid: aDimention [

	aDimention < 2 ifTrue: [
		Error signal: 'Board must have at least two squares' ]
]

{ #category : 'instance creation' }
Board class >> with: aDimention [

	self numberOfDimentionIsValid: aDimention.
	^ self new initializeWith: aDimention
]

{ #category : 'initialization' }
Board >> initializeWith: aDimention [

	dimention := aDimention
]

{ #category : 'testing' }
Board >> validate: aPosition [

	aPosition >= dimention ifTrue: [ ^ 'You win the game' ].
	^ aPosition
]
