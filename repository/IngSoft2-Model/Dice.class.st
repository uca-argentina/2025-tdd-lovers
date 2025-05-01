Class {
	#name : 'Dice',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Dice class >> withSides: numberOfSides [

	numberOfSides >= 2 ifTrue: [ ^ true ].
	^ false
]
