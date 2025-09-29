Class {
	#name : 'BencherRwi',
	#superclass : 'Bencher',
	#category : 'InstrumentationProfilers-Bench-New-Benchmarks',
	#package : 'InstrumentationProfilers-Bench',
	#tag : 'New-Benchmarks'
}

{ #category : 'api - profiler' }
BencherRwi >> useAllocationCallGraphProfiler [

	profiler := IllAllocationCallGraphProfiler new.
	profiler instrumentator: (RwiIllProfilerInstrumentator onProfiler: profiler)
]

{ #category : 'api - profiler' }
BencherRwi >> useAllocationRateProfiler [

	profiler := IllAllocationRateProfiler new.
	profiler instrumentator: (RwiIllProfilerInstrumentator onProfiler: profiler)
]

{ #category : 'api - profiler' }
BencherRwi >> useMethodCallGraphProfiler [

	profiler := MethodCallGraphProfiler new.
	profiler
		instrumentator: (RwiMethodCallGraphInstrumentator onProfiler: profiler);
		methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler' }
BencherRwi >> useNoActionAllMethodsProfiler [

	profiler := MethodCallGraphProfiler new.
	profiler
		instrumentator:( RwiNoActionAllMethodsInstrumentator onProfiler: profiler);
		methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler' }
BencherRwi >> useNoActionAllocatorMethodsProfiler [

    profiler := IllNoActionProfiler new.
    profiler instrumentator: (RwiIllProfilerInstrumentatorNoAction onProfiler: profiler)
]
