Extension { #name : 'IllAbstractProfiler' }

{ #category : '*InstrumentationProfilers' }
IllAbstractProfiler >> instrumentNoSafe [

	instrumentator instrumentNoSafe
]

{ #category : '*InstrumentationProfilers' }
IllAbstractProfiler >> startProfilingNoSafe [

	self initializeVMStats.
	self instrumentNoSafe
]
