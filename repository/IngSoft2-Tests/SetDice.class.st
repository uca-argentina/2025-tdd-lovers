"
""This Class represents a Dice set to always roll a certain Side""
"
Class {
	#name : 'SetDice',
	#superclass : 'Dice',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'creation' }
SetDice class >> toRoll: aSide [

	^ self new initializeToRoll: aSide
]

{ #category : 'initialization' }
SetDice >> initializeToRoll: aSide [

	numberOfSides := aSide.
	initialSide := aSide
]
