Class {
	#name : 'MethodCounterNoSafeInstrumentator',
	#superclass : 'MethodCounterInstrumentator',
	#category : 'InstrumentationProfilers-NoSafe',
	#package : 'InstrumentationProfilers',
	#tag : 'NoSafe'
}

{ #category : 'as yet unclassified' }
MethodCounterNoSafeInstrumentator >> install [

    methodProxies valuesDo: [ :mp | mp installNoSafe ]
]
