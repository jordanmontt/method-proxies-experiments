Class {
	#name : 'RwiMethodCounterHandler',
	#superclass : 'MgkHandler',
	#instVars : [
		'profiler',
		'method'
	],
	#category : 'InstrumentationProfilers-RWI-Handlers',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI-Handlers'
}

{ #category : 'instance creation' }
RwiMethodCounterHandler class >> onProfiler: aProfiler [

    ^ self basicNew
          initialize;
          profiler: aProfiler;
          yourself
]

{ #category : 'evaluating' }
RwiMethodCounterHandler >> afterExecutionWithReceiver: anObject arguments: anArrayOfObjects returnValue: returnValue [

    profiler executedMethod.
    ^ returnValue
]

{ #category : 'evaluating' }
RwiMethodCounterHandler >> profiler: aProfiler [

	profiler := aProfiler
]
