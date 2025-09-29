Class {
	#name : 'RwiIllProfilerInstrumentatorNoAction',
	#superclass : 'RwiIllProfilerInstrumentator',
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiIllProfilerInstrumentatorNoAction >> newHandler: aMethod [

    ^ MgkHandler new
]
