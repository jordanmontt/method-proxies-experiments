"
I am the handler of the instrumentation. It is me who will be implementing the methods that will be executed before and after the proxified method's execution.

In the after method, afther the object has been allocated, I delegate the action to the profiler.
"
Class {
	#name : 'RwiIllHandler',
	#superclass : 'MgkHandler',
	#instVars : [
		'profiler'
	],
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'evaluating' }
RwiIllHandler >> afterExecutionWithReceiver: receiver arguments: arguments returnValue: newlyAllocatedObject [

	profiler registerAllocation: newlyAllocatedObject.
	^ newlyAllocatedObject
]

{ #category : 'accessing' }
RwiIllHandler >> profiler [

	^ profiler
]

{ #category : 'accessing' }
RwiIllHandler >> profiler: anObject [

	profiler := anObject
]
