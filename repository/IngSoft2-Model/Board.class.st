"
This class represent the board
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'length',
		'wormHole'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'validation' }
Board class >> lengthIsValid: aLength [

	aLength < 2 ifTrue: [
		Error signal: 'Board must have at least two squares' ]
]

{ #category : 'validation' }
Board class >> validate: aWormHole fallsInto: aLength [

	aWormHole fallsInto: aLength
]

{ #category : 'validation' }
Board class >> validate: aLength isNotEqualToTheEndOf: aWormHole [

	aWormHole endsAt: aLength
]

{ #category : 'validation' }
Board class >> validate: aLength isSmallerThanTheEndingOf: aWormHole [

	aWormHole endsBefore: aLength
]

{ #category : 'creation' }
Board class >> with: aLength and: aWormHole [

	self lengthIsValid: aLength.
	self validate: aWormHole fallsInto: aLength.
	self validate: aLength isSmallerThanTheEndingOf: aWormHole.
	self validate: aLength isNotEqualToTheEndOf: aWormHole.
	^ self new initializeWith: aLength and: aWormHole
]

{ #category : 'initialization' }
Board >> initializeWith: aLength and: aWormHole [

	length := aLength.
	wormHole := aWormHole
]

{ #category : 'accessing' }
Board >> length [

	^ length
]

{ #category : 'accessing' }
Board >> moveIfWormHoleAt: aPosition [

	^ wormHole moveIfEndPointAt: aPosition
]

{ #category : 'updating' }
Board >> update: aPosition with: aRolledNumber [

	| newPosition |
	newPosition := aPosition add: aRolledNumber with: length.
	^ newPosition
]
