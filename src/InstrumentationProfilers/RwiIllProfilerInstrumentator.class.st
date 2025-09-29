Class {
	#name : 'RwiIllProfilerInstrumentator',
	#superclass : 'RwiInstrumentator',
	#category : 'InstrumentationProfilers-RWI',
	#package : 'InstrumentationProfilers',
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
            (Array class >> #new:).
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
