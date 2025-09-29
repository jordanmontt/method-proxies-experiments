Class {
	#name : 'RwiNoActionAllMethodsInstrumentator',
	#superclass : 'RwiInstrumentator',
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiNoActionAllMethodsInstrumentator >> newHandler: aMethod [

	^ MgkHandler new
]
