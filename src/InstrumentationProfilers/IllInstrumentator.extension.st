Extension { #name : 'IllInstrumentator' }

{ #category : '*InstrumentationProfilers' }
IllInstrumentator >> installNoSafe [

	self proxyVariables do: #installNoSafe
]

{ #category : '*InstrumentationProfilers' }
IllInstrumentator >> instrumentNoSafe [

	self installNoSafe.
	self enableInstrumentation
]
