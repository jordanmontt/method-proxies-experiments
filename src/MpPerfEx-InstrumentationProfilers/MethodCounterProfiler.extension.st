Extension { #name : 'MethodCounterProfiler' }

{ #category : '*MpPerfEx-InstrumentationProfilers' }
MethodCounterProfiler >> instrumentNoSafe [

	instrumentator instrumentNoSafe
]

{ #category : '*MpPerfEx-InstrumentationProfilers' }
MethodCounterProfiler >> startProfilingNoSafe [

	self instrumentNoSafe
]
