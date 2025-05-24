"
""This Class represents a Dice set to always roll a certain Side""
"
Class {
	#name : 'LoadedDice',
	#superclass : 'Object',
	#instVars : [
		'loadedSide'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'creation' }
LoadedDice class >> toRoll: aSide [

	^ self new initializeToRoll: aSide
]

{ #category : 'initialization' }
LoadedDice >> initializeToRoll: aSide [

	loadedSide := aSide.
]

{ #category : 'functions' }
LoadedDice >> roll [

	^ loadedSide
]

{ #category : 'functions' }
LoadedDice >> rollMaximum [

	^ loadedSide
]
