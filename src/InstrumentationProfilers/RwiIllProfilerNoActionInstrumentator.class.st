Class {
	#name : 'RwiIllProfilerNoActionInstrumentator',
	#superclass : 'RwiIllProfilerInstrumentator',
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiIllProfilerNoActionInstrumentator >> newHandler: aMethod [

    ^ MgkHandler new
]
