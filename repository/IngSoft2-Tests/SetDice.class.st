"
""This Class represents a Dice set to always roll a certain Side""
"
Class {
	#name : 'SetDice',
	#superclass : 'Object',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'creation' }
SetDice class >> toRoll: aSide [ 
	^ Dice withSide: aSide.
]
