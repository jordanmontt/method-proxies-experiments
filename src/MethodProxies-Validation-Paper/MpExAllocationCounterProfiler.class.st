Class {
	#name : 'MpExAllocationCounterProfiler',
	#superclass : 'IllAbstractProfiler',
	#instVars : [
		'allocationCounter'
	],
	#category : 'MethodProxies-Validation-Paper-Profilers-AllocationCounter',
	#package : 'MethodProxies-Validation-Paper',
	#tag : 'Profilers-AllocationCounter'
}

{ #category : 'initialization' }
MpExAllocationCounterProfiler >> initialize [

	super initialize.
	allocationCounter := 0.
	self samplingRate: 1
]

{ #category : 'profiling' }
MpExAllocationCounterProfiler >> internalRegisterAllocation: anObject [

	allocationCounter := allocationCounter + 1
]
