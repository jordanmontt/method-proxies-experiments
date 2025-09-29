Class {
	#name : 'RwiMethodCounterInstrumentator',
	#superclass : 'RwiInstrumentator',
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiMethodCounterInstrumentator >> newHandler: aMethod [

    ^ RwiMethodCounterHandler onProfiler: profiler
]
