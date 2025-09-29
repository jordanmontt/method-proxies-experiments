Class {
	#name : 'StackMethodNode',
	#superclass : 'Object',
	#instVars : [
		'name',
		'sender'
	],
	#category : 'InstrumentationProfilersWithMetaLinks',
	#package : 'InstrumentationProfilersWithMetaLinks'
}

{ #category : 'accessing' }
StackMethodNode >> name: aName [

	name := aName
]

{ #category : 'initialization' }
StackMethodNode >> sender: aNode [

	sender := aNode
]
