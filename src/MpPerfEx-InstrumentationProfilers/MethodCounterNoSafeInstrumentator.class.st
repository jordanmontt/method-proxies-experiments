Class {
	#name : 'MethodCounterNoSafeInstrumentator',
	#superclass : 'MethodCounterInstrumentator',
	#category : 'MpPerfEx-InstrumentationProfilers-NoSafe',
	#package : 'MpPerfEx-InstrumentationProfilers',
	#tag : 'NoSafe'
}

{ #category : 'as yet unclassified' }
MethodCounterNoSafeInstrumentator >> install [

    methodProxies valuesDo: [ :mp | mp installNoSafe ]
]
