Class {
	#name : 'RwiMethodCounterHandler',
	#superclass : 'MgkHandler',
	#instVars : [
		'profiler',
		'method'
	],
	#category : 'MpPerfEx-InstrumentationProfilers-RWI-Handlers',
	#package : 'MpPerfEx-InstrumentationProfilers',
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
