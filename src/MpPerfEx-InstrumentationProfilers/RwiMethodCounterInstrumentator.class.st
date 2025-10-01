Class {
	#name : 'RwiMethodCounterInstrumentator',
	#superclass : 'RwiInstrumentator',
	#category : 'MpPerfEx-InstrumentationProfilers-RWI',
	#package : 'MpPerfEx-InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiMethodCounterInstrumentator >> newHandler: aMethod [

    ^ RwiMethodCounterHandler onProfiler: profiler
]
