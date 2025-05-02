"
This represent a dice
"
Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'numberOfSides'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'validation' }
Dice class >> numberOfSidesGreaterThanTwo: numberOfSides [ 
	
	numberOfSides < 2 ifTrue: [ Error signal: 'Dice must have at least two sides.' ]
]

{ #category : 'creation' }
Dice class >> withSides: numberOfSides [
	
	self numberOfSidesGreaterThanTwo: numberOfSides.
	^ self new initializeWithSides: numberOfSides.
]

{ #category : 'initialization' }
Dice >> initializeWithSides: sides [

	numberOfSides := sides
]

{ #category : 'functions' }
Dice >> roll [

	^ (1 to: numberOfSides) atRandom
]
