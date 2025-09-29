Class {
	#name : 'BencherRwi',
	#superclass : 'Bencher',
	#category : 'InstrumentationProfilers-Bench-New-Benchmarks',
	#package : 'InstrumentationProfilers-Bench',
	#tag : 'New-Benchmarks'
}

{ #category : 'api - profiler' }
BencherRwi >> useAllocationRateProfiler [

	profiler := IllAllocationRateProfiler new.
	profiler instrumentator: (RwiIllProfilerInstrumentator onProfiler: profiler)
]

{ #category : 'api - profiler' }
BencherRwi >> useMethodCounterProfiler [

    profiler := MethodCounterProfiler new.
    profiler
        instrumentator: (RwiMethodCounterInstrumentator onProfiler: profiler);
        methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler' }
BencherRwi >> useNoActionAllMethodsProfiler [

    profiler := MethodCounterProfiler new.
    profiler
        instrumentator: (RwiNoActionAllMethodsInstrumentator onProfiler: profiler);
        methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler' }
BencherRwi >> useNoActionAllocatorMethodsProfiler [

    profiler := IllNoActionProfiler new.
    profiler instrumentator: (RwiIllProfilerNoActionInstrumentator onProfiler: profiler)
]
