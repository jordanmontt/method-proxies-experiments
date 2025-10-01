Class {
	#name : 'RwiIllProfilerNoActionInstrumentator',
	#superclass : 'RwiIllProfilerInstrumentator',
	#category : 'MpPerfEx-InstrumentationProfilers-RWI',
	#package : 'MpPerfEx-InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiIllProfilerNoActionInstrumentator >> newHandler: aMethod [

    ^ MgkHandler new
]
