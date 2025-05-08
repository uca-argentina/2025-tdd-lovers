"
""This Class represents a Dice set to always roll a certain Side""
"
Class {
	#name : 'LoadedDice',
	#superclass : 'Dice',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'creation' }
LoadedDice class >> toRoll: aSide [

	^ self new initializeToRoll: aSide
]

{ #category : 'initialization' }
LoadedDice >> initializeToRoll: aSide [

	numberOfSides := aSide.
	initialSide := aSide
]
