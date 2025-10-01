Class {
	#name : 'SingletonClasToTest',
	#superclass : 'Object',
	#instVars : [
		'counter'
	],
	#classVars : [
		'Current'
	],
	#category : 'MpPerfEx-Tests-SourceCodeModificator',
	#package : 'MpPerfEx-Tests',
	#tag : 'SourceCodeModificator'
}

{ #category : 'accessing' }
SingletonClasToTest class >> current [

	^ Current ifNil: [ Current := self new ]
]

{ #category : 'class initialization' }
SingletonClasToTest class >> reset [

	Current := nil
]

{ #category : 'accessing' }
SingletonClasToTest >> counter [

	^ counter
]

{ #category : 'accessing' }
SingletonClasToTest >> decrement [

	counter := counter - 1
]

{ #category : 'accessing' }
SingletonClasToTest >> increment [

	counter := counter + 1
]

{ #category : 'initialization' }
SingletonClasToTest >> initialize [

	super initialize.
	counter := 0
]
