Class {
	#name : 'BencherMp',
	#superclass : 'Bencher',
	#category : 'InstrumentationProfilers-Bench-New-Benchmarks',
	#package : 'InstrumentationProfilers-Bench',
	#tag : 'New-Benchmarks'
}

{ #category : 'api - profiler' }
BencherMp >> useAllocationRateProfiler [

    profiler := IllAllocationRateProfiler new
]

{ #category : 'api - profiler' }
BencherMp >> useMethodCounterProfiler [

    profiler := MethodCounterProfiler new
                    methodsToInstrument: methodsToInstrument;
                    yourself
]

{ #category : 'api - profiler' }
BencherMp >> useNoActionAllMethodsProfiler [

    profiler := MethodCounterProfiler new.
    profiler instrumentator: (MCGMpInstrumentatorNoAction onProfiler: profiler).
    profiler methodsToInstrument: methodsToInstrument
]

{ #category : 'api - profiler' }
BencherMp >> useNoActionAllocatorMethodsProfiler [

    profiler := IllNoActionProfiler new
]
