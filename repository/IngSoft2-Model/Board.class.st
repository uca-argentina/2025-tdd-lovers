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

{ #category : 'instance creation' }
Board class >> with: aDimention [

	^ self new initializeWith: aDimention
]

{ #category : 'initialization' }
Board >> initializeWith: aDimention [

	dimention := aDimention
]
