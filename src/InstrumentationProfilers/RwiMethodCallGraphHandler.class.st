Class {
	#name : 'RwiMethodCallGraphHandler',
	#superclass : 'MgkHandler',
	#instVars : [
		'profiler',
		'method',
		'samplingRate',
		'samplingCounter'
	],
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'instance creation' }
RwiMethodCallGraphHandler class >> new [

	self error: 'Use onMethod:profiler: instead'
]

{ #category : 'instance creation' }
RwiMethodCallGraphHandler class >> onMethod: aMethod profiler: aProfiler [

	^ self basicNew
		  initialize;
		  method: aMethod;
		  profiler: aProfiler;
		  yourself
]

{ #category : 'evaluating' }
RwiMethodCallGraphHandler >> afterExecutionWithReceiver: anObject arguments: anArrayOfObjects returnValue: returnValue [

	samplingRate = 1 ifTrue: [
		"Sampling 100% capture all"
		self afterMethod: returnValue.
		^ returnValue ].

	samplingCounter := samplingCounter + 1.
	samplingCounter > samplingRate denominator ifTrue: [ samplingCounter := 1 ].

	samplingCounter <= samplingRate numerator
		ifTrue: [ ^ self afterMethod: returnValue ]
		ifFalse: [ ^ returnValue ]
]

{ #category : 'evaluating' }
RwiMethodCallGraphHandler >> afterMethod: returnValue [

    profiler exitingMethod.
    ^ returnValue
]

{ #category : 'evaluating' }
RwiMethodCallGraphHandler >> beforeExecutionWithReceiver: anObject arguments: args [

	samplingRate = 1 ifTrue: [
		"Sampling 100% capture all"
		self beforeMethod.
		^ self ].

	samplingCounter <= samplingRate numerator
		ifTrue: [ self beforeMethod ]
		ifFalse: [ ^ self ]
]

{ #category : 'evaluating' }
RwiMethodCallGraphHandler >> beforeMethod [

    profiler enteringMethod: method
]

{ #category : 'initialization' }
RwiMethodCallGraphHandler >> initialize [

    super initialize.
    samplingCounter := 0.
    samplingRate := 1 / 100
]

{ #category : 'evaluating' }
RwiMethodCallGraphHandler >> method: aMethod [

	method := aMethod
]

{ #category : 'evaluating' }
RwiMethodCallGraphHandler >> profiler: aProfiler [

	profiler := aProfiler
]
