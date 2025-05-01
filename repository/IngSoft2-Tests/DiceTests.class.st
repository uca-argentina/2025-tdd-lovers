Class {
	#name : 'DiceTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTests >> testWhenTheDiceHasAtLeastTwoFacesThenValid [

	self assert: (Dice withSides: 2).
]

{ #category : 'tests' }
DiceTests >> testWhenTheDiceHasLessThanTwoFacesThenInvalid [

	self deny: (Dice withSides: 1).
]
