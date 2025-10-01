Extension { #name : 'IllInstrumentator' }

{ #category : '*MpPerfEx-InstrumentationProfilers' }
IllInstrumentator >> installNoSafe [

	self proxyVariables do: #installNoSafe
]

{ #category : '*MpPerfEx-InstrumentationProfilers' }
IllInstrumentator >> instrumentNoSafe [

	self installNoSafe.
	self enableInstrumentation
]
