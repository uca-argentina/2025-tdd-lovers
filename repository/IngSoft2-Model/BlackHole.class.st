"
This is the representation of a black hole.
"
Class {
	#name : 'BlackHole',
	#superclass : 'Object',
	#instVars : [
		'beginning',
		'end'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'comparing' }
BlackHole class >> between: aBeginning and: anEnd [ 
	^ self new initializeBetween: aBeginning and: anEnd.
]

{ #category : 'accessing' }
BlackHole >> hasAnEndingAt: aPosition [

	aPosition == beginning ifTrue: [ ^ end ].
	aPosition == end ifTrue: [ ^ beginning ].

	^ aPosition
]

{ #category : 'initialization' }
BlackHole >> initializeBetween: aBeginning and: anEnd [

	beginning := aBeginning.
	end := anEnd
]
