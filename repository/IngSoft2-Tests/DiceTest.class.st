Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
DiceTest >> should: anErrorBlock raise: anErrorClass withMessageText: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : 'tests' }
DiceTest >> testWhenADiceIsSetToRollASideThenItRollsThatSide [

	| aSetDice sideToRoll |
	sideToRoll := 3.
	aSetDice := LoadedDice toRoll: sideToRoll.
	self assert: aSetDice roll equals: sideToRoll
]

{ #category : 'tests' }
DiceTest >> testWhenRollingADiceWithFourSidesThenTheResultIsBetweenOneAndFour [

	| possibleSides rolledSide aDiceWithFourSides fourSides |
	fourSides := 4.
	possibleSides := #( 1 2 3 4 ) asOrderedCollection.
	aDiceWithFourSides := Dice with: fourSides.
	rolledSide := aDiceWithFourSides roll.
	self assert:
		(possibleSides anySatisfy: [ :aSide | aSide = rolledSide ])
]

{ #category : 'tests' }
DiceTest >> testWhenTheDiceHasAtLeastTwoSidesThenValid [

	| twoSides |
	twoSides := 2.
	self assert: (Dice with: twoSides) roll isNumber
]

{ #category : 'tests' }
DiceTest >> testWhenTheDiceHasLessThanTwoSidesThenInvalid [

	| oneSide |
	oneSide := 1.
	self
		should: [ Dice with: oneSide ]
		raise: Error
		withMessageText: 'Dice must have at least two sides.'
]
