Class {
	#name : 'RwiInstrumentator',
	#superclass : 'Object',
	#instVars : [
		'methodProxies',
		'profiler'
	],
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'as yet unclassified' }
RwiInstrumentator class >> new [

	self error: 'Use onProfiler: instead'
]

{ #category : 'as yet unclassified' }
RwiInstrumentator class >> onProfiler: aProfiler [

	^ self basicNew
		profiler: aProfiler;
		initialize;
		yourself
]

{ #category : 'initialization' }
RwiInstrumentator >> initialize [

	super initialize.
	methodProxies := Dictionary new
]

{ #category : 'profiling' }
RwiInstrumentator >> instrument [

	methodProxies valuesDo: #install
]

{ #category : 'accessing' }
RwiInstrumentator >> methodProxies [
	^ methodProxies
]

{ #category : 'accessing' }
RwiInstrumentator >> methodsToInstrument: aSetOfMethods [

	(aSetOfMethods collect: [ :method | method unproxifiedMethod ])
		do: [ :method |
			methodProxies
				at: method
				put: (self newMethodProxy: method) ]
]

{ #category : 'accessing' }
RwiInstrumentator >> newHandler: aMethod [ 
	^ self subclassResponsibility
]

{ #category : 'accessing' }
RwiInstrumentator >> newMethodProxy: aMethod [

	^ MgkMethodWrapper onMethod: aMethod handler: (self newHandler: aMethod)
]

{ #category : 'accessing' }
RwiInstrumentator >> profiler: aProfiler [

	profiler := aProfiler
]

{ #category : 'profiling' }
RwiInstrumentator >> uninstrument [

	methodProxies valuesDo: #uninstall
]
