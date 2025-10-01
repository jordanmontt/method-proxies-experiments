Extension { #name : 'IllAbstractProfiler' }

{ #category : '*MpPerfEx-InstrumentationProfilers' }
IllAbstractProfiler >> instrumentNoSafe [

	instrumentator instrumentNoSafe
]

{ #category : '*MpPerfEx-InstrumentationProfilers' }
IllAbstractProfiler >> startProfilingNoSafe [

	self initializeVMStats.
	self instrumentNoSafe
]
