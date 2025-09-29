Class {
	#name : 'RwiMethodCallGraphInstrumentator',
	#superclass : 'RwiInstrumentator',
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiMethodCallGraphInstrumentator >> newHandler: aMethod [

	^ RwiMethodCallGraphHandler onMethod: aMethod profiler: profiler
]
