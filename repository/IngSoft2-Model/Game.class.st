Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'board',
		'ships',
		'dices'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
Game class >> hasDices: someDices [

	someDices size < 1 ifTrue: [
		Error signal: 'The Game needs at least one dice to start.' ]
]

{ #category : 'testing' }
Game class >> hasShips: someShips [

	someShips size < 1 ifTrue: [
		Error signal: 'The Game needs at least one ship to start.' ]
]

{ #category : 'creation' }
Game class >> with: aBoard and: someShips and: someDices [

	self hasDices: someDices.
	self hasShips: someShips.
	^ self new initializeWith: aBoard and: someShips and: someDices.
	
]
