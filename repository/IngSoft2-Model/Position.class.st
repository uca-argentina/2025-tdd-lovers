"
This class represent a Position in the game
"
Class {
	#name : 'Position',
	#superclass : 'Object',
	#instVars : [
		'square',
		'lap'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Position class >> at: aSquare in: aLap [

	^ self new initializeAt: aSquare in: aLap
]

{ #category : 'comparing' }
Position >> actualSquare [

	^ square
]

{ #category : 'adding' }
Position >> add: aRolledNumber with: aBoardLength [

	| squaresMoved lapsToAdd newSquare newLap |
	squaresMoved := square + aRolledNumber.

	lapsToAdd := squaresMoved // aBoardLength.

	newSquare := squaresMoved % aBoardLength.
	
	newLap := lap + lapsToAdd.
	
	^ self class at: newSquare in: newLap.
]

{ #category : 'adding' }
Position >> addSquare: someSquares [

	| newSquare |
	newSquare := square + someSquares.
	
	^ self class at: newSquare in: lap
]

{ #category : 'adding' }
Position >> adjustSquare: aSquare [

	^ self class at: aSquare in: lap
]

{ #category : 'converting' }
Position >> asString [

	^ 'Lap: ' , lap asString , ' ' , 'Square: ' , square asString
]

{ #category : 'comparing' }
Position >> equals: aPosition [

	^(aPosition squareEquals: square) and: (aPosition lapsEquals: lap)
]

{ #category : 'testing' }
Position >> hasCompleted: someLaps [

	^ someLaps < lap
]

{ #category : 'initialization' }
Position >> initializeAt: aSquare in: aLap [

	square := aSquare.
	lap := aLap
]

{ #category : 'comparing' }
Position >> lapsEquals: aLap [

	^ lap = aLap
]

{ #category : 'comparing' }
Position >> squareEquals: aSquare [

	^ square = aSquare
]
