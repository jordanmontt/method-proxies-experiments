Class {
	#name : 'MobibycExperiment',
	#superclass : 'Object',
	#instVars : [
		'profilerClass'
	],
	#category : 'MethodProxies-Validation-Paper',
	#package : 'MethodProxies-Validation-Paper'
}

{ #category : 'running' }
MobibycExperiment >> run [

	profilerClass new profileOn: [ ACExReMobidyc new run ]
]

{ #category : 'running' }
MobibycExperiment >> useAllocationCallGraphProfiler [

	profilerClass := AllocationCallGraphProfiler new
]

{ #category : 'running' }
MobibycExperiment >> useAllocationRateProfiler [

	profilerClass := IllAllocationRateProfiler new
]

{ #category : 'running' }
MobibycExperiment >> useCallGraphProfiler [

	profilerClass := MethodCallGraphProfiler new
]

{ #category : 'running' }
MobibycExperiment >> useNoActionProfiler [

	profilerClass := MethodCallGraphProfiler new instrumentator: MCGMpInstrumentatorNoAction new
]
