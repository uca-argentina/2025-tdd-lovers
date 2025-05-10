"
This class represent the board
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'dimention',
		'blackHole'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'validation' }
Board class >> numberOfDimentionIsValid: aDimention [

	aDimention < 2 ifTrue: [
		Error signal: 'Board must have at least two squares' ]
]

{ #category : 'validation' }
Board class >> validate: aBlackHole fallsInto: aDimention [

	aBlackHole fallsInto: aDimention
]

{ #category : 'validation' }
Board class >> validate: aDimention isNotEqualToTheEndOf: aBlackHole [

	aBlackHole endsAt: aDimention
]

{ #category : 'validation' }
Board class >> validate: aDimention isSmallerThanTheEndingOf: aBlackHole [

	aBlackHole endsBefore: aDimention
]

{ #category : 'creation' }
Board class >> with: aDimention and: aBlackHole [

	self numberOfDimentionIsValid: aDimention.
	self validate: aBlackHole fallsInto: aDimention.
	self validate: aDimention isSmallerThanTheEndingOf: aBlackHole.
	self validate: aDimention isNotEqualToTheEndOf: aBlackHole.
	^ self new initializeWith: aDimention and: aBlackHole
]

{ #category : 'validation' }
Board >> hasReachTheFinalSquare: aPosition [

	aPosition >= dimention ifTrue: [ ^ true ].
	^ false
]

{ #category : 'initialization' }
Board >> initializeWith: aDimention and: aBlackHole [

	dimention := aDimention.
	blackHole := aBlackHole
]

{ #category : 'validation' }
Board >> validate: aPosition [

	(self hasReachTheFinalSquare: aPosition) ifTrue: [ ^ dimention ].
	^ blackHole hasAnEndingAt: aPosition
]
