Class {
	#name : 'BencherMp',
	#superclass : 'Bencher',
	#category : 'InstrumentationProfilers-Bench-New-Benchmarks',
	#package : 'InstrumentationProfilers-Bench',
	#tag : 'New-Benchmarks'
}

{ #category : 'api - profiler no safe' }
BencherMp >> useAllocationRateNoSafeProfiler [

    profiler := IllAllocationRateProfiler new.
    profiler instrumentator: (IllNoSafeInstrumentator onProfiler: profiler)
]

{ #category : 'api - profiler' }
BencherMp >> useAllocationRateProfiler [

    profiler := IllAllocationRateProfiler new
]

{ #category : 'api - profiler no safe' }
BencherMp >> useMethodCounterNoSafeProfiler [

    profiler := MethodCounterProfiler new.
    profiler
        instrumentator: (MethodCounterNoSafeInstrumentator onProfiler: profiler);
        methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler' }
BencherMp >> useMethodCounterProfiler [

    profiler := MethodCounterProfiler new
                    methodsToInstrument: methodsToInstrument;
                    yourself
]

{ #category : 'api - profiler no safe' }
BencherMp >> useNoActionAllMethodsNoSafeProfiler [

    profiler := MethodCounterProfiler new.
    profiler instrumentator: (MCGMpInstrumentatorNoActionNoSafe onProfiler: profiler).
    profiler methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler' }
BencherMp >> useNoActionAllMethodsProfiler [

    profiler := MethodCounterProfiler new.
    profiler instrumentator: (MCGMpInstrumentatorNoAction onProfiler: profiler).
    profiler methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler no safe' }
BencherMp >> useNoActionAllocatorMethodsNoSafeProfiler [

    profiler := IllNoActionProfiler new.
    profiler instrumentator: (IllNoSafeInstrumentator onProfiler: profiler)
]

{ #category : 'api - profiler' }
BencherMp >> useNoActionAllocatorMethodsProfiler [

    profiler := IllNoActionProfiler new
]
