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

{ #category : 'validation' }
BlackHole class >> beginning: aBeginning cannotBeLargerThan: anEnd [

	aBeginning > anEnd ifTrue: [
		Error signal:
			'A Black Hole cannot be created with the beginning larger than the ending' ]
]

{ #category : 'creation' }
BlackHole class >> between: aBeginning and: anEnd [

	self cannotBeginInANegative: aBeginning.
	self cannotEndInANegative: anEnd.
	self beginning: aBeginning cannotBeLargerThan: anEnd.
	^ self new initializeBetween: aBeginning and: anEnd
]

{ #category : 'validation' }
BlackHole class >> cannotBeginInANegative: anEnd [

	anEnd <= 0 ifTrue: [
		Error signal: 'A Black Hole cannot begin in a negative square' ]
]

{ #category : 'validation' }
BlackHole class >> cannotEndInANegative: anEnd [

	anEnd <= 0 ifTrue: [
		Error signal: 'A Black Hole cannot end in a negative square' ]
]

{ #category : 'validation' }
BlackHole >> endsBefore: aDimention [

	end > aDimention ifTrue: [
		Error signal:
			'A Board cannot end before the ending of its Black Hole' ]
]

{ #category : 'validation' }
BlackHole >> fallsInto: aDimention [

	aDimention < beginning ifTrue: [
		Error signal:
			'A Black Hole cannot fall outside of its Boards dimention' ]
]

{ #category : 'comparing' }
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
