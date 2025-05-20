"
Game Class Builder
"
Class {
	#name : 'GameBuilder',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'dices',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'building' }
GameBuilder >> board: aLength with: aWormHole [ 
		
	board := Board with: aLength and: aWormHole. 
]

{ #category : 'building' }
GameBuilder >> build [

	^ Game with: board and: ships and: dices
]

{ #category : 'building' }
GameBuilder >> dice: numberOfSides [

	dices add: (Dice with: numberOfSides)
]

{ #category : 'initialization' }
GameBuilder >> initialize [ 

	ships := OrderedCollection new.
	dices := OrderedCollection new.
]

{ #category : 'building' }
GameBuilder >> loadedDice: aSide [

	dices add: (LoadedDice toRoll: aSide)
]

{ #category : 'building' }
GameBuilder >> ship: aName [
		
	ships add: (Ship called: aName)
]
