Class {
	#name : 'MpExAllocationCallGraphProfiler',
	#superclass : 'IllAbstractProfiler',
	#instVars : [
		'allocationCounter',
		'allocationStacks'
	],
	#category : 'MethodProxies-Validation-Paper-Profilers-AllocationCounter',
	#package : 'MethodProxies-Validation-Paper',
	#tag : 'Profilers-AllocationCounter'
}

{ #category : 'initialization' }
MpExAllocationCallGraphProfiler >> initialize [

	super initialize.
	allocationStacks := OrderedCollection new: 100000
]

{ #category : 'profiling' }
MpExAllocationCallGraphProfiler >> registerAllocation: newlyAllocatedObject [


	| metaClass filteredContext thisAllocationStack i n |
	metaClass := newlyAllocatedObject class class.
	i := 1.
	n := 100.
	thisAllocationStack := Array new: n.

	filteredContext := thisContext "proxy method"
		sender "this is me, this profiler"
		sender "this is the AbstractProfiler"
		sender "this is the IllHandler".

	"Get the textual location of new."
	[ filteredContext receiver class = metaClass ] whileTrue: [
		thisAllocationStack
			at: i put: filteredContext compiledCode;
			at: i + 1 put: filteredContext pc - 1.
		i := i + 2.
		filteredContext := filteredContext sender ].

	"Get the rest of the stack until a limit n"
	[ filteredContext isNil or: [ i > n ] ] whileFalse: [
		thisAllocationStack
			at: i put: filteredContext compiledCode;
		 	at: i + 1 put: filteredContext pc - 1.
		i := i + 2.
		filteredContext := filteredContext sender ].

	allocationStacks := thisAllocationStack.

]
