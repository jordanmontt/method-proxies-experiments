Class {
	#name : 'RwiNoActionAllMethodsInstrumentator',
	#superclass : 'RwiInstrumentator',
	#category : 'MpPerfEx-InstrumentationProfilers-RWI',
	#package : 'MpPerfEx-InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'accessing' }
RwiNoActionAllMethodsInstrumentator >> newHandler: aMethod [

	^ MgkHandler new
]
