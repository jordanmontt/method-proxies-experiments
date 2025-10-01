Class {
	#name : 'RwiIllProfilerInstrumentator',
	#superclass : 'RwiInstrumentator',
	#category : 'MpPerfEx-InstrumentationProfilers-RWI',
	#package : 'MpPerfEx-InstrumentationProfilers',
	#tag : 'RWI'
}

{ #category : 'initialization' }
RwiIllProfilerInstrumentator >> initialize [

    super initialize.
    self methodsToInstrument: {
            (Behavior >> #basicNew).
            (Behavior >> #basicNew:).
            (Behavior >> #basicNewPinned).
            (Behavior >> #basicNewPinned:).
            (Behavior >> #basicNewTenured).
            (Behavior >> #basicNewTenured:).
            (Array class lookupSelector: #new:).
            (Interval class >> #new).
            (Number >> #@).
            (Object >> #shallowCopy).
            (Object >> #clone).
            (CompiledCode >> #clone).
            (ExternalAddress >> #clone).
            (FixedBitWidthRegister >> #copy) }
]

{ #category : 'accessing' }
RwiIllProfilerInstrumentator >> newHandler: aMethod [

	^ RwiIllHandler new profiler: profiler; yourself
]
