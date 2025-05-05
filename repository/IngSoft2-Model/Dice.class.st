"
This represent a dice
"
Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'numberOfSides',
		'initialSide'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'validation' }
Dice class >> numberOfSidesGreaterThanTwo: numberOfSides [ 
	
	numberOfSides < 2 ifTrue: [ Error signal: 'Dice must have at least two sides.' ]
]

{ #category : 'creation' }
Dice class >> withSide: aSide [ 
	^ self new initializeWithSide: aSide.
]

{ #category : 'creation' }
Dice class >> withSides: numberOfSides [
	
	self numberOfSidesGreaterThanTwo: numberOfSides.
	^ self new initializeWithSides: numberOfSides.
]

{ #category : 'initialization' }
Dice >> initializeWithSide: aSide [ 
	
	numberOfSides := aSide.
	initialSide := aSide.
]

{ #category : 'initialization' }
Dice >> initializeWithSides: sides [

	numberOfSides := sides.
	initialSide := 1.
]

{ #category : 'functions' }
Dice >> roll [

	^ (initialSide to: numberOfSides) atRandom
]
