Extension { #name : 'MethodCounterProfiler' }

{ #category : '*InstrumentationProfilers' }
MethodCounterProfiler >> instrumentNoSafe [

	instrumentator instrumentNoSafe
]

{ #category : '*InstrumentationProfilers' }
MethodCounterProfiler >> startProfilingNoSafe [

	self instrumentNoSafe
]
