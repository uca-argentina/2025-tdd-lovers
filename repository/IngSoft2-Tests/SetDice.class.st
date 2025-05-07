"
""This Class represents a Dice set to always roll a certain Side""
"
Class {
	#name : 'SetDice',
	#superclass : 'Object',
	#instVars : [
		'sideToRoll'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'creation' }
SetDice class >> toRoll: aSide [

	^ self new initializeToRoll: aSide
]

{ #category : 'initialization' }
SetDice >> initializeToRoll: aSide [

	sideToRoll := aSide
]

{ #category : 'functions' }
SetDice >> roll [

	^ sideToRoll
]
